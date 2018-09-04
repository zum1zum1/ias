function reset(){

}

function drawLine(){
	/* canvas要素のノードオブジェクト */
	var canvas = document.getElementById('canvas');

	/* canvas要素の存在チェックとCanvas未対応ブラウザの対処 */
	if (!canvas || !canvas.getContext) {
		return false;
	}
	/* 2Dコンテキスト */
	var ctx = canvas.getContext('2d');

	/* 観点①進歩の折れ線を書く */
	ctx.strokeStyle = 'rgb(0,0,0)';
	ctx.beginPath(); //線を書くことの宣言
	ctx.lineWidth = 2; //線の太さ
	ctx.moveTo(50, 150); //書き始める場所を指定(1月)
	ctx.lineTo(90, 250); //引きたい線の終点を指定(2月)
	ctx.lineTo(130, 200); //3月
	ctx.lineTo(170, 200); //4月
	ctx.lineTo(210, 150); //5月
	ctx.lineTo(250, 150); //6月
	ctx.lineTo(290, 200); //7月
	ctx.lineTo(330, 150); //8月
	ctx.lineTo(370, 150); //9月


	/* canvasの描画結果をPNGで取り出しimg要素にセット */
	try {
		var img_png_src = canvas.toDataURL();
		document.getElementById("image_png").src = img_png_src;
		document.getElementById("data_url_png").firstChild.nodeValue = img_png_src;
	} catch (e) {
		document.getElementById("image_png").alt = "未対応";
	}
}

function analyze(){

}