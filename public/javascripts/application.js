$(function() {
	
	$('#login_link').click(
		function() {
			$(this).toggleClass('active')
			$('.login_form').css('top', ($(this).height()+4)+"px")
			$('.login_form').toggle();

			return false;
		}
	);
	
	$('input').hint('blur');
	$('#q').focus(function() {
		$('#search_details').show();
	});
	$('#search').blur(function() {
		$('#search_details').hide();
	});
	$('#browse').click(function() {
		$('#categories').toggle();
	});
	
	$("input[name='listing[willing_to_ship]']").change(function() {
		if($(this).val() == 'yes') {
			$('.will_ship').show()
		} else {
			$('.will_ship').hide();
		}
	})
	
	$(".tab_header:eq(0)").addClass('active_tab')
	$(".tab:gt(0)").hide();
	
	$(".tab_header").click(function() {
		index = $(".tab_header").index(this)
		$('.tab_header:not(:eq('+index+'))').removeClass('active_tab')
		$('.tab_header:eq('+index+')').addClass('active_tab')
		$('.tab:not(:eq('+index+'))').hide();
		$('.tab:eq('+index+')').show();
	});
	
	$('#search_filters').click(function() {
		$('.search_filters').toggle();
	});
	
	//scrub x and y parameters
	$('form').submit(function() {
		this.submit();
		return false;
	});
	var slider_values = ['<5 miles', '<20 miles', '<50 miles', '<200 miles', 'Anywhere']
	$("#slider").slider({
		min: 0,
		max: 4,
		range: "min",
		slide: function(event, ui) {
			$("#slider_amount").val(slider_values[ui.value]);
		}
	});
	$("#slider_amount").val(slider_values[0]);
	
});