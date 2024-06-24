<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		// Get field values from URL parameters
		var venueId = getUrlParameter('vid');
		var trainingId = getUrlParameter('tid');
		//console.log(trainingId,venueId);
		editVenue(trainingId, venueId);
		$('#district').change(function() {
			$('#mandal').empty();
			$('#mandal').append('<option value="">Select Mandal</option>');
			fetchMandals($('#district').val(), $('#mandal').val());
		});
		 $('#tyear').change(function() {
		        // Get the selected year
		        
		        var selectedYear = $(this).val();
		        console.log(selectedYear);
		        // Call the populateMonths function with the selected year
		        $('#tmonth').empty();
		        $('#tmonth').append('<option value="" disabled selected>---select month---</option>');
		        populateMonths(selectedYear);
		    });
	});
	window.submitForm = function() {
		var isConfirmed = confirm("Are you sure you want to edit this training?");
		
		// Proceed with deletion only if the user confirms
		if (isConfirmed) {
		updateScheduledData();
		}
		return false;
	}
	function fetchresource(id, key, value) {
	    apiCall("${pageContext.request.contextPath}/api/search/resource", "GET", "json", id, key, value);
	}
	function fetchgrade(id, key, value) {
	    apiCall("${pageContext.request.contextPath}/api/attendGrade", "GET", "json", id, key, value);
	}
	function fetchagency(id, key, value) {
	    apiCall("${pageContext.request.contextPath}/api/agency", "GET", "json", id, key, value);
	}
 
	function apiCall(url, type, dataType, id, key, value) {
	    $.ajax({
	        url: url,
	        type: type,
	        dataType: dataType,
	        success: function(data) {
	            console.log(data);
	            var dropdown = $('#' + id);
	            $.each(data, function(index, item) {
	                if (item[key] === value) {
	                    return;
	                }
	                if(id=== "venue_name"){
	                	dropdown.append($('<option>', {
							value : item[key],
							text : item[key],
							'data-additional' : item.vaddress
						}));
	                }else{
	                	dropdown.append($("<option>").val(item[key]).text(item[key]));
	                }
	                
	            });
	        },
	        error: function(xhr, status, error) {
	            console.log("Error fetching data:", error);
	        }
	    });
	}
	function populateYears(year) {
	    const tyear = $('#tyear');
	    const currentYear = new Date().getFullYear();
	    const endYear = 2040;
	    for (let i = currentYear; i <= endYear; i++) {
	    	if ((i.toString()) === year) {
	            continue;
	        }
	        tyear.append('<option value="' + i + '">' + i + '</option>');
	    }
	}
 
	function populateMonths(selectedYear) {
		const monthToSkip=$('#tmonth').val();
		 console.log( monthToSkip);
	    const tmonth = $('#tmonth');
	    const currentYear = new Date().getFullYear();
	    const currentMonthIndex = new Date().getMonth();
	    const months = [
	        'January', 'February', 'March', 'April', 'May', 'June',
	        'July', 'August', 'September', 'October', 'November', 'December'
	    ];
	    if (selectedYear == currentYear) {
	        // If the selected year is the current year, start from the current month
	        for (let i = currentMonthIndex; i < months.length; i++) {
	        	if ((months[i].toString()) === monthToSkip) {
		             continue; // Skip this iteration
		         }
	            tmonth.append('<option value="' + months[i] + '">' + months[i] + '</option>');
	        }
	    } else {
	        // Otherwise, show all months
	        months.forEach(function(month) {
	        	if (month === monthToSkip) {
		             return; // Skip this iteration
		         }
	            tmonth.append('<option value="' + month + '">' + month + '</option>');
	        });
	    }
	}
	function populateMode(modeToSkip) {
// 		console.log("hi");
	    const tmode = $('#tmode');
	    const modes = [
	        'Online', 'Offline', 'Blended'
	    ];
 
	    modes.forEach(function(mode, index) {
	    	 if (mode === modeToSkip) {
	             return; // Skip this iteration
	         }
	        tmode.append('<option value="' + mode + '">' + mode + '</option>');
	    });
	}
	
	function getUrlParameter(name) {
		name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
		var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		var results = regex.exec(location.search);
		return results === null ? '' : decodeURIComponent(results[1].replace(
				/\+/g, ' '));
	}
	
	function editVenue(trainingId, venueId) {
		console.log(trainingId,venueId)
		if (venueId && trainingId) {
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/api/fetchScheduledTrainingById/", // Replace with your actual endpoint
						
			 data: {
				 ref_planner_id: trainingId,
				 venue_id: venueId
			    },
				dataType : "json",
				success : function(data) {
					console.log(data);
					fetchDistricts(data.district,data.mandal);
					Object.keys(data).forEach(function(key) {
						$('#' + key).val(data[key]);
					});
					 	const tyear = $('#tyear');
		                tyear.append('<option value="' + data.tyear + '">' + data.tyear + '</option>');
                		populateYears(data.tyear);
                		
                		const tmode = $('#tmode');
		                tmode.append('<option value="' + data.tmode + '">' + data.tmode + '</option>');
                		populateMode(data.tmode);
                		
		                const tmonth = $('#tmonth');
		                tmonth.append('<option value="' + data.tmonth + '">' + data.tmonth + '</option>');
		               	populateMonths(data.tyear);
		               	
		               	const resourcetype = $('#resourcetype');
		               	resourcetype.append('<option value="' + data.resourcetype + '">' + data.resourcetype + '</option>');
		               	fetchresource("resourcetype","resourcetype",data.resourcetype);
		               	
		               	const tgrade = $('#tgrade');
		               	tgrade.append('<option value="' + data.tgrade + '">' + data.tgrade + '</option>');
		               	fetchgrade("tgrade","attendgrade",data.tgrade);
		               	
		               	const tagency = $('#tagency');
		               	tagency.append('<option value="' + data.tagency + '">' + data.tagency + '</option>');
		               	fetchagency("tagency","agency",data.tagency);
				},
				error : function(xhr, status, error) {
					console.error('Error fetching venue data:',xhr.responseText);
					alert('Error fetching venue data. Please check the console for details.');
				}
			});
		} else {
			alert('Ref ID not provided in the URL');
		}
	}
	var districtDropdownPopulated = false;
    var mandalDropdownPopulated = false;
 
    // Variables to store fetched data
    var districtData;
    var mandalData;
	function fetchDistricts(selectedDistrict,selectedMandal) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/api/search/district',
	        type: 'GET',
	        dataType: 'json',
	        success: function (data) {
	            const districtDropdown = $('#district');
	            // Clear existing options
	            districtDropdown.empty();
	
	            // Add the selected district as the first option
	            districtDropdown.append('<option value="' + selectedDistrict + '">' + selectedDistrict + '</option>');
	
	            // Populate the district dropdown
	            data.forEach(dist => {
	                // Check if the option already exists
	                if (dist !== selectedDistrict && districtDropdown.find(`option[value="${dist}"]`).length === 0) {
	                    const option = $('<option></option>');
	                    option.val(dist);
	                    option.text(dist);
	
	                    districtDropdown.append(option);
	                }
	            });
	
	            // Update flags and data variables
	            districtDropdownPopulated = true;
	            districtData = data;
	
	            // If a district is selected, fetch and populate mandals
	            if (selectedDistrict) {
	            	$('#mandal').empty();
	    			$('#mandal').append(
	    					'<option value="'+selectedMandal+'">'
	    							+ selectedMandal + '</option>');
	                fetchMandals($('#district').val(),$('#mandal').val());
	            }
	        },
	        error: function (error) {
	            console.error('Error fetching district data:', error);
	        }
	    });
	}
	
	function fetchMandals(dist, mandal) {
		var selectedDistrict = dist;
		//console.log(selectedDistrict);
 
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/api/mandal?district=' + dist,
			dataType : 'json',
			success : function(mandals) {
			//console.log(mandals);
				var uniqueMandals = [];
				uniqueMandals.push(mandal);
 
				$.each(mandals, function(index, m) {
					if (!uniqueMandals
							.includes(m)) {
						uniqueMandals.push(m);
						$('#mandal').append(
								'<option value="' + m + '">'
										+ m
										+ '</option>');
					}
				});
			},
			error : function(error) {
				console.error(
						'Error fetching mandals: ',
						error);
			}
		});
	}
	
	function updateScheduledData() {
	    if (validateForm()) {
	    	var modifiedTid = $("#ref_planner_id").val();
	    	var modifiedVid = $("#venue_id").val();
	    	console.log(modifiedVid,modifiedTid);

	        var modifiedData = {};
	     
	        $('#myForm input, #myForm select').each(function() {
	            // Get the id and value of each input/select element
	            var id = $(this).attr('id');
	            var value = $(this).val().trim(); // Trim whitespace from the value
 
	            // Add the id-value pair to the formData object
	            modifiedData[id] = value;
	        });
	        //console.log(modifiedData);
	        // Perform AJAX request to update the data
	        
	        $.ajax({
	            type: "PUT",
	            url: "${pageContext.request.contextPath}/api/updateScheduledTraining?ref_planner_id=" + modifiedTid + "&venue_id=" + modifiedVid,
	            contentType: "application/json",
	            data: JSON.stringify(modifiedData),
	            success: function (response) {
	            	console.log(response);
	                alert("Training Scheduled successfully");
	                window.location.href = "${pageContext.request.contextPath}/viewTrainings.jsp";
	            },
	            error: function (xhr, status, error) {
	                console.error("Failed to update venue: " + error);
	                alert("Failed to update venue: " + error);
	            }
	        });
	    }
	    else{
	    	return;
	    }
	}
	
	function validateForm() {
		var formIds = [
		    "ref_planner_id",
		    "tmode",
		    "vaddress",
		    "tagency",
		    "coordinator_mobile",
		    "apply_start_dt",
		    "venue_id",
		    "tmonth",
		    "tmodule",
		    "maplocation",
// 		    "tstate",
		    "apply_end_dt",
		    "tname",
		    "tyear",
		    "tdescription",
		    "coordinatorname",
		    "district",
		    "training_start_dt",
		    "venue_name",
		    "resourcetype",
		    "tgrade",
		    "coordinator_email",
		    "mandal",
		    "training_end_dt",
		    "schedulebudget",
		    "tendtime",
		    "tstarttime"
		];
 
	    
	    var emailInput = document.getElementById("coordinator_email");
	    var email = emailInput.value;
	    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	    if (!emailPattern.test(email)) {
	        alert("Please enter a valid email address.");
	        return false;
	    }
// 	    Check each required field
	    for (var i = 0; i < formIds.length; i++) {
	        var field = formIds[i];
	        var value = $("#" + field).val();
	        
	        if (value === null || value === "") {
	            alert("Please fill in all required fields.");
	            return false; // Exit the function if any field is empty
	        }
	    }
 
    // Return true if all required fields are filled
    	return true;
	}
 
