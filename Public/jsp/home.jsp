<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.ResponseData"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<ResponseData> responseDataList = (ArrayList<ResponseData>) session.getAttribute("responseDataList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="ja" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<jsp:include page="../common/bootstrap.jsp" />
<title>トップ画面</title>
</head>

<jsp:include page="../common/style.jsp" />
	<div class="image-box graph" align="center">
		<canvas id="canvassample" width="500" height="500">	</canvas>
	</div>
<div class="col col-12 col-lg-12">

	<table class="table table-hover">
			<thead class="thead-light">
			<tr>
				<th>LessonId</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
				%>
				<th>
					<%=responseDataList.get(i).getLessonId()%>
				</th>
				<%
					}
				%>
			</tr>
			</thead>
			<tr>
				<th>per1</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer1()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per2</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer2()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per3</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer3()%>
				</th>
				<%
					}
				%>
			</tr>
			<tr>
				<th>per4</th>
				<%
					for(int i=0;i<responseDataList.size();i++){
					%>
				<th>
					<%=responseDataList.get(i).getPer4()%>
				</th>
				<%
					}
				%>
			</tr>
	</table>

	<a href="SelectLessonServlet" role="button">自己評価を行う</a>
</div>
</body>
</html>

<script type="text/javascript" src="../common/excanvas.js"></script>
<script>
	// ルーブリックの値を格納する配列
	var per1list = [];
	var per2list = [];
	var per3list = [];
	var per4list = [];
	<% for(int i=0;i<responseDataList.size();i++){ %>
		per1list.push(<%=responseDataList.get(i).getPer1()%>);
		per2list.push(<%=responseDataList.get(i).getPer2()%>);
		per3list.push(<%=responseDataList.get(i).getPer3()%>);
		per4list.push(<%=responseDataList.get(i).getPer4()%>);
	<% } %>
	console.log(per1list);
	var responseDataToHigh = [250,200,150,100,50];



	function drawLine(){
		/* canvas要素のノードオブジェクト */
		var canvas = document.getElementById('canvassample');

		/* canvas要素の存在チェックとCanvas未対応ブラウザの対処 */
		if (!canvas || !canvas.getContext) {
			return false;
		}
		/* 2Dコンテキスト */
		var ctx = canvas.getContext('2d');

		/* Imageオブジェクトを生成 */
		var img = new Image();
		img.src = "../img/axis.png";
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

		// 総合して判定
		if(ave>=4.5 && vari <= 0.4 && downCount <=1){
			return 1;
		} else {
			return 0;
		}
	}

	function analyzeKanousei(list){
		// ここに可能性のロジックを書く

	}

	function analyzeShinpo(list){
		// ここに進歩のロジックを書く

	}

	window.onload = drawLine;


	// 計算用の関数
	function sum(array){
	    var sum = 0;
	    for (var i=0,len=array.length; i<len; ++i) {
	        sum += array[i];
	    };
	    return sum;
	}

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


</script>