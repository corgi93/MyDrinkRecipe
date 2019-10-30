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
					<span>팔로잉</span> <span>팔로워</span>
					<div>
						<button>프로필 수정</button>
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

