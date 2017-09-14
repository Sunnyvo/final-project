var options = {
	url: function(phrase) {
		return "users/search.json?name=" + phrase ;
	},

	getValue: "name"
};
$(document).on("turbolinks:load",() =>{
$("#provider-remote").easyAutocomplete(options);
});

