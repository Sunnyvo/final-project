var options = {
	url: function(phrase) {
		return "users/search.json?name=" + phrase ;
	},

	getValue: "name"
};
$(document).on("turbolinks:load",() =>{
$("#provider-remote").easyAutocomplete(options);
});


// var options2 = {
// 	url: function(phrase) {
// 		return "users/search.json?name=" + phrase ;
// 	},


// 	getValue: "name",

// 	list: {

// 		onSelectItemEvent: function() {
// 			var value = $("#function-data").getSelectedItemData().id;
//  			$("#data-holder").val(value).trigger("change");
// 		}
// 	}
// };
// $(document).on("turbolinks:load",() =>{
// $("#function-data").easyAutocomplete(options2);
// });

// $(document).on('turbolinks:load', () => {
// $(".js-add-mention").on("click", (e) =>  {
// 	var id = $('#data-holder').val();
// 	var name = $("#function-data").val();
// 	var current_ids = $('#user_ids').val();
// 	var list_users = $(".js-users").val();
// 	if (current_ids !== 'undefined')
// 		current_ids = current_ids + ",";
// 	else
// 		current_ids = "";

// 	if (id) {
// 		if ($('#user_ids').val())
// 			$('.js-users').val(list_users + ", " + name);
// 		else
// 			$('.js-users').val(name);

// 		$('#user_ids').val(current_ids + id);
// 		$("#function-data").val("");
// 		$('#data-holder').val("");
// 	}
// })
// });
