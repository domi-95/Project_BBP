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