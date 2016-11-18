<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

	<div class="container">
		<div class="page-header web-font">
			<h1>Contact</h1>
		</div>
		
		<div class = "well well-lg">
			<table class = "table table-striped table-condensed">
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<c:forEach items="${contacts}" var="contact">
					<tr>
						<td>${contact.name}</td>
						<td>${contact.contact.email}</td>
						<td>
							<button onclick="editAddressBookFunction('${contact.id}')" class = "btn btn-sm btn-default"> Edit </button>
							</td>
						<td><a
							href="<c:url value='/user/deleteAddressBook.html?id=${ contact.id }' />" class = "btn btn-sm btn-default">Delete</a></td>

					</tr>
				</c:forEach>
			</table>
			<button onclick="addAddressBookFunction()" class = "btn btn-danger"> Add New Contact </button>
		<br>
		<div style = "color: red;">${error}</div>
		<div style = "color: green;">${success}</div>
	</div>
	
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="addAddressBookForm" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Contact</h4>
					</div>
					<div class="modal-body">
						<form id="addressBook" action="<c:url value ='/user/addAddressBook.html' />" method=POST>
							<div class="form-group col-md-5" style="margin: 0 auto; float: none;">
								<label>Name</label><input style="text-align: center;" id="name" type="text"
									class="form-control" name="name"
									placeholder="Enter Name" required> <br>
								<label>Email</label><input style="text-align: center;" id="email" type="email"
									class="form-control" name="email"
									placeholder="Enter email" required> <br>
								<div>
									<center>
									<input type="submit" name="save" value="Save" style="margin: 0 auto;" 
									class="btn btn-info" />
									</center>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		
			<div class="container">
			<div class="modal fade" id="editAddressBookForm" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Edit Contact</h4>
					</div>
					<div class="modal-body">
						<form id="addressBook" action="<c:url value ='/user/editAddressBook.html' />" method=POST>
							<div class="form-group col-md-5" style="margin: 0 auto; float: none;">
								<label>Name</label><input style="text-align: center;" id="editName" type="text"
									class="form-control" name="name"
									placeholder="Enter Name" required> <br>
									<input type = "hidden" name="id" id = "addressBookId" />
								<div>
									<center>
									<input type="submit" name="save" value="Save" style="margin: 0 auto;" 
									class="btn btn-info" />
									</center>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		
	</div>
	
	<script>
		function addAddressBookFunction()
		{
			$("#addAddressBookForm").modal('show');
		}
	</script>
	<script>
	function editAddressBookFunction(id)
	{
		$("#editAddressBookForm").modal('show');
		
		$.ajax({
			type: "GET",
			url : "<c:url value='/user/editAddressBook.html' />",
			data : {addressBookId: id},
			success : function(data)
			{
				 $("#editName").val(data);
				 $("#addressBookId").val(id);
			},
			error : function(e)
			{
				alert(e);
			}
		});
	}
	
	</script>
