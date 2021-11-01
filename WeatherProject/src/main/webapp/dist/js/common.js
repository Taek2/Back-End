function checkAlert(uri, text) {
	result = confirm(text);
	if (result == true) {
		location.href = uri;
	} else {
		return;
	}
}     

function msgEdit(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능

	$('#content'+index).css('display','none'); // 원래 있던 메시지 삭제
	$('#Option'+index).css('visibility','hidden'); // 원래 있던 수정 삭제 버튼 안보이게
	$('#uContentArea'+index).removeClass('dnone'); // textarea 띄우고
	$('#uOption'+index).removeClass('dnone'); // 수정, 취소 버튼 띄우기
}

function editCancel(index){
	$('#content'+index).css('display',''); // 원래 있던 메시지 삭제
	$('#Option'+index).css('visibility',''); // 원래 있던 수정 삭제 버튼 안보이게
	$('#uContentArea'+index).addClass('dnone'); // textarea 띄우고
	$('#uOption'+index).addClass('dnone'); // 수정, 취소 버튼 띄우기
}

function msgEditFinish(index){ 
	console.log("전달된 메시지: " + $("#uContent"+index).val());
	var msg = $("#uContent"+index).val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var params = "content="+$("#uContent"+index).val()+"&pnum="+$("#postNum"+index).val();
 
	$.ajax({
		type:"post",
		url:"updatePost.do",
		data:params,
		dataType:"json",
		success:function(args){
			$('#content'+index).css('display','');
			$('#Option'+index).css('visibility','');
			$('#uContentArea'+index).addClass('dnone');
			$('#uOption'+index).addClass('dnone');
			
			console.log("기본: " + args[0].content);
			console.log(args[0].pdate);
			console.log("index: " + index);
			$("#content"+index).text(args[0].content);
			$("#postDate"+index).text(args[0].pdate);
			
		}
	})
}