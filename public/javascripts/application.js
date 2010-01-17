var slider_values = ['<5 miles', '<20 miles', '<50 miles', '<200 miles', 'Anywhere'];

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
	
	$(".tab").corner("tr bottom 2px")
	$(".tab_header").corner("top 2px")
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
	
	$('tr').hover(
		function() {
			$(this).addClass('selected')
		},
		function() {
			$(this).removeClass('selected')
		}
	)
	
	//scrub x and y parameters
	
	$("#slider").slider({
		min: 0,
		max: 4,
		range: "min",
		slide: function(event, ui) {
			$("#slider_amount").val(slider_values[ui.value]);
		}
	});
	$("#slider_amount").val(slider_values[0]);
	$('.tab_heading').corner("top 2px")
	$('.tab_heading span').corner("2px")
	$('#q').corner('left 2px')
	$('#zip_code').corner('right 2px')
	$('#login_link').corner('top 2px')
	$('div.login_form').corner('tl bl br 2px')
	$('div.login_form input').corner('2px')
	
	$('form').submit(function() {
		this.submit();
		return false;
	});
	
	$('.photo_link').click(function() {
		if($(this).css('background-position') == '0px -18px') {
			$(this).css('background-position', '0px 0px')
			$(this).next('img').remove();
		} else {
			$(this).css('background-position', '0px -18px')
			$(this).after("<img src='"+$(this).attr('rel')+"'  style='position:absolute;top:"+($(this).position().top - 132)+"px;left:"+$(this).position().left+"px;'/>");
		}
	})
	
});