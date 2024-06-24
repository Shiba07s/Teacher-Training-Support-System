<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<meta name="description" content="" />

<meta name="author" content="" />

<title>TTSS</title>

<!-- Favicon-->

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>



<!-- Add this script tag after including Toastr CSS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>

<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Add this in the head section of your HTML file -->

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

</head>

<body>

	<div class="container tab-content " id="tab3">

		<!-- Form Start  -->

		<div class="card mt-3">

			<div class="card-header text-center">

				<h4>Training Schedule form</h4>

			</div>

			<!-- ################################ -->

			<div class="container mt-2">

				<!-- <div class="card"> -->

				<!-- <div class=""> -->

				<form class="card-body shadow-lg bg-body-tertiary rounded" id="top">

					<div class="row">

						<div class="form-group col-md-3">

							<label for="trainingReferenceId" class="form-label">RefPlannerID</label>

							<div class="form-floating">

								<input type="text" class="form-control" id="trainingReferenceId"
									style="font-size: 14px;">


							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<button type="button" class="btn btn-primary btn-lg"
									Id="searchButton" style="position: relative; top: 15px">Search</button>

							</div>

						</div>

						<!-- <div class="form-group col-md-3"> -->

						<!-- <div class="form-floating"> -->

						<!-- <label for="schedulebudget">Scheduled Budget</label> -->

						<!-- <input type="text"  id="schedulebudget"  required  >  -->


						<!-- </div> -->

						<!-- </div> -->

						<div class="form-group col-md-3">

							<label for="schedulebudget" class="form-label">Estimated
								Budget</label>

							<div class="form-floating">

								<input type="text" class="form-control" id="schedulebudget"
									style="font-size: 14px;" required>


							</div>

						</div>

						<!-- <div class="form-group col-md-3"> -->

						<!-- <div class="form-group" id="venueName"> -->

						<!-- <label for="venue">Venue Type:</label> <select -->

						<!-- <option value="NA">--Select Mode--</option> -->

						<!-- <option value="xxxxxx">xxxxxxx</option> -->

						<!-- <option value="yyyyyyy">yyyyyyy</option> -->

						<!-- id="venueDropdown" class="form-control" required></select> -->

						<!-- </div> -->

						<!-- </div> -->

						<div class="form-group col-md-3">

							<div class="form-group" id="resourceType">

								<label for="resource">Resource Type:</label> <select
									id="resourceDropdown" class="form-control" required></select>

							</div>

						</div>


						<div class="form-group" style="display: none;">

							<label for="venue" class="form-label">Venue Id:</label> <input type="text"
								class="form-control" id="venueId" name="venueId">

						</div>

						<div class="form-group" style="display: none;">

							<label for="venuename1">Venue Name1:</label> <input type="text"
								class="form-control" id="venuename1" name="venueId">

						</div>



					</div>

				</form>

			</div>

			<!-- ################################### -->









			<div class="card-body" style="font-size: 12px">

				<span class="text-danger"> * After search respective data

					will auto populated</span>



				<form class="card-body shadow-lg p-3 mb-5 bg-body-tertiary rounded"
					id="middle">

					<div class="row">

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="trainingName"
									placeholder="12343215" required readonly> <label
									for="trainingName">Training Name</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="tcategory"
									placeholder="12343215" required readonly> <label
									for="tcategory">Training Category</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="module"
									placeholder="99372257343" required readonly> <label
									for="module">Module</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="trainingMode"
									placeholder="99372257343" required readonly> <label
									for="trainingMode">Training Mode</label>

							</div>

						</div>


					</div>

					<!-- ################### 2nd ################ -->

					<div class="row mt-1">



						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="description"
									placeholder="12343215" required readonly> <label
									for="description">Description</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="grade"
									placeholder="12343215" required readonly> <label
									for="grade">Grade</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="noofvenue"
									placeholder="12343215" required> <label
									for="noofvenue">No Of Venue</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="agency"
									placeholder="99372257343" required readonly> <label
									for="agency">Agency</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="vaddress"
									placeholder="12343215" readonly> <label
									for="description">Venue Address</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="maplocation"
									placeholder="12343215" readonly> <label
									for="mapLocation">Map Location</label>

							</div>

						</div>


					</div>

					<!-- ################################# 3rd ############################# -->

					<div class="row mt-1">

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="trainingMonth"
									placeholder="12343215" required readonly> <label
									for="trainingMonth">Training Month</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="text" class="form-control" id="trainingYear"
									placeholder="12343215" required readonly> <label
									for="trainingYear">Training Year</label>

							</div>

						</div>


						<div class="form-group col-md-3">

							<div class="form-floating">

								<select class="form-control" id="trainingtypes">

									<option value="" selected disabled>----Select----</option>

									<option value="Residential">Residential</option>

									<option value="Non Residential">Non Residential</option>

								</select> <label for="trainingtypes">Training Type</label>

							</div>

						</div>


						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="coordinatorName"
									placeholder="12343215" readonly> <label
									for="coordinatorName">Co-Ordinater Name</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="email"
									placeholder="12343215" readonly> <label for="email">email</label>

							</div>

						</div>

					</div>

					<!-- ############################# 4th ###############################

            -->

					<div class="row mt-1">

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="mobile"
									placeholder="" readonly> <label for="mobile">Mobile</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="state"
									placeholder="" readonly> <label for="state">State</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="district"
									placeholder="12343215" readonly> <label for="district">District</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="mandal"
									placeholder="12343215" readonly> <label for="mandal">mandal</label>

							</div>

						</div>

					</div>



					<div class="row mt-1" style="font-size: 12px">

						<span class="text-danger">* Please Fill The Bellow date</span>

					</div>



					<div class="row mt-1">

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="Date" class="form-control " id="applicationSD"
									required> <label for="applicationSD">Application

									Start Date</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="Date" class="form-control" id="applicationED"
									placeholder="99372257343" required> <label
									for="applicationED">Application End Date</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="Date" class="form-control" id="trainingSD"
									placeholder="12343215" required> <label
									for="trainingSD">Training Start Date</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="time" class="form-control" id="starttime"
									placeholder="12343215" required> <label for="starttime">Training

									Start Time</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="Date" class="form-control" id="trainingED"
									placeholder="12343215" required> <label
									for="trainingED">Training End date</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating">

								<input type="time" class="form-control" id="endtime"
									placeholder="12343215" required> <label for="endtime">Training

									End Time</label>

							</div>

						</div>

					</div>


					<!-- <div class="row mt-1"> -->

					<!-- <span class="text-danger">* Please Fill The Bellow Budget</span> -->

					<!-- </div> -->



					<div class="row mt-1">


						<!-- <div class="form-group col-md-3"> -->

						<!-- <div class="form-floating"> -->

						<!-- <input type="text" class="form-control" id="schedulebudget" placeholder="12343215" required readonly >  -->

						<!-- <label for="schedulebudget">Scheduled Budget</label> -->

						<!-- </div> -->

						<!-- </div> -->

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="accountholdername"
									placeholder="12343215" readonly> <label
									for="accountholdername">Account Holder Name</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="bankname"
									placeholder="12343215" readonly> <label for="bankname">Bank
									Name</label>

							</div>

						</div>

						<div class="form-group col-md-3">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="ifsccode"
									placeholder="12343215" readonly> <label for="ifsccode">IFSC
									Code</label>

							</div>

						</div>


						<div class="form-group col-md-3" style="display: none;">

							<div class="form-floating" style="display: none;">

								<input type="text" class="form-control" id="vcapacity"
									placeholder="12343215" readonly> <label
									for="vcapacity">Venue Capacity </label>

							</div>

						</div>


					</div>
			</div>

			<div class="row mt-2">

				<div class="col-md-2"></div>

				<div class="col-md-2 col-sm-12">

					<button type="button" class="btn btn-primary btn-lg btn-block"
						Id="saveSchedule">Schedule</button>

				</div>

				<div class="col-md-2 col-sm-12 mt-2 mt-md-0   ">

					<button type="button" class="btn btn-danger btn-lg btn-block "
						onclick="fun()">Clear</button>

				</div>

				<div class="col-md-8"></div>



			</div>



			</form>

		</div>

	</div>

	<form></form>



	</div>

	<script>
		$(document)
				.ready(
						function() {

							$("#saveSchedule")
									.click(
											function() {

												if (validateForm()) {

													var trainingRefId = $(
															"#trainingReferenceId")
															.val();

													//var tvenueId = $("#venueId").val();

													var r_type = $(
															"#resourceDropdown")
															.val();

													var trainingMode = $(
															"#trainingMode")
															.val();

													var trainingMonth = $(
															"#trainingMonth")
															.val();

													var trainingYear = $(
															"#trainingYear")
															.val();

													var trainingName = $(
															"#trainingName")
															.val();

													var module = $("#module")
															.val();

													var description = $(
															"#description")
															.val();

													var grade = $("#grade")
															.val();

													var noofvenue = $(
															"#noofvenue").val();

													var agency = $("#agency")
															.val();

													//var coordinatorname = $("#coordinatorName").val();

													//var cemail = $("#email").val();

													//var cmobile = $("#mobile").val();

													//var tstate = $("#state").val();

													//var tdistrict = $("#district").val();

													//var tmandal = $("#mandal").val();

													var astartDate = $(
															"#applicationSD")
															.val();

													var aendDate = $(
															"#applicationED")
															.val();

													var tstartDate = $(
															"#trainingSD")
															.val();

													var tendDate = $(
															"#trainingED")
															.val();

													//var location = $("#maplocation").val();

													//var vaddress = $("#vaddress").val();

													var tstarttime = $(
															"#starttime").val();

													var tendtime = $("#endtime")
															.val();

													//var vname = $("#venuename1").val();

													var schedulebudget = $(
															"#schedulebudget")
															.val();

													//var accountholdername = $("#accountholdername").val();

													//var bankname = $("#bankname").val();

													//var ifsccode = $("#ifsccode").val();

													//var vcapacity = $("#vcapacity").val();

													var trainingtypes = $(
															"#trainingtypes")
															.val();

													var tcategory = $(
															"#tcategory").val();

													// Construct the formData object

													var formData = {

														ref_planner_id : trainingRefId,

														//venue_id : tvenueId,

														resourcetype : r_type,

														tmode : trainingMode,

														tmonth : trainingMonth,

														tyear : trainingYear,

														tname : trainingName,

														tmodule : module,

														tdescription : description,

														tgrade : grade,

														tagency : agency,

														//coordinatorname : coordinatorname,

														//coordinatoremailid : cemail,

														//coordinatormobileno : cmobile,

														//state : tstate,

														//district : tdistrict,

														//mandal : tmandal,

														apply_start_dt : astartDate,

														apply_end_dt : aendDate,

														training_start_dt : tstartDate,

														training_end_dt : tendDate,

														//maplocation : location,

														//vaddress : vaddress,

														tstarttime : tstarttime,

														tendtime : tendtime,

														//venuetype : vname,

														schedulebudget : schedulebudget,

														//accountholdername : accountholdername,

														//bankname : bankname,

														//ifsccode : ifsccode,

														//vcapacity : vcapacity,

														noofvenue : noofvenue,

														trainingtype : trainingtypes,

														trainingcategory : tcategory,

													};

													//console.log(formData);

													// Make the API call through AJAX

													$
															.ajax({

																url : '${pageContext.request.contextPath}/api/schedule/training',

																type : 'POST',

																contentType : 'application/json',

																data : JSON
																		.stringify(formData),

																success : function(
																		data) {

																	console
																			.log(
																					"Schedule API response:",
																					data);

																	alert("Training Schedule Successfully!");

																	// sessionStorage.setItem('ref_planner_id', trainingRefId);

																	//    sessionStorage.setItem('tname', trainingName);

																	//    sessionStorage.setItem('resourcetype', r_type);

																	//    sessionStorage.setItem('tmode', trainingMode);

																	//    sessionStorage.setItem('tmonth', trainingMonth);

																	//    sessionStorage.setItem('tyear', trainingYear);

																	//    sessionStorage.setItem('tmodule', module);

																	//    sessionStorage.setItem('tdescription', description);

																	//    sessionStorage.setItem('tgrade', grade);

																	//    sessionStorage.setItem('tagency', agency);

																	//    sessionStorage.setItem('apply_start_dt', astartDate);

																	//    sessionStorage.setItem('apply_end_dt', aendDate);

																	//    sessionStorage.setItem('training_start_dt', tstartDate);

																	//    sessionStorage.setItem('training_end_dt', tendDate);

																	//    sessionStorage.setItem('tstarttime', tstarttime);

																	//    sessionStorage.setItem('tendtime', tendtime);

																	//    sessionStorage.setItem('schedulebudget', schedulebudget);

																	//    sessionStorage.setItem('noofvenue', noofvenue);

																	//    sessionStorage.setItem('venuetype', vname);

																	//    sessionStorage.setItem('trainingType', trainingType);

																	// // Wait for 1 second (1000 milliseconds)

																	setTimeout(
																			function() {

																				// Redirect to another page (replace 'yourPage.html' with the actual page URL)

																				window.location.href = '${pageContext.request.contextPath}/venuemapping.jsp';

																				// window.location.href = '/Admin_dashboard.html';

																			},
																			1000);

																},

																error : function(
																		error) {

																	console
																			.error(
																					"Error:",
																					error);

																	alert("An error occurred. Please try again.");

																}

															});

												}

											});

						});

		//script-2

		$("#searchButton").click(function() {

			var searchTerm = $("#trainingReferenceId").val();

			checkIfTrainingScheduled(searchTerm);

		});

		function checkIfTrainingScheduled(searchTerm) {

			$
					.ajax({

						type : "GET",

						url : "${pageContext.request.contextPath}/api/schedule/trainings/byId?ref_planner_id="
								+ searchTerm,

						dataType : "json",

						success : function(response) {

							console.log(response);

							if (response == true) {

								alert("This Training Already Scheduled, Please Schedule Another Training");

								window.location.reload();

							}

							else if (response == false) {

								alert("Training not scheduled, proceed with fetching details");

								fetchTrainingDetails(searchTerm);

							}

							else {

								alert("else");

							}

						},

						error : function(error) {

							//fetchTrainingDetails(searchTerm);

							console.error("Error:", error);

						}

					});

		}

		function fetchTrainingDetails(searchTerm) {

			$
					.ajax({

						type : "GET",

						url : "${pageContext.request.contextPath}/api/search/schedule?ref_planner_id="
								+ searchTerm,

						dataType : "json",

						success : function(response) {

							console.log(response);

							var tmonth = response[0].tmonth;

							var tyear = response[0].tyear;

							var tname = response[0].tname;

							var tdescription = response[0].tdescription;

							var tmode = response[0].tmode;

							var tgrade = response[0].tgrade;

							var tagency = response[0].tagency;

							var tcategory = response[0].tcategory;

							var module = response[0].t_subjects;

							$("#trainingMonth").val(tmonth);

							$("#trainingYear").val(tyear);

							$("#trainingName").val(tname);

							$("#description").val(tdescription);

							$("#traningMode").val(tmode);

							$("#grade").val(tgrade);

							$("#trainingMode").val(tmode);

							$("#agency").val(tagency);

							$("#tcategory").val(tcategory);

							$("#module").val(module);

						},

						error : function(error) {

							console.error("Error:", error);

						}

					});

		}

		function formatDate(inputDate) {

			var date = new Date(inputDate);

			var year = date.getFullYear();

			var month = String(date.getMonth() + 1).padStart(2, '0');

			var day = String(date.getDate()).padStart(2, '0');

			return year + "-" + month + "-" + day;

		}

		$(document).ready(function() {

			$.ajax({

				url : "${pageContext.request.contextPath}/api/search/resource",

				//url: "/api/search/resource",

				type : "GET",

				dataType : "json",

				success : function(data) {

					var resDropdown = $("#resourceDropdown");

					resDropdown.empty();

					resDropdown.append($("<option>").val("").text(

					"----Select Resource----"));

					$.each(data, function(index, item) {

						var optionText = item.resourcetype;

						resDropdown.append($("<option>").val(item.resourcetype)

						.text(optionText));

					});

				},

				error : function(error) {

					console.log("Error fetching venue data:", error);

				}

			});

		});

		function validateForm() {

			var isValid = true;

			// Check each required field

			$(".form-control[required]").each(function() {

				if (!$(this).val()) {

					// If any required field is empty, set isValid to false

					isValid = false;

					toastr.error("Please fill in all required fields.");

					return isValid; // Exit the loop early

				}

			});

			return isValid;

		}

		function fun() {

			document.getElementById("top").reset();

			document.getElementById("middle").reset();

		}
	</script>




</body>

</html>