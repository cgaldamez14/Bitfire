<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Favicon for Bitfire -->
<link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Exo+2|Rokkitt">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/bitfire-base.css">
<link rel="stylesheet" href="../css/bitfire-nav.css">
<link rel="stylesheet" href="../css/bitfire-wallet.css">

</head>
<body>

	<!-- Static Navigation Bar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value ='/index'/>">
					<div class="logo text-center">
						<img src="../assets/img/fire.png" alt=""
							style="width: 50px; height: 50px;">
						<h2 class="web-font">
							<span class="ignite web-font">BIT</span><span
								class="white web-font">FIRE</span>
						</h2>
					</div>
				</a>
			</div>

			<!--  Collapses when screen is too small -->
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="../index">Summary</a></li>
					<li><a href="<c:url value='/user/transactions' />">Transactions</a></li>
					<li><a href="<c:url value='/user/send' />">Send
							Bitcoin</a></li>
					<li><a href="<c:url value='/user/request' />">Request
							Bitcoin</a></li>
					<li><a href="<c:url value='/user/wallet' />">Wallet</a></li>
					<li class="active"><a href="<c:url value='/user/addressBook' />">Contact</a></li>
				</ul>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<ul class="nav navbar-nav">
						<li><a href="<c:url value='/admin/users' />">Users</a></li>
					</ul>
				</security:authorize>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-cog"
							aria-hidden="true"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/user/profile' />">My
									Account</a></li>
							<li><a href="<c:url value='/logout' />">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="page-header">
			<h1>Edit Address</h1>
		</div>
		<div class="well">
			<form:form modelAttribute="address" class="form">
				<table class="table table-condensed table-striped">

					<tr>
						<th>Label</th>
						<th>Address</th>
						<th>USD</th>
						<th>BTC</th>
						<th>Primary</th>
					</tr>
					<tr>
						<td><form:input path="label" class="form-control" /></td>
						<td>${address.address}</td>
						<td>${address.USD}</td>
						<td>${address.bitcoins}</td>

						<c:if test="${not address.primary }">
							<td><input type="checkbox"
								name="primary" id="primary" /></td>
						</c:if>

						<c:if test="${address.primary }">
							<td>Primary</td>
						</c:if>
					</tr>

				</table>
				<input type="submit" name="save" value="Save"
					class="btn btn-md btn-danger" />
			</form:form>
		</div>
	</div>
