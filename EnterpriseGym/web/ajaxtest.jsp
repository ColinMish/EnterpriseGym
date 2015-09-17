<html>
<head>
<title>Username Availability</title>
<style type="text/css">
.flable {
	color: gray;
}

.status {
	font-family: verdana;
	font-size: 12px;
}

.uname {
	color: blue;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
          $(document).ready(function(){
              $(".uname").change(function(){
                  var uname = $(this).val();
                  if(uname.length >= 3){
                      $(".status").html("<img src='${pageContext.request.contextPath}/Pictures/loading.gif'><font color=gray> Checking availability...</font>");
                       $.ajax({
                          type: "POST",
                          url: "CheckAvailability",
                          data: "uname="+ uname,
                          success: function(msg){

                              $(".status").ajaxComplete(function(event, request, settings){
                                   
                                  $(".status").html(msg);

                              });
                          }
                      }); 
                  }
                  else{
                       
                      $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>");
                  }
                  
              });
          });
        </script>
</head>
<body>
	<div>
		<label class="flable">User Name :</label> <input type="text"
			class="uname" />&nbsp;<span class="status"></span>
	</div>

</body>
</html>