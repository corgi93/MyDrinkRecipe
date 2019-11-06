$(function() {
	// 처음 시작시 댓글 리스트 출력
	list();

	$("#btnsave").click(function() {

		var content = $("#content").val();
		var recipe_bno = $("#recipe_bno").val();
		var nick = $("#nick").val();
		var user_img = $("#user_img").val();

		if (content == '') {
			alert("내용을 반드시 입력해주세요");
			return false;
		}

		$.ajax({
			type : "post",
			url : "controllers/comments/commentAction.jsp",
			dataType : "xml",
			data : {
				"content" : content,
				"recipe_bno" : recipe_bno,
				"nick" : nick,
				"user_img" : user_img,
			},
			success : function(data) {
				// var d = data.find("commentdata").text();
				// var s=$(this);

				$("#content").val("");
				$("#content").focus();
				list();
			},
			statusCode : {
				404 : function() {
					alert("url을 찾을수 없어요");
				},
				500 : function() {
					alert("서버 오류");
				}
			}
		});
	});

});


function comment_delete(item){
	var comment_bno =$(item).attr("cbno");
   // alert(comment_bno);
    $.ajax({
         type:"get",
         url:"controllers/comments/commentdelete.jsp",
         dataType:"xml",
         data:{"comment_bno": comment_bno},
         success:function(data){
      	   alert("댓글이 삭제되었습니다!");
      	   list();
         },
        
         statusCode : {
				404 : function() {
					alert("url을 찾을수 없어요");
				},
				500 : function() {
					alert("서버 오류");
				}
			}
      });
}


function list() {
	
	// 데이터 불러오기
	$.ajax({
		type : "post",
		url : "controllers/comments/commentList.jsp",
		data : {
			"recipe_bno" : $("#bno").val()
		},// 자바 코드로 주지말고 위에 input type
		success : function(data) {
			$("#content").val("");
			$("#content").focus();
			var str = "";
			// //초기화 코드가 each문 아래 있으면 반복으로 돌면서 계속 초기화 되니까 위에 있어야됨!
			$(data).find("commentdata").each(
					function() {

						var s = $(this);
						str += "<div class='old_comment'>"
						str += "<span class='answer_profil_img'>";
						str += "<img src=" + "'" + s.find("memberimg").text()+ "'>";
						str += "</span>";
						str += "<div style='width:600px;'>";
						str += "<b>" + s.find("nick").text() + "</b>";
						str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						str += "<writeday>" + s.find("writeday").text()+ "</writeday>";
						str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						str += "<a class='del' onclick='comment_delete(this)' id='delete' cbno="+s.find("cbno").text()+">삭제</a>";
						str += "</div>";
						str += "<div style='width:600px;'>";
						str += s.find("content").text();
						str += "</div>";
						str += "</div>";
					});

			$("#out1").html(str);
		},
		statusCode : {
			404 : function() {
				alert("url 을 찾을수 없어요");
			},
			500 : function() {
				alert("서버 오류");
			}
		}
	});

}
