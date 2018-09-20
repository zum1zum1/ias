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
	var per2list = [];
	var per3list = [];
	var per4list = [];
	<%for (int i = 0; i < responseDataList.size(); i++) {%>
		per1list.push(<%=responseDataList.get(i).getPer1()%>);
		per2list.push(<%=responseDataList.get(i).getPer2()%>);
		per3list.push(<%=responseDataList.get(i).getPer3()%>);
		per4list.push(<%=responseDataList.get(i).getPer4()%>);
	<%}%>
	// 折れ線を書く時にy座標の位置を指定するための配列
	var responseDataToHigh = [250,200,150,100,50];
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
		img.src = "../img/axis_0907.png";
		/* 画像が読み込まれるのを待ってから処理を続行 */
		img.onload = function() {
		ctx.drawImage(img, 0, 0);
		}

		/* 一つ目の観点の折れ線を書く */
		ctx.strokeStyle = 'rgb(0,0,0)';
		ctx.beginPath(); //線を書くことの宣言
		ctx.lineWidth = 3; //線の太さ
		ctx.moveTo(50, responseDataToHigh[per1list[0]-1]); //書き始める場所を指定(1月)
		for(var i = 1 ; i < <%=responseDataList.size()%> ; i++){
			ctx.lineTo(50+i*40, responseDataToHigh[per1list[i]-1]);
		}
		ctx.stroke();

		/* 二つ目の観点の折れ線を書く */
		ctx.strokeStyle = 'rgb(0,0,255)';
		ctx.beginPath(); //線を書くことの宣言
		ctx.lineWidth = 3; //線の太さ
		ctx.moveTo(50, responseDataToHigh[per2list[0]-1]); //書き始める場所を指定(1月)
		for(var i = 1 ; i < <%=responseDataList.size()%> ; i++){
			ctx.lineTo(50+i*40, responseDataToHigh[per2list[i]-1]);
		}
		ctx.stroke();

		/* 三つ目の観点の折れ線を書く */
		ctx.strokeStyle = 'rgb(0,255,0)';
		ctx.beginPath(); //線を書くことの宣言
		ctx.lineWidth = 3; //線の太さ
		ctx.moveTo(50, responseDataToHigh[per3list[0]-1]); //書き始める場所を指定(1月)
		for(var i = 1 ; i < <%=responseDataList.size()%> ; i++){
			ctx.lineTo(50+i*40, responseDataToHigh[per3list[i]-1]);
		}
		ctx.stroke();

		/* 四つ目の観点の折れ線を書く */
		ctx.strokeStyle = 'rgb(255,0,0)';
		ctx.beginPath(); //線を書くことの宣言
		ctx.lineWidth = 3; //線の太さ
		ctx.moveTo(50, responseDataToHigh[per4list[0]-1]); //書き始める場所を指定(1月)
		for(var i = 1 ; i < <%=responseDataList.size()%> ; i++){
			ctx.lineTo(50+i*40, responseDataToHigh[per4list[i]-1]);
		}
		ctx.stroke();
		// よい点、可能性、進歩の状況をそれぞれの観点について判定する
		// ※12回分ない場合は判定をしないようにしなくてはいけない

		var per1Yoi = analyzeYoi(per1list);
		var per2Yoi = analyzeYoi(per2list);
		var per3Yoi = analyzeYoi(per3list);
		var per4Yoi = analyzeYoi(per4list);
		var per1Kanousei = analyzeKanousei(per1list);
		var per2Kanousei = analyzeKanousei(per2list);
		var per3Kanousei = analyzeKanousei(per3list);
		var per4Kanousei = analyzeKanousei(per4list);
		var per1Shinpo = analyzeShinpo(per1list);
		var per2Shinpo = analyzeShinpo(per2list);
		var per3Shinpo = analyzeShinpo(per3list);
		var per4Shinpo = analyzeShinpo(per4list);

		// ※それぞれの判定に応じて、drawImageを利用してctxに画像を設置する（125-132参照）

		// よい点の描画
		if(per1Yoi == 1){
		var imgYBK = new Image();
		imgYBK.src = "../img/yoiBK_scale50.png";
		imgYBK.onload = function() {
			ctx.drawImage(imgYBK, 35, yoiDrawList[per1list[0]-1]);
			for(var i = 1 ; i < 12 ; i++){
				ctx.drawImage(imgYBK, 35+i*40, yoiDrawList[per1list[i]-1]);
		}}}
		if(per2Yoi == 1){
		var imgYB = new Image();
		imgYB.src = "../img/yoiB_scale50.png";
		imgYB.onload = function() {
			ctx.drawImage(imgYB, 35, yoiDrawList[per2list[0]-1]);
			for(var i = 1 ; i < 12 ; i++){
				ctx.drawImage(imgYB, 35+i*40, yoiDrawList[per2list[i]-1]);
		}}}
		if(per3Yoi == 1){
		var imgYG = new Image();
		imgYG.src = "../img/yoiG_scale50.png";
		imgYG.onload = function() {
			ctx.drawImage(imgYG, 35, yoiDrawList[per3list[0]-1]);
			for(var i = 1 ; i < 12 ; i++){
				ctx.drawImage(imgYG, 35+i*40, yoiDrawList[per3list[i]-1]);
		}}}
		if(per4Yoi == 1){
		var imgYR = new Image();
		imgYR.src = "../img/yoiR_scale50.png";
		imgYR.onload = function() {
			ctx.drawImage(imgYR, 35, yoiDrawList[per4list[0]-1]);
			for(var i = 1 ; i < 12 ; i++){
				ctx.drawImage(imgYR, 35+i*40, yoiDrawList[per4list[i]-1]);
		}}}

		// 可能性の描画
		if(per1Kanousei == 1){
			ctx.strokeStyle = 'rgb(0,0,0)';
			ctx.shadowBlur = 20;  //ぼかしの範囲を定義
			ctx.shadowColor = "#000000";  //ぼかしの色を定義
			ctx.beginPath();
			ctx.moveTo(370, responseDataToHigh[per1list[8]-1]);
			for(var i = 9 ; i < 12 ; i++){
				ctx.lineTo(50+i*40, responseDataToHigh[per1list[i]-1]);
			}}
		ctx.stroke(); //できた線を描画する
		ctx.shadowBlur = 0;  //ぼかし終了
		if(per2Kanousei == 1){
			ctx.strokeStyle = 'rgb(0,0,255)';
			ctx.shadowBlur = 20;  //ぼかしの範囲を定義
			ctx.shadowColor = "#0000ff";  //ぼかしの色を定義
			ctx.beginPath();
			ctx.moveTo(370, responseDataToHigh[per2list[8]-1]);
			for(var i = 9 ; i < 12 ; i++){
				ctx.lineTo(50+i*40, responseDataToHigh[per2list[i]-1]);
			}}
		ctx.stroke(); //できた線を描画する
		ctx.shadowBlur = 0;  //ぼかし終了
		if(per3Kanousei == 1){
			ctx.strokeStyle = 'rgb(0,255,0)';
			ctx.shadowBlur = 20;  //ぼかしの範囲を定義
			ctx.shadowColor = "#00ff00";  //ぼかしの色を定義
			ctx.beginPath();
			ctx.moveTo(370, responseDataToHigh[per3list[8]-1]);
			for(var i = 9 ; i < 12 ; i++){
				ctx.lineTo(50+i*40, responseDataToHigh[per3list[i]-1]);
			}}
		ctx.stroke(); //できた線を描画する
		ctx.shadowBlur = 0;  //ぼかし終了
		if(per4Kanousei == 1){
			ctx.strokeStyle = 'rgb(255,0,0)';
			ctx.shadowBlur = 20;  //ぼかしの範囲を定義
			ctx.shadowColor = "#ff0000";  //ぼかしの色を定義
			ctx.beginPath();
			ctx.moveTo(370, responseDataToHigh[per4list[8]-1]);
			for(var i = 9 ; i < 12 ; i++){
				ctx.lineTo(50+i*40, responseDataToHigh[per4list[i]-1]);
			}}
		ctx.stroke(); //できた線を描画する
		ctx.shadowBlur = 0;  //ぼかし終了

		// 進歩の描画
		if(per1Shinpo == 1){
		var imgSBK = new Image();
		imgSBK.src = "../img/shinpoBK.png";
		imgSBK.onload = function() {
			ctx.drawImage(imgSBK, 350, responseDataToHigh[per1list[9]-1]);
		}}
		if(per2Shinpo == 1){
		var imgSB = new Image();
		imgSB.src = "../img/shinpoB.png";
		imgSB.onload = function() {
			ctx.drawImage(imgSB, 350, responseDataToHigh[per2list[9]-1]);
		}}
		if(per3Shinpo == 1){
		var imgSG = new Image();
		imgSG.src = "../img/shinpoG.png";
		imgSG.onload = function() {
			ctx.drawImage(imgSG, 350, responseDataToHigh[per3list[9]-1]);
		}}
		if(per4Shinpo == 1){
		var imgSR = new Image();
		imgSR.src = "../img/shinpoR.png";
		imgSR.onload = function() {
			ctx.drawImage(imgSR, 350, responseDataToHigh[per4list[9]-1]);
		}}

		// マウスクリックの際に指定の範囲をクリックしていた場合はそれに応じて飛ぶ
		canvas.addEventListener("mousedown", mouseDownListner, false);
		function mouseDownListner(e) {
			var rect = e.target.getBoundingClientRect();
			//座標取得
			mouseX1 = e.clientX - rect.left;
			mouseY1 = e.clientY - rect.top;
			if (mouseY1 > 30 && mouseY1 < 30 + 270){
				if (mouseX1 > 44 && mouseX1 < 44 + 26) {
				    	location.href = "ShowProductServlet?lessonId=1";
				} else if(mouseX1 > 70 && mouseX1 < 70 + 40){
						location.href = "ShowProductServlet?lessonId=2";
				} else if(mouseX1 > 110 && mouseX1 < 110 + 40){
						location.href = "ShowProductServlet?lessonId=3";
				} else if(mouseX1 > 150 && mouseX1 < 150 + 40){
						location.href = "ShowProductServlet?lessonId=4";
				} else if(mouseX1 > 190 && mouseX1 < 190 + 40){
						location.href = "ShowProductServlet?lessonId=5";
				} else if(mouseX1 > 230 && mouseX1 < 230 + 37){
						location.href = "ShowProductServlet?lessonId=6";
				} else if(mouseX1 > 267 && mouseX1 < 267 + 39){
						location.href = "ShowProductServlet?lessonId=7";
				} else if(mouseX1 > 306 && mouseX1 < 306 + 39){
						location.href = "ShowProductServlet?lessonId=8";
				} else if(mouseX1 > 345 && mouseX1 < 345 + 41){
						location.href = "ShowProductServlet?lessonId=9";
				} else if(mouseX1 > 386 && mouseX1 < 386 + 38){
						location.href = "ShowProductServlet?lessonId=10";
				} else if(mouseX1 > 424 && mouseX1 < 424 + 38){
						location.href = "ShowProductServlet?lessonId=11";
				} else if(mouseX1 > 462 && mouseX1 < 462 + 35){
						location.href = "ShowProductServlet?lessonId=12";
				}
			}
		}

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

		// 分散
		var vari = variance(list);

		// 2以上一気に減った回数
		var downCount = 0;
		for(var i = 0; i < 11 ; i++){
			if(list[i+1]+2<=list[i]){
				downCount++;
			}
		}
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
		// 前半と後半の平均をそれぞれ求める
		var firstAve = average(firstHalfList);
		var secondAve = average(secondHalfList);

		// 後半の分散を求める
		var secondVari = variance(secondHalfList);
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