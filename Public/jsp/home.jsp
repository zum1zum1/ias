<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.ResponseData"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<ResponseData> responseDataList = (ArrayList<ResponseData>) session
			.getAttribute("responseDataList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>トップ画面</title>
</head>

<jsp:include page="../common/jsp/userLayout.jsp" />

<div class="container">
	<div class="row" style="padding: 100px 0 0 0">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<a href="SelectLessonServlet"> <font size="+2"> <span
					class="glyphicon glyphicon-phone" aria-hidden="true"></span>
					自己評価を行う画面に移動する
			</font>
			</a>
			<div class="image-box graph" align="center">
				<canvas id="canvassample" width="600" height="500">	</canvas>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<script type="text/javascript" src="../common/canvas/excanvas.js"></script>

<script type="text/javascript">
	// ルーブリックの値を格納する配列
	var per1list = [];
	<% for(int i=0;i<responseDataList.size();i++){ %>
		per1list.push(<%=responseDataList.get(i).getPer1()%>);
	<% } %>
	// 折れ線を書く時にy座標の位置を指定するための配列
	var responseDataToHigh = [255,205,155,105,55];
	var yoiDrawList = [220,170,120,70,20];



	function drawLine(){
		/* canvas要素のノードオブジェクト */
		var canvas = document.getElementById('canvassample');

		/* canvas要素の存在チェックとCanvas未対応ブラウザの対処 */
		if (!canvas || !canvas.getContext) {
			return false;
		}
		/* 2Dコンテキスト */
		var ctx = canvas.getContext('2d');


		// 軸のファイルを読み込む
		/* Imageオブジェクトを生成 */
		var img = new Image();
		img.src = "../img/axis_singleLine.png";
		/* 画像が読み込まれるのを待ってから処理を続行 */
		img.onload = function() {
		ctx.drawImage(img, 0, 0);
		}

		/* 一つ目の観点の折れ線を書く */
		ctx.strokeStyle = 'rgb(0,0,255)';
		ctx.beginPath(); //線を書くことの宣言
		ctx.lineWidth = 3; //線の太さ
		ctx.moveTo(50, responseDataToHigh[per1list[0]-1]); //書き始める場所を指定(1月)
		// 2回目以降はfor文であるところまで回す
		for(var i = 1 ; i < <%=responseDataList.size()%> ; i++){
			ctx.lineTo(50+i*40, responseDataToHigh[per1list[i]-1]);
		}
		ctx.stroke();
		// よい点、可能性、進歩の状況をそれぞれの観点について判定する
		// ※12回分ない場合は判定をしないようにしなくてはいけない

		var per1Yoi = analyzeYoi(per1list);

		var per1Kanousei = analyzeKanousei(per1list);

		var per1Shinpo = analyzeShinpo(per1list);

		// ※それぞれの判定に応じて、drawImageを利用してctxに画像を設置する（125-132参照）


		// よい点の描画
		if(per1Yoi == 1){
		var imgYBK = new Image();
		imgYBK.src = "../img/yoiB_scale50.png";
		imgYBK.onload = function() {
			ctx.drawImage(imgYBK, 35, yoiDrawList[per1list[0]-1]);
			for(var i = 1 ; i < 12 ; i++){
				ctx.drawImage(imgYBK, 35+i*40, yoiDrawList[per1list[i]-1]);
		}}}
		// 可能性の描画
		if(per1Kanousei == 1){
			ctx.lineWidth = 5;
			ctx.strokeStyle = 'rgb(0,128,255)';
			ctx.shadowBlur = 20;  //ぼかしの範囲を定義
			ctx.shadowColor = "#e6b422";  //ぼかしの色を定義
			ctx.beginPath();
			ctx.moveTo(370, responseDataToHigh[per1list[8]-1]);
			for(var i = 9 ; i < 12 ; i++){
				ctx.lineTo(50+i*40, responseDataToHigh[per1list[i]-1]);
			}}
		ctx.stroke(); //できた線を描画する
		ctx.shadowBlur = 0;  //ぼかし終了
		// 進歩の描画
		if(per1Shinpo == 1){
		var imgSBK = new Image();
		imgSBK.src = "../img/shinpo2B.png";
		imgSBK.onload = function() {
			ctx.drawImage(imgSBK, 340, responseDataToHigh[per1list[8]]);
		}}
		/* canvasの描画結果をPNGで取り出しimg要素にセット */
		try {
			var img_png_src = canvas.toDataURL();
			document.getElementById("image_png").src = img_png_src;
			document.getElementById("data_url_png").firstChild.nodeValue = img_png_src;
		} catch (e) {
			document.getElementById("image_png").alt = "未対応";
		}
	}

	function analyzeYoi(list){
		// ここによい点のロジックを書く

		// よい点、一つ目のロジック
		// 平均
		var ave = average(list);
		// console.log(ave);

		// 分散
		var vari = variance(list);
		// console.log(vari);

		// 2以上一気に減った回数
		var downCount = 0;
		for(var i = 0; i < 11 ; i++){
			if(list[i+1]+2<=list[i]){
				downCount++;
			}
		}
		// console.log(downCount);
		// 上の3種類の条件を総合して判定する
		var judge1 = -1;
		if(ave>=4.5 && vari <= 0.4 && downCount <=1){
			judge1 = 1;
		} else {
			judge1 = 0;
		}

		// よい点、二つ目のロジック
		// 先ずは、配列を前半と後半に分割する
		var firstHalfList = list.slice(0,6);
		var secondHalfList = list.slice(6,12);
		// console.log(firstHalfList);
		// console.log(secondHalfList);
		// 前半と後半の平均をそれぞれ求める
		var firstAve = average(firstHalfList);
		var secondAve = average(secondHalfList);

		// 後半の分散を求める
		var secondVari = variance(secondHalfList);
		// console.log(secondVari);
		// 上の条件を用いたりして判定する
		var judge2 = -1;
		if(secondAve >= 4.5 && secondVari <= 0.4 && secondAve-firstAve >= 1.3 && downCount <= 1){
			judge2 = 1;
		} else {
			judge2 = 0;
		}

		// 上の二つの判定の結果、どちらかが1だったら1を返す
		var finalJudge = -1;
		if(judge1 == 1 || judge2 == 1 ){
			return 1;
		} else {
			return 0;
		}

	}

	function analyzeKanousei(list){
		// ここに可能性のロジックを書く
		var middleList = list.slice(4,8);
		var finalList = list.slice(8,12);
		// 平均が1以上上がっている
		var middleAve = average(middleList);
		var finalAve = average(finalList);

		var averageUp = -1;
		if(middleAve+1<=finalAve){
			averageUp = 1;
		} else {
			averageUp = 0;
		}

		// 近似曲線の傾き ※まだできていないです

		// 暫定的に、いまできている条件のみで値を返す
		// console.log(averageUp);

		var middleSlope = lineSlope(middleList);
		var finalSlope = lineSlope(finalList);

		var judge = -1;

		if(middleSlope>=-0.3 && middleSlope+0.3<=finalSlope && averageUp == 1){
			judge = 1;
		} else {
			judge = 0;
		}

		return judge;

	}

	function analyzeShinpo(list){
		// ここに進歩のロジックを書く
		var ave9_10 = (list[8]+list[9])/2;
		var ave11_12 = (list[10]+list[11])/2



		// 9→12で落ちていない、最後だけ上がっているものは除く
		var upCheck = -1;
		if((list[8]<list[9] && list[9]<=list[10] && list[10]<=list[11]) || (list[8]<=list[9] && list[9]<list[10] && list[10]<=list[11])){
			upCheck = 1;
		} else {
			upCheck = 0;
		}

		// console.log(upCheck)

		// 12回目の値が1~8回目に出ていない
		var max1_8 = 1;
		var takai = -1;
		for(var i=0;i<8;i++){
			if(max1_8<list[i]){
				max1_8 = list[i];
			}
		}
		if(max1_8<list[11]){
			takai = 1;
		} else {
			takai = 0;
		}

		// 1回で2以上値が下がることが2回より少ない
		var downCount = 0;
		for(var i = 0; i < 11 ; i++){
			if(list[i+1]+2<=list[i]){
				downCount++;
			}
		}
		var judge = -1;
		if(ave9_10<ave11_12 && upCheck == 1 && takai == 1 && downCount <=1){
			return 1;
		} else {
			return 0;
		}

	}


	function drawYoi(list,picName){

	}

	function drawKanousei(list,picName){

	}

	function drawShinpo(list,picName){

	}


	//windowが読み込まれた時に、drawLineの関数を実行する
	window.onload = drawLine;


	// 計算用の関数

	// 和
	function sum(array){
	    var sum = 0;
	    for (var i=0,len=array.length; i<len; ++i) {
	        sum += array[i];
	    };
	    return sum;
	}

	// 平均
	function average(array){
	    return sum(array)/array.length;
	}

	// 分散
	function variance(array){
	    var ave = average(array);
	    var varia = 0;
	    for (i=0; i<array.length; i++) {
	        varia = varia + Math.pow(array[i] - ave, 2);
	    }
	    return (varia / array.length);
	}

	function sigmaXY(xlist,ylist){
		var sigma = 0;
		var temp = 0;
		for(i=0;i<xlist.length;i++){
			temp = xlist[i]*ylist[i];
			sigma += temp;
		}
		return sigma;
	}

	function lineSlope(ylist){
		var xlist = [1,2,3,4];
		var sample = 4;
		var xAve = average(xlist);
		var yAve = average(ylist);
		var sigmaXiXi = sigmaXY(xlist,xlist);
		var sigmaXiYi = sigmaXY(xlist,ylist);
		var slope = 0;
		slope = (sigmaXiYi-sample*xAve*yAve)/(sigmaXiXi-sample*xAve*xAve);
		// console.log(slope);
		return slope;
	}


</script>