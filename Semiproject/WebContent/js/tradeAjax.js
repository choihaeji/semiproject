
function getParameterValuese(){
    var count = "count="+$("#count").val();
    var priceNow = "price="+$("#price").val();
    			
    return "&"+count+"&"+priceNow;
};
    		
function checkPrice(){
    	$.ajax({
    		url:"trade.do?command=ajax"+getParameterValuese(),
    		dataType="json",
    		success:function(msg){
    			alert(msg.price);
    			$("#result").html(
    					"<div class=\"country\">매수 금액 : </div>"+
    					"<div class=\"country\"> "+msg.price+"원</div>"
    					
    					);
    		},
    		error:function(){
    			alert("fail");
    		}
    	});
  			
};