</script>

</head>
<body>
	<div class="container" , align="center">
		<h1 class="text-center">Edit Schedule</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="ref_planner_id">Training Planner Id:</label> <input
							type="text" id="ref_planner_id" name="ref_planner_id"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="vaddress">Venue Address:</label> <input type="text"
							id="vaddress" name="vaddress" class="form-control"
							placeholder="Enter Venue Address" required readonly>
					</div>
					<div class="form-group">
						<label for="resourcetype">Resource Type:</label> <select
							id="resourcetype" class="form-control" name="resourcetype"
							required></select>
					</div>
					<div class="form-group">
						<label for="tagency">Agency:</label> <select id="tagency"
							name="vcontactno" class="form-control" name="tagency" required></select>
					</div>
					<div class="form-group">
						<label for="coordinator_mobile">Co-Ordinator Mobile:</label> <input
							type="text" id="coordinator_mobile" class="form-control"
							name="coordinator_mobile" placeholder="Enter Mobile"
							pattern="\d{10}"
							oninput="this.value = this.value.replace(/\D/g, '')"
							title="Please enter 10 numbers" maxlength="10" required>
					</div>
					<div class="form-group">
						<label for="apply_start_dt">Application Start Date:</label> <input
							type="Date" id="apply_start_dt" class="form-control"
							name="apply_start_dt" required>
					</div>
					<div class="form-group">
						<label for="tstarttime">Training Start Time:</label> <input
							type="time" id="tstarttime" class="form-control"
							name="tstarttime" required>
					</div>

					<div class="form-group" style="display: none;">
						<label for="accountholdername">Account Holder Name:</label> <input
							type="text" id="accountholdername" name="accountholdername"
							class="form-control">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="venue_id">Venue Id:</label> <input type="text"
							id="venue_id" class="form-control" name="venue_id" readonly>
					</div>

					<div class="form-group">
						<label for="tmonth">Training Month:</label> <select id="tmonth"
							name="tmonth" class="form-control" required>
						</select>
					</div>
					<div class="form-group">
						<label for="maplocation">Map Location:</label> <input type="text"
							id="maplocation" name="maplocation" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="tmodule">Module:</label> <input type="text"
							id="tmodule" name="tmodule" class="form-control" required>
					</div>

						<div class="form-group">
						<label for="schedulebudget">Budget:</label> <input type="text"
							id="schedulebudget" class="form-control" name="schedulebudget"
							placeholder="Enter Budget" pattern="\d*"
							oninput="this.value = this.value.replace(/\D/g, '')"
							title="Please enter only numbers" maxlength="50" required>
					</div>

					<div class="form-group">
						<label for="apply_end_dt">Application End Date:</label> <input
							type="Date" id="apply_end_dt" name="apply_end_dt"
							class="form-control" required></input>
					</div>
					<div class="form-group">
						<label for="tendtime">Training End Time:</label> <input
							type="time" id="tendtime" class="form-control" name="tendtime"
							required>
					</div>
					<div class="form-group" style="display: none;">
						<label for="bankname">Bank Name:</label> <input type="text"
							id="bankname" name="bankname" class="form-control" >
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="tname">Training Name:</label> <input type="text"
							id="tname" class="form-control" name="tname" readonly>
					</div>

					<div class="form-group">
						<label for="tyear">Training Year:</label> <select
							class="form-control" id="tyear" name="tyear" required>
						</select>
					</div>
					<div class="form-group">
						<label for="tdescription">Description:</label> <input type="text"
							id="tdescription" name="tdescription" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label for="coordinatorname">Coordinator Name:</label> <input
							type="text" id="coordinatorname" name="coordinatorname"
							class="form-control" required>
					</div>
					<div class="form-group">
						<label for="district">District:</label> <select id="district"
							name="district" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="training_start_dt">Training Start Date:</label> <input
							type="Date" id="training_start_dt" name="training_start_dt"
							class="form-control" required>
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label for="schedulebudget">Budget:</label> <input type="text" -->
<!-- 							id="schedulebudget" class="form-control" name="schedulebudget" -->
<!-- 							placeholder="Enter Budget" pattern="\d*" -->
<!-- 							oninput="this.value = this.value.replace(/\D/g, '')" -->
<!-- 							title="Please enter only numbers" maxlength="50" required> -->
<!-- 					</div> -->

				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="venue_name">Venue Name:</label> <input type="text"
							id="venue_name" class="form-control"
							placeholder="Enter Venue Name" required readonly>
					</div>
					<div class="form-group">
						<label for="tmode">Training Mode:</label> <select id="tmode"
							class="form-control" name="tmode"></select>
					</div>
					<div class="form-group">
						<label for="tgrade">Grade:</label> <select id="tgrade"
							name="tgrade" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="coordinator_email">Coordinator Email:</label> <input
							type="email" id="coordinator_email" class="form-control"
							placeholder="Enter Email" required>
					</div>

					<div class="form-group">
						<label for="mandal">Mandal:</label> <select id="mandal"
							class="form-control" name="mandal" required></select>
					</div>
					<div class="form-group">
						<label for="training_end_dt">Training End Date:</label> <input
							type="Date" id="training_end_dt" name="training_end_dt"
							class="form-control" required></input>
					</div>
					<div class="form-group" style="display: none;">
						<label for="ifsccode">IFSC Code:</label> <input type="text"
							id="ifsccode" name="ifsccode" class="form-control" >
					</div>


				</div>
			</div>
			<div class="row">

				<div class="col" align="center">
					<button type="submit" class="btn btn-primary btn-md">Update</button>
					&nbsp;
					<button type="button" class="btn btn-danger btn-md"
						onclick="closeForm()">Cancel</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>