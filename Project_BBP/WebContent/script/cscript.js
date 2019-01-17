/**
 * 
 */
$(document).ready(function(){
		  $('#cover').removeClass('activate');
		  $('#loader').removeClass('activate');
	$('#regForm').submit(function(){
		  $('#cover').addClass('activate');
		  $('#loader').addClass('activate');
		});
	});

function voteopBox(id, action){
	var ac = action;
	var cover = 'cover';
	var voteopBox = 'voteopBox' + id
	if((ac.localeCompare('open')) == 0){
	  $('#'+cover).addClass('activate');
	  $('#'+ voteopBox).addClass('activate');
	}
	if((ac.localeCompare('close')) == 0){
	  $('#'+cover).removeClass('activate');
	  $('#'+ voteopBox).removeClass('activate');		
	}	
}

function doOpVote(opid) {
	var a = 0;
	var vuser = $(".user").val();
	var vselection = $(".selection"+opid+":checked").val();
    //var phoneNo = $("#phoneNumber").val();
    //var x = "40";
    $.ajax({
        url: 'voteop',
        type: 'POST',
        data: {
            id: opid,
            user: vuser,
            selection: vselection
        },
        success: function(data) {
           // alert('Update Success');
        	a = 1;
        	message(a);
        	voteopBox(opid, 'close');
            remove_op(opid);
            
        },
        failure: function(data) {
        	message(a);
        	voteopBox(opid, close);
           // alert('Update Failed');
        }
    });
}

function doPVote(pid) {
	var a = 0;
	var vuser = $(".user").val();
	//var phoneNo = $("#phoneNumber").val();
	//var x = "40";
	$.ajax({
		url: 'votep',
		type: 'POST',
		data: {
			id: pid,
			user: vuser,
		},
		success: function(data) {
			// alert('Update Success');
			a = 1;
			$("#voteReload").load(" #voteReload > *");
			message(a);
			
		},
		failure: function(data) {
			message(a);
			// alert('Update Failed');
		}
	});
}

function message(ar) {
	if(ar==1){
	  document.getElementById('snackbar_message').innerHTML +=
	  "<div id='snackbar' class=''>Abstimmung erfolgreich!</div>";
	}
	else{
		document.getElementById('snackbar_message').innerHTML +=
			  "<div id='snackbar' class=''>Abstimmung fehlgeschlagen!</div>";
	}
	  var element = 'snackbar';
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated slideInUp');
	  document.getElementById("snackbar").style.visibility = "visible";
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated slideInUp');
					$(function(){
						$('#'+element).addClass('animated slideOutDown delay-3s');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated slideOutDown delay-3s');
							$('#'+element).remove();	
						});
					});	
				});
			});
		});
	}

function remove_op(opid) {
	  var element = 'dynamic_divs' + opid;
	  
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated zoomOut delay-1s');
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated zoomOut delay-1s');
					$('#'+element).slideUp();	
				});
			});
		});
	

	}

/*==================================================================
[ login validation ]*/



(function($) {
	"use strict";

	/*==================================================================
	[ Validate ]*/
	var input = $('.validate-input .input100');

	$('.validate-form').on('submit', function() {
		var check = true;

		for (var i = 0; i < input.length; i++) {
			if (validate(input[i]) == false) {
				showValidate(input[i]);
				check = false;
			}
		}

		return check;
	});

	$('.validate-form .input100').each(function() {
		$(this).focus(function() {
			hideValidate(this);
		});
	});

	function validate(input) {
		if ($(input).attr('type') == 'email'
				|| $(input).attr('name') == 'email') {
			if ($(input)
					.val()
					.trim()
					.match(
							/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
				return false;
			}
		} else {
			if ($(input).val().trim() == '') {
				return false;
			}
		}
	}

	function showValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).addClass('alert-validate');
	}

	function hideValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).removeClass('alert-validate');
	}

})(jQuery);

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	
//Add and Delete fields for opform.jsp
function field(adddelete){
var ad = adddelete;

	if(ad.localeCompare('+') == 0){
		//Creates new answerfield
		 if (feld <= 10) {
		  var inhalt = "Antwortm&ouml;glichkeit " + feld;
		  document.getElementById('dynamic_input').innerHTML +=
		  " <div class='form-row'><div class='col-md-4 form-group'><input class='form-control' type='text' name='n_" + feld + "' placeholder='" + inhalt + "'required></div></div>";
		  feld++;
		 }
		
	}
	if(ad.localeCompare('-') == 0){
		//removes last added answerfield
		 if (feld > feldm) {
		 feld--;
		  document.getElementById('dynamic_input').innerHTML = "";
		  for (var zaehler = feldm; zaehler < feld; zaehler++) {
		    var inhalt = "Antwortm&ouml;glichkeit " + zaehler;
		    document.getElementById('dynamic_input').innerHTML +=
		     "<div class='form-row'><div class='col-md-4 form-group'><input class='form-control' type='text' name='n_" + zaehler + "' placeholder='" +
		      inhalt + "'required></div></div>";
		  }
		 }
		
	}
}