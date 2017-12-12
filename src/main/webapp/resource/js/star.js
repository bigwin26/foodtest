var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
var btn_save = $("#btn_save");
var form = $("#comment-form");

  	$(document).on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    
    	setTimeout(function(e){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
       			/*var value = $('input[name=point]:checked').val();
       			alert(value);
       			if(value > 0){
       				alert('별점을 선택해주세요.')
       				e.preventDefault();
       			}
       			else
       				btn_save.submit();*/
     	 	}
   		}, 100);
    	
 	 })
  
    .on("change", ".star-input :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star-input label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});

  	
  	/*btn_save.click(function(e){
  		alert('눌렸다');
  		e.preventDefault();
		if(value != 1){
			alert('별점을 선택해주세요.')
		}
		else
			form.submit();
	});*/
  	
};
$(function() {
	$("#btn_save")
	.on("click", function(e) {
			var value = $('input[name=point]:checked').val();
			//alert(value);
			if(value == undefined){
				alert('별점을 선택해주세요.')
				e.preventDefault();
			}
	});
});

starRating();