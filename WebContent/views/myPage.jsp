<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@include file="./includes/header.jsp"%>
<body>
	<div id="myPage_container">
		<div class="user_infos">
			<div id="user_wrapper">
				<div style="float: left;">
					<img class="user_thumbnail" src="../resources/img/1.jpg" />
				</div>
				<div class="right_infos">
					<h2>corgi93</h2>
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
		<div class="modal hidden">
			<div class="model_overlay"></div>
			<div class="modal_content">
				<h1>회원정보 수정</h1>
				<input type="text" placeholder="아이디 수정하시겠습니까?"> <input
					type="text" placeholder="닉네임 수정하시겠습니까?"> <input type="text"
					placeholder="비밀번호 수정하시겠습니까?">
			</div>
		</div>
	</div>


	<script type="text/javascript">
		// modal창

		const over
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

