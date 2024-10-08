<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>head</title>
<!-- Favicon-->
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Include Toastr CSS and JS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Your custom script containing deleteTraining function -->

<!-- Include Bootstrap JS (after your custom script) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS (if needed) -->
<script src="js/scripts.js"></script>

<!--      ########## Data-table ########## -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<style type="text/css">
.btn {
	font-size: 14px;
}

.edit-button {
	width: 62.47px;
}
</style>

</head>
<body>

	<a href="${pageContext.request.contextPath}/AddHeadMaster.jsp" class="btn btn-success mt-2">Add New
		Head +</a>

	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead class="thead-dark"
						style="background-color: #337ab7; color: white;">

						<tr>
							<th>Sl</th>
							<th style="display: none;">Id</th>
							<th style="display: none;">TC Code</th>
							<th>TC Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>


	<script>
		fetchDataAndDisplay();

		function fetchDataAndDisplay() {
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/api/head/getall",
				dataType : "json",
				success : function(data) {
					displayTrainingData(data);
				},
				error : function(xhr, status, error) {
					console.error("API request error: " + error);
					toastr.error("Failed to fetch data");
				}
			});
		}

		function displayTrainingData(data) {
			var trainings = data;
			var tableBody = $("#trainingTable tbody");

			// Clear existing rows
			tableBody.empty();

			for (var i = 0; i < trainings.length; i++) {
				var training = trainings[i];
				var row = $("<tr></tr>");
				row.append("<td class='serial-column'>" + (i + 1) + "</td>");
				row.append("<td style='display: none;'>" + training.sl + "</td>");
				row.append("<td style='display: none;'>" + training.tccode + "</td>");
				row.append("<td>" + training.tcnames + "</td>");
				row
						.append("<td><button class='btn btn-primary btn-sm edit-button' onclick='editTraining(\""
								+ training.sl
								+ "\")'>Edit</button>&nbsp;<button class='btn btn-danger btn-sm'   onclick='deleteTraining(this,\""
								+ training.sl + "\")'>Delete</button></td>");

				tableBody.append(row);
			}
			var dataTable = $('#trainingTable').DataTable();
		}

		// Sample functions for edit and delete
		function deleteTraining(button, sl) {
			var isConfirmed = confirm("Are you sure you want to delete this training?");

			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
				var row = $(button).closest('tr');
				// Make an AJAX request to the delete endpoint

				$.ajax({
					type : "Delete",
					url : "${pageContext.request.contextPath}/api/head/delete/" + sl,
					success : function(response) {
						var table = $('#trainingTable').DataTable();
						table.row(row).remove().draw(false);
						updateSerialNumbers();
						toastr.success("venue deleted successfully");
						// Reload or update the data after deletion
						//fetchDataAndDisplay();
					},
					error : function(xhr, status, error) {
						toastr.error("Failed to delete Venue: " + error);
					}
				});
			}
		}
		function updateSerialNumbers() {
		    var table = $('#trainingTable').DataTable();
		    var rows = table.rows().nodes();
		    $(rows).each(function(index, row) {
		        $(row).find('.serial-column').text(index + 1);
		    });
		}

		// Sample function for edit
		function editTraining(id) {
			
				// Assuming you have an EditTraining.jsp page to handle editing
				var editUrl = "${pageContext.request.contextPath}/EditHeadMaster.jsp?sl=" + id;// Redirect to the EditTraining.jsp page with the query string parameters
				window.location.href = editUrl;
	
		}
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Toastr CSS and JS links go here -->
</body>
</html>