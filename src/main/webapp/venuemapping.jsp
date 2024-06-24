 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Training to Venue Mapping</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
    
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }
    
        .form-row {
            margin-left: 70px;
        }
    
        label {
            font-weight: bold;
            color: #333;
        }
    
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
    
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    
        th {
            background-color: #008CBA; /* Update the background color */
            color: #fff; /* Set text color to white for better visibility */
            border: 1px solid white;
 
        }
    
        .delete-btn, .btn {
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
            transition: background-color 0.3s;
        }
    
    
        .delete-btn {
            background-color: #dc3545;
        }
    
        .delete-btn:hover {
            background-color: #c82333;
        }
    
        .btn-primary, .btn-success, .btn-danger {
            background-color: #007bff;
        }
    
/*         .btn-primary:hover, .btn-success:hover, .btn-danger:hover { */
/*             background-color: #0056b3; */
/*         } */
    
        #addNewRowBtn {
            margin-top: 20px;
            background-color: #28a745;
        }
        
     
.btn-success {
    background-color: #28a745;
}
 
 
.btn-danger {
    background-color: #dc3545;
}
    
        #addNewRowBtn:hover {
            background-color: #218838;
        }
    
        .btn-submit {
            background-color: #007bff;
        }
    
        .btn-submit:hover {
            background-color: #0056b3;
        }
    
        .btn-clear {
            background-color: #dc3545;
        }
    
        .btn-clear:hover {
            background-color: #c82333;
        }
        
        
.button-container {
    display: flex;
    justify-content: flex-end;
    gap: 5px;
    margin-left: 20px;
    margin-right: 20px;
}
        
   
        
        
table input[type="text"],
table input[type="number"] {
    width: 140px;
}
 
table select {
    width: 140px;
}
 
        
 
    </style>
    
    
</head>
<body>
	<h2>Training to Venue Mapping</h2> 
	<div class="form-row">
			<div class="form-group col-md-3" style="display: none;">
			<label for="trainingid">Training ID:</label> <input type="text"
				class="form-control" id="trainingid" name="trainingid" readonly
				required>
		</div>
				<div class="form-group col-md-3">
			<label for="trainingname">Training Name:</label> 
				<select id="trainingname" class="form-control"   required></select>
		</div>
 
<!-- 		<div class="form-group col-md-3"> -->
<!-- 					<label for="trainingname">Training Name:</label> <input type="text" -->
<!-- 				class="form-control" id="trainingname" name="trainingname" readonly -->
<!-- 				required> -->
<!-- 		</div> -->
	</div>
 
	<div class="container">
		<button class="btn btn-primary" id="addNewVenueBtn"
			onclick="redirectPage()">Add New Venue</button>
			<div class="table-responsive">
		 <table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Sl No.</th>
					<th>Venue Name</th>
					<th>District</th>
					<th>Mandal</th>
					<th>Coordinator Details</th>
					<th>Venue Type</th>
					<th>Venue Capacity</th>
					<th>Action</th>
					<th style="display: none;">Co-Ordinator Name</th>
					<th style="display: none;">Co-Ordinator Email</th>
					<th style="display: none;">Co-Ordinator Mobile</th>
					<th style="display: none;">Venue Address</th>
					<th style="display: none;">Map Location</th>
				</tr>
			</thead>
			<tbody id="tableBody">
				<tr id="row1">
					<td class="serial-number">1</td>
					<td><select class="venue-dropdown"onchange="getSingleVenueDetails(this)">
						
							<!-- Dropdown options will be populated dynamically -->
					</select></td>
					<td><input type="text" class="district"></td>
					<td><input type="text" class="mandal"></td>
					<td><input type="text" class="coordinator-details"></td>
					<td><input type="text" class="venue-type"></td>
					<td><input type="number" class="venue-capacity"></td>
					<td><button class="delete-btn" onclick="deleteRow(this)">Delete</button></td>
					<td style="display: none;"><input type="text" class="coordinatorname"></td>
					<td style="display: none;"><input type="text" class="coordinatoremail"></td>
					<td style="display: none;"><input type="number" class="coordinatormobile"></td>
					<td style="display: none;"><input type="text" class="venue-address"></td>
					<td style="display: none;"><input type="text" class="maplocation"></td>
					
				</tr>
			</tbody>
		</table>
	</div>
		<button class="btn btn-primary" id="addNewRowBtn"> + Add Mapping Venue</button>
        <!-- <button class="btn btn-primary" id="addNewRowBtn">Add Another Venue For This Training</button> -->
 
	</div>
<div class="button-container">
    <button type="button" class="btn btn-success" onclick="saveAllData()">Submit</button>
    <button type="button" class="btn btn-danger">Clear</button>
