<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<script>
	function updateText(type) {
		var id = type + 'Text';
		document.getElementById("email").value = document.getElementById("sel").value;
	}
</script>
<script type="text/javascript">
$(function(){
	$("#btc").keyup(function(){
		var value= $("#btc").val();
		$.ajax({
			url: "getBTC",
			method: "post",
			dataType: "json",
			success: function(data){
				$("#btcValue").val(Number(data*value).toFixed(2));
			}
		});
	});
});
</script>
<div class="well">
	<div class="container" style="margin-top: 100px">
		<h2 class="web-font">Request Bitcoin</h2>
		<form class="form" action="<c:url value='/user/request' />"
			method="post">
			<br> <select onchange="updateText()" id="sel">
				<option value="">Select Email</option>
				<c:forEach items="${emails}" var="email">
					<option value="${email.contact.email }">${email.name }</option>
				</c:forEach>
			</select> <br> <br> <input class="form-control" type="email"
				id="email" name="email" placeholder="email address" /><br>
				<div class = "row">
						<div class = "col-md-6">
							<input class="form-control" type="text" name="btc" id ="btc"
						placeholder="amount of BTC" />
						</div>
						<div class = "col-md-6 input-group">
						<span class="input-group-addon">$</span>
						<input class = "form-control" type="text" id = "btcValue" placeholder="amount in USD" readonly/>
						</div>
					</div>
				
				<br> <input class="form-control"
				type="text" name="reason" placeholder="reason for request" /><br>
			<input class="btn btn-danger btn-block" type="submit" value="Request" />
		</form>

		<br />
		<div style="color: red">
			<h4>${error}</h4>
		</div>
		<div style="color: green">
			<h4>${message}</h4>
		</div>
	</div>
</div>