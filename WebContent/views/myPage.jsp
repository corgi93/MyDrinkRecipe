<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@include file="./includes/header.jsp"%>

<%
	String getSessionID = (String) session.getAttribute("id");

	MemberDB db = new MemberDB();
	MemberDto dto = db.getMyPageInfos(getSessionID);
%>

<body>
	<div id="myPage_container">
		<div class="user_infos">
			<div id="user_wrapper">
				<div class="left_infos">
					<img class="user_thumbnail" src="../thumbnail_user/<%=dto.getUser_img()%>" /> <img
						class="upload_thumbnail" src="../resources/img/camera.svg">
				</div>
				<div class="right_infos">
					<h2><%=dto.getNickname()%></h2>
					<div>
						<span>팔로잉</span> <span style="padding-left: 50px;">팔로워</span>
					</div>
					<div>
						<span>0명</span> <span style="padding-left: 75px;">0명</span>
					</div>
					<div>
						<button class="modify_profile">프로필 수정</button>
					</div>
				</div>
			</div>
		</div>

		<div class="tab">
			<div class="tabmenu">
				<div>찜한 레시피</div>
				<div>내 레시피</div>
				<div>팔로잉</div>
			</div>

			<section class="content">
				<h2>default</h2>
				<div>
					<b>ajax로 불러올 데이터들</b>
				</div>
			</section>
		</div>
	</div>


	<div>
		<div class="modal2 hidden">
			<div class="modal_overlay2"></div>
			<div class="modal_content">	
				<button class="closebtn2">❌</button>
				<h1>내 프로필</h1>
				<form action="../controllers/profile/profileUpload.jsp"
					method="post" enctype="multipart/form-data">
					<div class="modify_btn">
						<div>
							<input class="modify_input" type="text" name="introduce"
								placeholder="자기 소개 한 줄">
						</div>

						<div class="filebox">
							<label for="user_img">프로필 업로드</label> <input type="file"
								name="profileImg" class="modify_input" id="user_img">
						</div>
						<button class="complete" type="submit">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<div class="modal hidden">
			<div class="modal_overlay"></div>
			<div class="modal_content">
				<button class="closebtn">❌</button>
				<h1>프로필 수정</h1>
				<form action="../controllers/profile/modifyPofile.jsp" method="post">
					<div>
						<input class="modify_input" name="e-mail" type="text"
							placeholder="이메일을 수정하시겠습니까?">
					</div>
					<div>
						<input class="modify_input" name="nickname" type="text"
							placeholder="닉네임을 수정하시겠습니까?">
					</div>
					<div>
						<input class="modify_input" name="pw" type="text"
							placeholder="현재 비밀번호"> <input class="modify_input"
							name="pw_check" type="text" placeholder="새 비밀번호"> <input
							class="modify_input" name="pw_new" type="text"
							placeholder="새 비밀번호 확인">
					</div>
					<button class="complete">저장</button>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// modal창
		
		// 프로필 수정 btn click
		const modify_btn = document.querySelector(".modify_profile");
		
		// 카메라 img click
		const upload_btn = document.querySelector(".upload_thumbnail");
		
		const modal = document.querySelector(".modal");
		const modal2 = document.querySelector(".modal2");
		
		const overlay = modal.querySelector(".modal_overlay");
		const closeBtn = modal.querySelector(".closebtn");
		
		const overlay2 = modal2.querySelector(".modal_overlay2");
		const closeBtn2 = modal2.querySelector(".closebtn2");
		
        const openModal = () => {
            modal.classList.remove("hidden");
        }
        const closeModal = () => {
            modal.classList.add("hidden");
        }
        
        const openModal2 = () => {
            modal2.classList.remove("hidden");
        }
        const closeModal2 = () => {
            modal2.classList.add("hidden");
        }
		
        overlay.addEventListener("click", closeModal);
        closeBtn.addEventListener("click", closeModal);
        modify_btn.addEventListener("click", openModal);
        
        overlay2.addEventListener("click", closeModal2);
        closeBtn2.addEventListener("click", closeModal2);
        upload_btn.addEventListener("click", openModal2);
        
        
        
        
        // upload카메라 click -> modal
        
	</script>

	<script>
		function makeTemplate(data, clickedName) {
			var html = document.getElementById("tabcontent").innerHTML;
			var result = "";

			for (var i = 0; i < data.length; i++) {
				if (data[i].list === clickedName) {
					result = html.replace("{title}", data[i].title).replace(
							"{ingredients}", data[i].ingredients.join("/"));
					break;
				}
			}
			document.querySelector(".content").innerHTML = result;
		}

		function ajax(url, clickedName) {
			var req = new XMLHttpRequest();
			req.addEventListener("load", function() {
				var data = JSON.parse(req.responseText);
				makeTemplate(data, clickedName);
			});
			req.open("GET", url);
			req.send();
		}

		var tabcontent = document.querySelector(".tabmenu");

		tabcontent.addEventListener("click", function(evt) {
			console.log(evt.target.innerText)
			ajax("data.json", evt.target.innerText);
		})
	</script>

	<script id="tabcontent" type="myTemplate">
        <h4>title : {title}</h4>
        <p>{ingredients}</p>
    </script>


</body>
</html>

