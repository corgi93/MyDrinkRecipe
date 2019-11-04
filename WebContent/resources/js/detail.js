function commentAjax() {
	let recipe_bno = $("#recipe_bno").val();
	let member_id = $("#member_nick").val();
	$.ajax({
			url : '../controllers/recipe/scrapeActionXml.jsp',
			type : 'post',
			data : {
				"recipe_bno" : recipe_bno,
				"member_nick" : member_nick
			},
			success : function(data) {
				var isExist = $(data).find('Exist').text();
				var str = '';
				if (isExist == 'true') {
					var str = "<div style='color: red; font-size: 5px;'>이미 사용중인 아이디입니다.</div>"
					$("#idCheck").html(str);
				} else {
					var str = "<div style='color: green; font-size: 5px;'>사용 가능한 아이디입니다.</div>"
					$("#idCheck").html(str);
				}
			}
		})
}