</div>
	<script>
        function redirectPage(){
            window.location.href = '${pageContext.request.contextPath}/AddNewVenue.jsp'; // Replace with your target page
        }
        
        function getsingletrainingdetails(){
        	 const selectedTrainingId = document.getElementById('trainingname').value;
 
             $.ajax({
                 type: "GET",
                 url: "${pageContext.request.contextPath}/api/schedule/training/byId?ref_planner_id=" + selectedTrainingId,
                 success: function(data) {
                    
                     
 
                     // Calculate duration between application start date and training start date
                    
                 },
                 error: function(error) {
                     console.error('Error fetching training details:', error);
                     alert('Error fetching training details. Please try again.');
                 }
             });
        }
        
        
        
 
        function saveAllData() {
            const selectedTrainingId = document.getElementById('trainingname').value;
 
            // AJAX call to fetch training details
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/schedule/training/byId?ref_planner_id=" + selectedTrainingId,
                success: function(trainingData) {
                    // Extract training data
                    var refPlannerId = trainingData.ref_planner_id;
                    var tname = trainingData.tname;
                    var resourceType = trainingData.resourcetype;
                    var tmode = trainingData.tmode;
                    var tmonth = trainingData.tmonth;
                    var tyear = trainingData.tyear;
                    var tmodule = trainingData.tmodule;
                    var tdescription = trainingData.tdescription;
                    var tgrade = trainingData.tgrade;
                    var tagency = trainingData.tagency;
                    var astartdt = trainingData.apply_start_dt;
                    var aenddt = trainingData.apply_end_dt;
                    var tstartdt = trainingData.training_start_dt;
                    var tenddt = trainingData.training_end_dt;
                    var tstarttime = trainingData.tstarttime;
                    var tendtime = trainingData.tendtime;
                    var scheduleBudget = trainingData.schedulebudget;
                    var noOfVenue = trainingData.noofvenue;
                    var venueType = trainingData.noofvenue;
                    var trainingType = trainingData.trainingtype;
 
                    console.log(refPlannerId);
                    console.log(resourceType);
                    console.log(tname);
                    console.log(astartdt);
                    console.log(tstarttime);
                    console.log(noOfVenue);
 
                    // Initialize venues array
                    var venues = [];
                    var rowCount = document.querySelectorAll('#tableBody tr').length;
 
                    // Populate venues array with form data and venue details
                    for (var i = 1; i <= rowCount; i++) {
                        // Select elements within the current row
                        var venueDropdown = document.querySelector('#row' + i + ' .venue-dropdown');
                        var district = document.querySelector('#row' + i + ' .district');
                        var mandal = document.querySelector('#row' + i + ' .mandal');
                        var coordinatorDetails = document.querySelector('#row' + i + ' .coordinator-details');
                        var venueType = document.querySelector('#row' + i + ' .venue-type');
                        var venueCapacity = document.querySelector('#row' + i + ' .venue-capacity');
                        var venueAddress = document.querySelector('#row' + i + ' .venue-address');
                        var CoOrdinatorName = document.querySelector('#row' + i + ' .coordinatorname');
                        var CoOrdinatorEmail = document.querySelector('#row' + i + ' .coordinatoremail');
                        var CoOrdinatorMobile = document.querySelector('#row' + i + ' .coordinatormobile');
                        var MapLocation = document.querySelector('#row' + i + ' .maplocation');
 
                        // Get values from the selected elements
                        var venueId = venueDropdown.value;
                        var venueName = venueDropdown.options[venueDropdown.selectedIndex].textContent;
                        var districtValue = district.value;
                        var mandalValue = mandal.value;
                        var coordinatorDetailsValue = coordinatorDetails.value;
                        var venueTypeValue = venueType.value;
                        var venueCapacityValue = venueCapacity.value;
                        var CoOrdinatorNameValue = CoOrdinatorName.value;
                        var CoOrdinatorEmailValue = CoOrdinatorEmail.value;
                        var CoOrdinatorMobileValue = CoOrdinatorMobile.value;
                        var Venueaddress = venueAddress.value;
                        var MapLocationValue = MapLocation.value;
 
                        // Create venue object
                        var venueData = {
                            ref_planner_id: refPlannerId,
                            tname: tname,
                            resourcetype: resourceType,
                            tmode: tmode,
                            tmonth: tmonth,
                            tyear: tyear,
                            tmodule: tmodule,
                            tdescription: tdescription,
                            tgrade: tgrade,
                            tagency: tagency,
                            apply_start_dt: astartdt,
                            apply_end_dt: aenddt,
                            training_start_dt: tstartdt,
                            training_end_dt: tenddt,
                            tstarttime: tstarttime,
                            tendtime: tendtime,
                            schedulebudget: scheduleBudget,
                            noofvenue: noOfVenue,
                            venue_id: venueId,
                            venue_name: venueName,
                            district: districtValue,
                            mandal: mandalValue,
                            coordinator_details: coordinatorDetailsValue,
                            coordinatoremailid: CoOrdinatorEmailValue,
                            coordinatormobileno: CoOrdinatorMobileValue,
                            coordinatorname: CoOrdinatorNameValue,
                            vaddress: Venueaddress,
                            maplocation: MapLocationValue,
                            venuetype: venueTypeValue,
                            vcapacity: venueCapacityValue,
                            trainingtype: trainingType,
                            
                        };
 
                        // Push venue object into venues array
                        venues.push(venueData);
                    }
 
                    console.log('Venues Array:', venues);
 
                    // Proceed with further processing...
                    // Example: Sending data to server via AJAX
                    $.ajax({
                        url: '${pageContext.request.contextPath}/api/schedule',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(venues),
                        success: function(data) {
                            console.log("Schedule API response:", data);
                            alert("Training Schedule Successfully!");
                            // Redirect to another page after success
                            setTimeout(function() {
                                window.location.href = '${pageContext.request.contextPath}/budgetmapping2.jsp';
                            }, 1000);
                        },
                        error: function(error) {
                            console.error("Error:", error);
                            alert("An error occurred. Please try again.");
                        }
                    });
                },
                error: function(error) {
                    console.error('Error fetching training details:', error);
                    alert('Error fetching training details. Please try again.');
                }
            });
        }
 
 
        var rowCount = 1; // Initialize row count
 
        function deleteRow(button) {
            var row = button.closest('tr');
            row.parentNode.removeChild(row);
        }
 
 
 
 
        // Function to add new row
        function addNewRow() {
            rowCount++; // Increment row count
            var table = document.getElementById('tableBody');
            var lastRow = table.rows[table.rows.length - 1];
            var newRow = lastRow.cloneNode(true); // Clone the last row
 
            // Update IDs and names
            newRow.id = 'row' + rowCount;
            newRow.querySelector('.serial-number').textContent = rowCount;
 
            // Clear input values
            newRow.querySelectorAll('input').forEach(function(element) {
                element.value = '';
            });
 
            // Append the new row to the table
            table.appendChild(newRow);
        }
 
        // Event listener for Add New Row button
        document.getElementById('addNewRowBtn').addEventListener('click', addNewRow);
 
        // Fetch dropdown values from API
        window.addEventListener('DOMContentLoaded', function() {
//             document.getElementById('trainingid').value = sessionStorage.getItem('ref_planner_id');
//             document.getElementById('trainingname').value = sessionStorage.getItem('tname');
            
            fetch('${pageContext.request.contextPath}/api/schedule/training/all')
            .then(response => response.json())
            .then(data => {
            	console.log(data);
                const dropdowns = document.getElementById('trainingname'); // Assuming the class name for all training name dropdowns is 'trainingname-dropdown'
                
                // Iterate through each dropdown
                
                    // Clear existing options
                    dropdowns.innerHTML = '';
                    
                    // Add default/placeholder option
                    const defaultOption = document.createElement('option');
                    defaultOption.value = ''; // Set value as per your requirement
                    defaultOption.textContent = 'Select a training name'; // Text for default/placeholder option
                    dropdowns.appendChild(defaultOption);
                    
                    // Add training name options
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.ref_planner_id; // Adjust according to your API response
                        option.textContent = item.tname; // Adjust according to your API response
                        dropdowns.appendChild(option);
                    });
                
            })
            .catch(error => console.error('Error fetching dropdown values:', error));
 
            
            
            
            
            fetch('${pageContext.request.contextPath}/api/search/venue')
            .then(response => response.json())
            .then(data => {
                for (let i = 1; i <= rowCount; i++) {
                    const dropdown = document.querySelector('#row' + i + ' .venue-dropdown');
                    
                    // Add default/placeholder option
                    const defaultOption = document.createElement('option');
                    defaultOption.value = ''; // Set value as per your requirement
                    defaultOption.textContent = 'Select a venue'; // Text for default/placeholder option
                    dropdown.appendChild(defaultOption);
                    
                    // Add venue options
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.vid;
                        option.textContent = item.vname;
                        dropdown.appendChild(option);
                    });
                }
            })
            .catch(error => console.error('Error fetching dropdown values:', error));
 
        });
 
        // Function to handle dropdown change for dynamically added rows
        function getSingleVenueDetails(dropdown) {
            var selectedVenue = dropdown.value;
            console.log('Selected Venue:', selectedVenue);
 
            $.ajax({
                url: "${pageContext.request.contextPath}/api/search/venueId?vid=" + selectedVenue,
                type: "GET",
                dataType: "json",
                success: function(data) {
                    if (data && data.length > 0) {
                        var venueData = data[0];
                        var parentRow = dropdown.closest('tr');
                        parentRow.querySelector('.district').value = venueData.vdistrict;
                        parentRow.querySelector('.mandal').value = venueData.vmandal;
                        parentRow.querySelector('.coordinator-details').value = venueData.vcontactname + " , " + venueData.vcontactno + " , " + venueData.vcontactmailid;
                        parentRow.querySelector('.venue-type').value = venueData.vtype;
                        parentRow.querySelector('.venue-capacity').value = venueData.vcapacity;
                        parentRow.querySelector('.venue-address').value = venueData.vaddress;
                        parentRow.querySelector('.maplocation').value = venueData.maplocation;
                        parentRow.querySelector('.coordinatormobile').value = venueData.vcontactno;
                        parentRow.querySelector('.coordinatoremail').value = venueData.vcontactmailid;
                        parentRow.querySelector('.coordinatorname').value = venueData.vcontactname;
                    } else {
                        console.log("Empty or invalid data received.");
                    }
                },
                error: function(error) {
                    console.log("Error fetching venue data:", error);
                }
            });
        }
    </script>
</body>
</html>
 