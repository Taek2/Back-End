// 확인 창 띄우기
function checkAlert(uri, text) {
	result = confirm(text);
	if (result == true) {
		location.href = uri;
	} else {
		return;
	}
}     

// 댓글 수정 누르면 수정할 수 있게 CSS 변환
function msgEdit(index){ 

	$('#content'+index).css('display','none'); // 원래 있던 메시지 삭제
	$('#Option'+index).css('visibility','hidden'); // 원래 있던 수정 삭제 버튼 안보이게
	$('#uContentArea'+index).removeClass('dnone'); // textarea 띄우고
	$('#uOption'+index).removeClass('dnone'); // 수정, 취소 버튼 띄우기
}

// 댓글 수정 취소 CSS 변환
function editCancel(index){
	$('#content'+index).css('display',''); // 원래 있던 메시지 삭제
	$('#Option'+index).css('visibility',''); // 원래 있던 수정 삭제 버튼 안보이게
	$('#uContentArea'+index).addClass('dnone'); // textarea 띄우고
	$('#uOption'+index).addClass('dnone'); // 수정, 취소 버튼 띄우기
}

// 글 수정 AJAX 처리
function msgEditFinish(index){ 
	console.log("전달된 메시지: " + $("#uContent"+index).val());
	var msg = $("#uContent"+index).val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var params = "content="+msg+"&pnum="+$("#postNum"+index).val();
 
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

// 글 삭제 AJAX 처리 --> 다시 원래 로직으로 수정할 예정
function msgDelete(index){ 
	result = confirm("댓글을 삭제하시겠습니까?");
	if (result == true) {
		var params = "pnum="+$("#postNum"+index).val();
		$.ajax({
			type:"post",
			url:"deletePost.do",
			data:params,
			dataType:"json",
			success:function(data){
				console.log("여기들어옴!");
				$("#post"+index).remove();
							
			}
		});
	
	} else {
		return;
	}
}