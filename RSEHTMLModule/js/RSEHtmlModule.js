/*
 * Created by www.mattopen.com
 * Date:	15.06.2014
 * DNN RSEModules
 */
//-----------------------------------------------------------------------------------------------------
//  RSEModules
//-----------------------------------------------------------------------------------------------------
//Message function after action
function messagebox(message) {
    $('#messagebox').removeClass().addClass('confirmbox').text("Message: "+message).fadeIn(1000).fadeOut(3000);
}
function messagebox2(elem, message) {
	var messageboxelem = '<div id="messagebox2">&nbsp;</div>';
	$('#'+elem).append(messageboxelem);
	$('#messagebox2').removeClass().addClass('confirmbox_blue').text("Message: "+message).fadeIn(1000);
	setTimeout(function() {
		$('#messagebox2').fadeOut(2000).remove();
				},5000);
}
function prepareMessagebox(){
	if ($('#headermessageContainer').length)
		{
			//console.log('da');
		}else{
			var preparemessageboxelem = '<div id="headermessageContainer">&nbsp;</div>'; 
			$('Body').after(preparemessageboxelem);
		}
}
//------------------------------------------------------------------------------------------
function styleEditBox2(param) {
    if ($(param) == 'tt') {
        //elem = 'templateTopPane';
        //$('#'+elem).addClass('editBoxStyle');//.fadeTo("slow", 1.0);
        console.log('T:'+param)
    }else{
        //elem = 'templateTopPane';
        //$('#'+elem).addClass('editBoxStyle');//.fadeTo("slow", 1.0);
        console.log('O:'+param)
    }
}
function styleEditBox(elem) {
    if(elem) {
        $('#'+elem).addClass('editBoxStyle');//.fadeTo("slow", 1.0);
    }else{
        //console.log('O:'+elem)
    }
}
//------------------------------------------------------------------------------------------
function removeEditBox(elem) {
    if(elem) {
        $('#'+elem).empty().removeClass('editBoxStyle');
    }else{
    }
}
//------------------------------------------------------------------------------------------
function closeckeditor() {
    for ( instance in CKEDITOR.instances ) CKEDITOR.instances[instance].updateElement();
    for ( instance in CKEDITOR.instances ) CKEDITOR.remove(CKEDITOR.instances[instance]);
    for ( instance in CKEDITOR.instances ) CKEDITOR.instances[instance].destroy();
}
//-----------------------------------------------------------------------------------------------------
function updateckeditor() {
    for ( instance in CKEDITOR.instances ) CKEDITOR.instances[instance].updateElement();
}
//------------------------------------------------------------------------------------------
$(window).resize(function() {
    if(this.resizeTO) clearTimeout(this.resizeTO);
    this.resizeTO = setTimeout(function() {
        $('.collapse.in').removeClass('in');
        //    $(this).trigger('resizeEnd');
    }, 500);
});
//------------------------------------------------------------------------------------------
function goToByScroll(id, myoffset){
    var $fadediv = $('body');
    $fadediv.fadeTo("fast", 0.6);
    $('html,body').animate({scrollTop: $('#'+id).offset().top - myoffset  }, 1000, function(){
        $fadediv.fadeTo("fast", 1.0);
    });
}
//------------------------------------------------------------------------------------------
//  use goToByScroll2('templateTopPane', 100);
function goToByScroll2(id, myoffset){
    $('html,body').animate({scrollTop: $('#'+id).offset().top - myoffset  }
    );
}
//------------------------------------------------------------------------------------------
//  use when {IIF,"'[isactive]'='1'","checked",""} in template
function validateCheckBox() {
    var $elem = $('input[name=frmIsActive]');
    if ($elem.attr('checked')){
        $elem.val('1');
    } else {
        $elem.val('0');
    }
}
//------------------------------------------------------------------------------------------


$(document).ready(function () {
	prepareMessagebox();
});
//-----------------------------------------------------------------------------------------------------
//  RSEModules
//-----------------------------------------------------------------------------------------------------