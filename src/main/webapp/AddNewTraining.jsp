<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add New Training</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f2f2f2;
}
 
#content {
	width: 60%;
	margin: 2rem auto;
	padding: 1rem;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
 
h2 {
	text-align: center;
	margin-bottom: 1.5rem;
	color: #333;
}
 
label {
	font-size: 14px;
	display: block;
	margin-bottom: 8px;
	/* 	font-weight: bold; */
	color: #333;
}
 
input, select {
	display: block;
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border-radius: 4px;
	border: 1px solid #ccc;
	margin-bottom: 16px;
	box-sizing: border-box;
}
 
h2 {
	text-align: center;
	margin-bottom: 1.5rem;
	color: #3366cc; /* Adjust the color based on your preference */
}
 
input[type="submit"]:hover {
	background-color: #45a049;
}
 
/* Style for the row container */
.row {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 10px;
}
 
/* Style for each column */
.column {
	flex: 1;
	margin-bottom: 16px;
	margin-right: 10px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Adjust shadow properties as needed */
}
 
</style>
<body>
	<div class="container mt-2" style="margin-top: 30px;">
		<!-- Your form goes here with fields side by side -->
		<form>
			<!-- 		                 ################ row-1 ################## -->
 
			<div class="row">
				<div class="col-md-3">
						<label for="tname">Training Name:</label> <input type="text"
							class="form-control" id="tname" required>
					</div>
 
				<!-- 					<div class="form-group"> -->
				<!-- 						<label for="plannerId">Training planner Id:</label> <input -->
				<!-- 							type="text" class="form-control" id="plannerId" required> -->
				<!-- 					</div> -->
								<div class="col-md-3">
 
						<label for="trainingMonth">Training Month:</label> <select
							class="form-control" id="trainingMonth" required>
							<option value="default" selected>-----Select-----</option>
 
							<option value="January">January</option>
							<option value="February">February</option>
							<option value="March">March</option>
							<option value="April">April</option>
							<option value="May">May</option>
							<option value="June">June</option>
							<option value="July">July</option>
							<option value="August">August</option>
							<option value="September">September</option>
							<option value="October">October</option>
							<option value="November">November</option>
							<option value="December">December</option>
						</select>
					</div>
				<!-- Replace the existing "Training Year" input field with a dropdown -->
							<div class="col-md-3">
 
						<label for="trainingYear">Training Year:</label> <select
							class="form-control" id="trainingYear" required>
							<!-- Add years dynamically, adjust the range as needed -->
							<%
							int currentYear = java.time.Year.now().getValue();
							for (int i = currentYear; i >= currentYear - 10; i--) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select>
					</div>
								<div class="col-md-3">
 
						<label for="startDate">Tentative Start date:</label> <input
							type="date" class="form-control" id="startDate" required>
					</div>
 
				
		
			</div>
			<div class="row">
			<div class="col-md-3">
					<div class="form-group">
						<label for="endDate">Tentative End Date:</label> <input
							type="date" class="form-control" id="endDate" required>
					</div>
				</div>
					<div class="col-md-3">
					<div class="form-group">
						<label for="mode">Training Mode:</label> <select
							class="form-control" id="mode" required>
							<option value="In-person">In-person</option>
							<option value="Online">Online</option>
							<option value="Hybrid">Hybrid</option>
							<!-- Add more options as needed -->
						</select>
					</div>
				</div>
 
				<div class="col-md-3 ">
					
						<label for="agency">Training Agency:</label> <select id="agency"
							class="form-control" required></select>
					
				</div>
				<div class="col-md-3 " >
					
						<label for="subject">Training Subject:</label> <input type="text"
							class="form-control" id="subject" required>
					
				</div>
			
			</div>
			<!-- 					    ############################row-2######################## -->
 
			<div class="row">
			
			
			
			
			
			
			
				<div class="col-md-3 ">
					
						<label for="category">Training Category:</label> <select
							id="category" class="form-control" required></select>
					
				</div>
				<div class="col-md-3 ">
					
						<label for="resource">Training Spell:</label> <select id="spell"
							class="form-control" required></select>
					
				</div>
				<!-- Add more fields as needed -->
				<div class="col-md-3 ">
					
						<label for="description">Training Description:</label> <input
							type="text" class="form-control" id="description" required>
					
				</div>
				<div class="col-md-3 ">
					
						<label for="location">Preferred Location:</label> <select
							id="venue" class="form-control" required></select>
					
				</div>
			</div>
 
			<!-- 					##################row-3######################### -->
			<div class="row">
 
				
				<div class="col-md-3 ">
					
						<label for="grade">Training Grade:</label> <select id="grade"
							class="form-control" required></select>
					
				</div>
				<div class="col-md-3 ">
					
						<label for="targetGroup">Target Group:</label><select id="group"
							class="form-control" required></select>
					
				</div>
				<div class="col-md-3">
					
						<label for="stakeholders">Number Of Stakeholders:</label> <input
							type="text" class="form-control" id="stakeholders" pattern="\d*"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');"
							required>
					
				</div>
				<div class="col-md-3">
					
						<label for="dayNeeded">Number of day needed:</label> <input
							type="text" class="form-control" id="dayNeeded" pattern="\d*"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');"
							required>
					</div>
 
			</div>
			<!-- 					####################row-4################ -->
 
			<div class="row">
 
				<div class="col-md-3">
					<div class="form-group">
						<label for="hoursPerDay">Hours per Day:</label> <input type="text"
							class="form-control" id="hoursPerDay" pattern="\d*"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');"
							required>
					</div>
				</div>
 
				<div class="col-md-3">
					<div class="form-group">
						<label for="totalHours">Total Hours:</label> <input type="text"
							class="form-control" id="totalHours" pattern="\d*"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');"
							required>
					</div>
				</div>
			
				<div class="col-md-3" style="display: none;">
					<div class="form-group">
						<label for="status">Training Status:</label><select id="status"
							class="form-control" required>
							<option value="NA">NA</option>
							<option value="confirmed">Confirmed</option>
						</select>
					</div>
					<!-- Add more fields as needed -->
				</div>
			</div>
			<div style="text-align: center;">
				<button  type="button"
					class="btn btn-primary" onclick="submitForm()">Submit</button>
					<span style="margin: 0 10px;"></span>
				<button type="button" class="btn btn-danger" onclick="closeForm()">Cancel</button>
			</div>
		</form>
	</div>
	<script>
		$.ajax({
			url : "${pageContext.request.contextPath}/api/spell",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#spell");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Spell Name----"));
				$.each(data, function(index, item) {
					var optionText = item.spell;
					resDropdown.append($("<option>").val(item.spell).text(
							optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
 
		$.ajax({
			url : "${pageContext.request.contextPath}/api/attendGrade",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#grade");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Grade----"));
				$.each(data, function(index, item) {
					var optionText = item.attendgrade;
					resDropdown.append($("<option>").val(item.attendgrade)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
 
		$.ajax({
			url : "${pageContext.request.contextPath}/api/category",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#category");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Category----"));
				$.each(data, function(index, item) {
					var optionText = item.trainingcategory;
					resDropdown.append($("<option>").val(item.trainingcategory)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
 
		$.ajax({
			url : "${pageContext.request.contextPath}/api/group",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#group");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select group----"));
				$.each(data, function(index, item) {
					var optionText = item.targetgroup;
					resDropdown.append($("<option>").val(item.targetgroup)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
 
		$.ajax({
			url : "${pageContext.request.contextPath}/api/search/venue",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#venue");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Location----"));
				$.each(data, function(index, item) {
					var optionText = item.vname;
					resDropdown.append($("<option>").val(item.vname).text(
							optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
 
		$.ajax({
			url : "${pageContext.request.contextPath}/api/agency",
			type : "GET",
			dataType : "json",
			success : function(data) {
				//console.log(data);
				var resDropdown = $("#agency");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Agency----"));
				$.each(data, function(index, item) {
					var optionText = item.agency;
					resDropdown.append($("<option>").val(item.agency).text(
							optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		$.ajax({
			url : "${pageContext.request.contextPath}/api/trainingMode",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#mode");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Mode----"));
				$.each(data, function(index, item) {
					var optionText = item.trainingMode;
					resDropdown.append($("<option>").val(item.trainingMode).text(
							optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		
	</script>
 
	<script>
		function closeForm() {
			// Close the form or redirect to another page
			window.location.href = "${pageContext.request.contextPath}/AcademicCalender.jsp";
		}
		
		function checksession(startdate, enddate, callback) {
		    $.ajax({
		        url: "${pageContext.request.contextPath}/api/session/getcurrent",
		        type: "GET",
		        dataType: "json",
		        success: function(data) {
		            console.log(data);
		            var fromdate = new Date(data.fromDate);
		            var todate = new Date(data.toDate);
		            var start = new Date(startdate);
		            var end = new Date(enddate);
		            console.log(fromdate);
		            console.log(todate);
		            console.log(start);
		            console.log(end);
 
		            if (start >= fromdate && end <= todate) {
		                // Both startdate and enddate fall within the range
		                console.log("Both startdate and enddate are within the range.");
		                callback(true);
		            } else {
		                // Either startdate or enddate is outside the range
		                console.log("Either startdate or enddate is outside the range.");
		                toastr.error("Dates Out of Range!");
		                callback(false);
		            }
		        },
		        error: function(error) {
		            console.log("Error fetching venue data:", error);
		            callback(false);
		        },
		    });
		}
 
		function submitForm() {
			
			//checksession($("#startDate").val(),$("#endDate").val());
			// Collect form data and create a JSON object
			var formData = {
				tmonth : $("#trainingMonth").val(),
				tyear : $("#trainingYear").val(),
				trainingregstartdt : $("#startDate").val(),
				trainingregenddt : $("#endDate").val(),
				tagency : $("#agency").val(),
				tname : $("#tname").val(),
				tsubject : $("#subject").val(),
				tcategory : $("#category").val(),
				tspell : $("#spell").val(),
				tdescription : $("#description").val(),
				preferdlocation : $("#venue").val(),
				tgrade : $("#grade").val(),
				ttargetgroup : $("#group").val(),
				numberofstakeholder : $("#stakeholders").val(),
				numberdayneeded : $("#dayNeeded").val(),
				tmode : $("#mode").val(),
				thoursperday : $("#hoursPerDay").val(),
				totalhours : $("#totalHours").val(),
				tstatus : $("#status").val(),
 
			};
			checksession($("#startDate").val(), $("#endDate").val(), function(result) {
			    if (result) {
				$
				.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/api/savedata',
					contentType : 'application/json',
					data : JSON.stringify(formData),
					dataType : 'json', // Corrected dataType value
					success : function(response) {
						console.log(response);
						alert("Training data saved successfully");
						window.location.href = "${pageContext.request.contextPath}/AcademicCalender.jsp";
					},
					error : function(xhr, status, error) {
						console.error("API request error: " + error);
						toastr.error("Failed to save training data");
					}
				});
			}
			});
			// Make a POST request to the api/savedata endpoint
			
 
		}
	</script>
 
 
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>