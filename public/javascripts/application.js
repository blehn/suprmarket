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
	
	
        function set_message(message) {
          if($('.messages').length == 0) {
            $('body').append("<div class='messages'></div>");
          }
          $('.messages').html(message);
          $('.messages').corner('top 2px')
          $('.messages').show();
          setTimeout("$('.messages').fadeOut()", 1500);
        }
	//Toggle favorite icon
	$('.fav').click(function(e){
            e.preventDefault();
          $(this).toggleClass("on");
          if($(this).hasClass("on")) {
            $.post($(this).attr('href'), function(data) {
              set_message(data.message);
            });
          } else {
            $.post($(this).attr('href'), {"_method" : "DELETE"}, function(data) {
              set_message(data.message);
            });
          }
          return false;
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
	
	$('#q').focus(function() {
		$('#search_details').show("slide", { direction: "up" }, "fast", function() {
		  var slider_val = slider_values.indexOf($("#slider_amount").val());
		  $("#slider").slider({
    		min: 0,
    		max: 4,
    		range: "min",
    		value: slider_val,
    		slide: function(event, ui) {
    			$("#slider_amount").val(slider_values[ui.value]);
    		}
    	});
		});
		$(this).unbind('focus');
	});
	$('#search').blur(function() {
		$('#search_details').hide();
	});
	$('#browse').click(function() {
		$('#categories').toggle();
	});
	
        if($('.messages').length > 0) {
          setTimeout("$('.messages').fadeOut()", 1500);
        }
	
});
