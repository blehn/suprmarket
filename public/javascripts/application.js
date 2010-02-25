var slider_values = ['5 mi', '20 mi', '50 mi', '200 mi', 'Anywhere'];

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
		$('#search_details').show("slide", { direction: "up" }, "fast");
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
	
	//$(".tab_header:eq(0)").addClass('active_tab');
	//$(".tab:gt(0)").hide();
	
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
		$(this).toggleClass('up')
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
	$('#login_link').corner('top 2px')
	$('div.login_form').corner('tl bl br 2px')
	$('#search_details').corner('bottom 2px')
	$('#categories').corner('2px')
	$('.messages').corner('top 2px')
	
	
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
			$(this).after("<img src='"+$(this).attr('rel')+"' class='preview'  style='position:absolute;top:"+($(this).position().top - 99)+"px;left:"+$(this).position().left+"px;'/>");
		}
	})
	
	
	//Toggle favorite icon
	$('.fav').click(function(){
    $(this).toggleClass("on");
  });
  

	$('.grid_result .title').hide();
	$('.grid_result .title').css('opacity', 1);
	$('.grid_result .image').hover(
		function() {
			$(this).find('.title').show();
		},
		function() {
			$(this).find('.title').hide();
		}
	);
	
	
});