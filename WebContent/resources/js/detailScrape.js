function scrapeRecipe() {
	$("#scrapeBtn").remove();

	var recipe_bno = $("#recipe_bno").val();
	var member_nick = $("#member_nick").val();
	$
			.ajax({
				url : 'controllers/recipe/scrapeActionXml.jsp',
				type : 'post',
				data : {
					"recipe_bno" : recipe_bno,
					"member_nick" : member_nick
				},
				dataType : 'xml',
				success : function(data) {
					var scrape = "<button type='button' id='scrapeCancel' style='color: red;' onclick='cancelRecipe()'>스크랩 취소</button>";
					$("#scrapeout").html(scrape);
				}
			})
}

function cancelRecipe() {
	$("#scrapeCancel").remove();
	var recipe_bno = $("#recipe_bno").val();
	var member_nick = $("#member_nick").val();
	$
			.ajax({
				url : 'controllers/recipe/scrapeCancelXml.jsp',
				type : 'post',
				data : {
					"recipe_bno" : recipe_bno,
					"member_nick" : member_nick
				},
				dataType : 'xml',
				success : function(data) {
					var cancel = "<button type='button' id='scrapeBtn' style='color: green;' onclick='scrapeRecipe()'>스크랩</button>";
					$("#scrapeout").html(cancel);
				}
			})
}
