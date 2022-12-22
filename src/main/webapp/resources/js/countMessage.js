$(function(){
	$.ajax({
		type:"post",
		url:"/app/note/countMessage",
		dataType:"json",
		success:function(data) {
			if(data.state==="true" && data.countMessage > 0) {
				$("#unreadMessages").show();
				$("#unreadMessages").text(data.countMessage+"+");
			}
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			console.log(jqXHR.responseText);
		}
	});
});
