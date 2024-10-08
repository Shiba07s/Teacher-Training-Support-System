<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Training Management Mapping</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h1 {
	color: #333;
}

.grid-container {
	display: grid;
	/*     grid-template-columns: auto auto auto; /* Alternative to repeat(3, 1fr) */
	*/
	gap: 20px;
	margin-top: 20px;
}

.grid-item {
	display: flex;
	flex-direction: column;
}

.field {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], select {
	width: 90%;
	padding: 8px;
	box-sizing: border-box;
}

 button { 
 	padding: 10px; 
	background-color: #3498db; 
 	color: #fff; 
	border: none; 
 	cursor: pointer; 
 	margin-right: 40px; 
 } 

button:hover { 
	background-color: #2980b9; 
 } 

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #3498db;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #3498db;
	color: #fff;
}

tbody tr:hover {
	background-color: #f5f5f5;
}

#resultTable, #mappingTable, #mapButton, #submitButton, #srch, #trs,
	#form11 {
	display: none;
}

.row {
	display: flex;
}

.column {
	flex: 33.33%;
}

/* .button-container { */
/*     display: flex; */
/*     justify-content: space-between; */
/*     margin-top: 2%; */
/*     margin-left: 75%; */
/* } */
</style>

</head>
<body>

	<h1 align="center">Training Management Mapping</h1>
	<div class="row">
		<div class="col-md-4">
			<div class="field">
				<label for="dropdown">Select a management:</label> <select
					id="dropdown" onclick="test()">
					<!-- Placeholder option -->
					<option value="" disabled selected>Select a management</option>
				</select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="field">
				<label for="trainingname">Select a Training:</label> <select
					id="trainingname" onchange="search()">
					<!-- Placeholder option -->
					<option value="" disabled selected>Select a Training</option>
				</select>
			</div>
		</div>

		<div class="col-md-4">
			<div class="field">
				<label for="venueName">Venue Name:</label> <select id="venueName"
					onchange="searchVenue()">
					<option value="" disabled selected>Select a Training</option>
				</select>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- 		<div class="column"> -->
		<!-- 			<div class="field"> -->
		<!-- 				<label for="venueid">Venue id:</label> <input type="text" -->
		<!-- 					id="venueid" readonly> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div class="col-md-4">
			<div class="field">
				<label for="district">District:</label> <input type="text"
					id="district" readonly>
			</div>
		</div>
		<div class="col-md-4">
			<div class="field">
				<label for="mandal">Mandal:</label> <input type="text" id="mandal"
					readonly>
			</div>
		</div>
	</div>

	<!-- Row 3 -->
	<div class="row">
		<div class="col-md-4">
			<div class="field" id="trs">
				<label for="treasuryId">Treasury ID:</label> <input type="text"
					id="treasuryId">
			</div>
		</div>

		<div class="col-md-4">
			<div class="field">
				<button onclick="search1()" id="srch" style="margin-top: 23px;">Search</button>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="field" id="trs">
			<label for="treasuryId">Choose Any One of Them:</label>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<div class="field">
				<button onclick="Teachers()" style="width: 90%;">All Teachers District And
					Mandal Wise</button>
			</div>
		</div>
		<div class="col-md-4">
			<div class="field">
				<button onclick="showTreasuryField()" style="width: 90%;">With Treasury Id</button>
			</div>
		</div>
		<div class="col-md-4">
			<div class="field">
				<button onclick="hideTreasuryField();shownontreasuryField()" style="width: 90%;">WithOut
					Treasury Id</button>
			</div>
		</div>
	</div>

	<!-- ###################### Non-Treasury Id Add Form  ##################### -->

	<div class="container" id="form11">
		<h1 style="text-align: center;">Non-Treasury Id Add Form</h1>

		<form onsubmit="saveForm(event)">

			<div class="clearfix"></div>
			<!--                                 ########### Row-1 ########### -->
			<!-- Left Column -->
			<div class="row">
				<div class="col-md-4">
					<div class="form-group left-col">
						<div>
							<label for="name">Name<span class="required">*</span> :
							</label> <input type="text" id="mfname" name="mfname" required>
						</div>
					</div>
				</div>


				<!-- Right Column -->
				<div class="col-md-4">
					<div class="form-group right-col">
						<div>
							<label for="designation">Designation<span
								class="required">*</span> :
							</label> <input type="text" id="mfdesignation" name="mfdesignation"
								required>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group right-col">
						<div style="margin-top: 10px;">
							<!-- Adding space -->
							<label for="phone">Phone<span class="required">*</span> :
							</label> <input type="text" id="mfphone" name="mfphone" required>
						</div>
					</div>
				</div>
			</div>

			<!-- 				############### Row -2 ################# -->

			<div class="row">
				<div class="col-md-4">
					<div style="margin-top: 10px;">
						<!-- Adding space -->
						<label for="email">Email<span class="required">*</span> :
						</label> <input type="text" id="mfemail" name="mfemail" required>
					</div>
				</div>

				<div class="col-md-4">
					<div style="margin-top: 10px;">
						<!-- Adding space -->
						<label for="district">District:</label> <input type="text"
							id="mfdistrict" name="mfdistrict" required>
					</div>
				</div>


				<div class="col-md-4">
					<div style="margin-top: 10px;">
						<!-- Adding space -->
						<label for="mandal">Mandal:</label> <input type="text"
							id="mfmandal" name="mfmandal" required>
					</div>
				</div>
			</div>

			<!-- Save Button -->
			<!-- ... Your existing HTML code ... -->

			<!-- Save and Cancel Buttons on Horizontal Line -->
			<!-- 			<div class="row" style="margin-right: 10px;margin-top:30px;"> -->
			<!-- 				<div class="button-container"> -->
			<!-- 				<div class="col-md-6"> -->
			<!-- 					<div class="field" id="cancelbutton"> -->
			<!-- 						<button onclick="cancelForm() " style="width: 90px;">CANCEL</button> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-md-6"> -->

			<!-- 					<div class="field" id="savebutton"> -->
			<!-- 						<button onclick="saveForm(event)" -->
			<!-- 							style="margin-left: -81%; width: 90px;">SAVE</button> -->
			<!-- 					</div> -->
			<!-- 				</div> -->

			<!-- 			</div> -->
			<div class="row" style="margin-top: 30px;">
				<div class="col-md-4">
					<div class="field" id="cancelbutton">
						<button onclick="cancelForm()" style="width: 90%;">CANCEL</button>
					</div>
				</div>
				<div class="col-md-4">
					<div class="field" id="savebutton">
						<button onclick="saveForm(event)" style="width: 90%;">SAVE</button>
					</div>
				</div>
			</div>

			<!-- ... Your existing HTML code ... -->


		</form>
	</div>


	<div
		class="table-responsive-xl table-responsive-md table-responsive-lg table-responsive-sm table-responsive-xxl">
		<div class="field">
			<table id="mappingTable">
				<thead>
					<tr>

						<th>Training Name</th>
						<th>Training Id</th>
						<th>Venue Name</th>
						<th>Venue Id</th>
						<th>Selected Management</th>
						<th>Treasury Id</th>
						<th>Teacher Name</th>
						<th>District</th>
						<th>Mandal</th>
						<th>Designation</th>
						<th>Email</th>
						<th>Mobile</th>
					</tr>
				</thead>
				<tbody id="mappingTableBody">
					<!-- Table body content will be populated dynamically -->
				</tbody>
			</table>
		</div>
	</div>
	<div class="field" id="submitButton">
		<button onclick="save()">SUBMIT</button>
	</div>
	<div
		class="table-responsive-xl table-responsive-md table-responsive-lg table-responsive-sm table-responsive-xxl">
		<div class="field">
			<table id="resultTable">
				<thead>
					<tr>

						<th>Sl No</th>
						<th>Action</th>
						<th>Treasury Id</th>
						<th>Teacher Name</th>
						<th>District</th>
						<th>Mandal</th>
						<th>Designation</th>
						<th>Email</th>
						<th>Mobile</th>
					</tr>
				</thead>
				<tbody id="tableBody">
					<!-- Table body content will be populated dynamically -->
				</tbody>
			</table>
		</div>
	</div>
	<div class="field" id="mapButton">
		<button onclick="showMapping()">Map</button>
	</div>
	<!-- Add this script inside the head section of your HTML -->
	<!-- Add this script inside the head section of your HTML -->
	<script>
    function toggleTreasuryForm() {
        const treasuryForm = document.getElementById('trs');
        const searchButton = document.getElementById('srch');

        if (treasuryForm.style.display === 'block') {
            treasuryForm.style.display = 'none';
            searchButton.style.display = 'none';
        } else {
            treasuryForm.style.display = 'block';
            searchButton.style.display = 'block';
        }
    }

    function showTreasuryField() {
        document.getElementById('trs').style.display = 'block';
        document.getElementById('srch').style.display = 'block';
    }

    function hideTreasuryField() {
        document.getElementById('trs').style.display = 'none';
        document.getElementById('srch').style.display = 'none';
    }
</script>



	<!-- Add this script inside the head section of your HTML -->
	<script>
    
    
    function test(){
    	
    	  selectedManagement= document.getElementById('dropdown').value;
			 console.log(selectedManagement);
    	
    }
    
    function fetchData() {
        // Fetch management names
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/Allmanagement",
            success: function(data) {
                const dropdown = document.getElementById('dropdown');
                dropdown.innerHTML = '<option value="" disabled selected>Select a Management</option>'; // Clear previous content

                data.forEach(option => {
                    const optionElement = document.createElement('option');
                    optionElement.value = option.management_short_name;
                    optionElement.textContent = option.management_name;
                    dropdown.appendChild(optionElement);
                });
            },
            error: function(error) {
                console.error('Error fetching management data:', error);
            }
        });

            // Fetch training names
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/distinct/trainings",
                success: function(data) {
                    const trainingDropdown = document.getElementById('trainingname');
                    trainingDropdown.innerHTML = '<option value="" disabled selected>Select a Training</option>'; // Clear previous content

                    data.forEach(training => {
                        const trainingOption = document.createElement('option');
                        trainingOption.value = training.split(',')[0]; // assuming the first part is ref_planner_id
                        trainingOption.textContent = training.split(',')[1]; // assuming the second part is tname
                        trainingDropdown.appendChild(trainingOption);
                    });
                },
                error: function(error) {
                    console.error('Error fetching training data:', error);
                }
            });
        }

        function appendTableCell(row, data) {
            const cell = document.createElement('td');
            cell.textContent = data;
            row.appendChild(cell);
        }

        function search1() {
            const treasuryId = document.getElementById('treasuryId').value.trim();

            // Validate treasuryId
            if (!treasuryId) {
                alert('Please enter a valid Treasury ID.');
                return;
            }

           
            // Fetch teacher data based on treasuryId
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/findteachers?treasuryid=" + treasuryId,
                success: function(response) {
                    console.log(response); // Log the response to the console

                    const tableBody = document.getElementById('tableBody');
                    tableBody.innerHTML = ''; // Clear previous content
                    if (response.length > 0) {
	                    response.forEach((teacher,index) => {
	                        const row = document.createElement('tr');
                            appendTableCell(row, index + 1); // SL No

	                        
	                        const actionCell = document.createElement('td');
                            const checkbox = document.createElement('input');
                            checkbox.type = 'checkbox';
                            actionCell.appendChild(checkbox);
                            row.appendChild(actionCell);
                            appendTableCell(row, teacher.treasuryid);

                            appendTableCell(row, teacher.teacher_name);
	                        appendTableCell(row, teacher.districtnamewrk);
	                        appendTableCell(row, teacher.mandalnamewrk);
	                        appendTableCell(row, teacher.designation);
	                        appendTableCell(row, teacher.email);
	                        appendTableCell(row, teacher.mobilenumberteacher);
                            tableBody.appendChild(row);
	                    });
	                   
	                    //var dataTable = $('#resultTable').DataTable();

	                    document.getElementById('resultTable').style.display = 'block';
	                    document.getElementById('mapButton').style.display = 'block';

	                } else {
	                    document.getElementById('resultTable').style.display = 'none';
	                    document.getElementById('mapButton').style.display = 'none';
	                    alert('No matching data found for the given district and mandal.');
	                }
	            },
	            error: function(error) {
	                console.error('Error fetching teacher data:', error);
	                alert('Error fetching teacher data. Please try again.');
	            }
	            
	        });
	    }

        // Call fetchData function to populate the dropdowns on page load
        fetchData();
    </script>


	<script>
	var trainingDetails ;
	function search(){
		 const selectedTrainingId = document.getElementById('trainingname').value;
            

            if (!selectedTrainingId) {
                alert('Please select a training first.');
                return;
            }

            // Fetch additional details based on the selected training
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/distinct/venue?ref_planner_id=" + selectedTrainingId,
                success: function(data) {
                	
                	
                	const venueDropdown = document.getElementById('venueName');
                	const District = document.getElementById('district');
                	const Mandal = document.getElementById('mandal');
                	venueDropdown.innerHTML = '<option value="" disabled selected>Select a Venue</option>'; // Clear previous content

                    data.forEach(venue => {
                        const venueOption = document.createElement('option');
                        venueOption.value = venue.split(',')[0]; // assuming the first part is ref_planner_id
                        venueOption.textContent = venue.split(',')[1]; // assuming the second part is tname
                        venueDropdown.appendChild(venueOption);
                    });
                   

                    // Populate venue name, district, and mandal fields
//                     document.getElementById('venueName').value = data[0].venue_name;
//                     document.getElementById('district').value = data[0].district;
//                     document.getElementById('mandal').value = data[0].mandal;
//                     document.getElementById('venueid').value = data[0].venue_id;
                    
                    
                   var apply_start_dt=data[0].apply_start_dt;
                  var  training_start_dt=data[0].training_start_dt;
                    
                    console.log(apply_start_dt  + training_start_dt);
                    trainingDetails = data;
                   
                    
                },
                error: function(error) {
                    console.error('Error fetching training details:', error);
                    alert('Error fetching training details. Please try again.');
                }
            });
            
	}
	
	
	
	
	function searchVenue(){
        const venue = document.getElementById('venueName').value;
        console.log(venue);
        
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/search/venueId?vid=" + venue,
            success: function(data) {
               
                document.getElementById('district').value = data[0].vdistrict;
                document.getElementById('mandal').value = data[0].vmandal;
            },
            error: function(error) {
                console.error('Error fetching training details:', error);
                alert('Error fetching training details. Please try again.');
            }
        });

		
	}
	
	
	
	
	
    		
    		
    		function Teachers() {
    	        const districtName = document.getElementById('district').value.trim();
    	        const mandalName = document.getElementById('mandal').value.trim();

    	        // Validate district and mandal names
    	        if (!districtName || !mandalName) {
    	            alert('Please select a district and mandal.');
    	            return;
    	        }

    	        // Fetch teachers based on district and mandal names
    	        $.ajax({
    	            type: "GET",
    	            url: "${pageContext.request.contextPath}/api/district/mandal/teachers?mandalnamewrk=" + mandalName + "&districtnamewrk=" + districtName,
    	            success: function(response) {
    	                console.log(response); // Log the response to the console

    	    			
    	                
    	                const tableBody = document.getElementById('tableBody');
    	                tableBody.innerHTML = ''; // Clear previous content

    	                if (response.length > 0) {
    	                    response.forEach((teacher,index) => {
    	                        const row = document.createElement('tr');
                                appendTableCell(row, index + 1); // SL No

    	                        
    	                        const actionCell = document.createElement('td');
                                const checkbox = document.createElement('input');
                                checkbox.type = 'checkbox';
                                actionCell.appendChild(checkbox);
                                row.appendChild(actionCell);
                                appendTableCell(row, teacher.treasuryid);

                                appendTableCell(row, teacher.teacher_name);
    	                        appendTableCell(row, teacher.districtnamewrk);
    	                        appendTableCell(row, teacher.mandalnamewrk);
    	                        appendTableCell(row, teacher.designation);
    	                        appendTableCell(row, teacher.email);
    	                        appendTableCell(row, teacher.mobilenumberteacher);
                                tableBody.appendChild(row);
    	                    });
   	                    var dataTable = $('#resultTable').DataTable();

    	                    document.getElementById('resultTable').style.display = 'block';
    	                    document.getElementById('mapButton').style.display = 'block';

    	                } else {
    	                    document.getElementById('resultTable').style.display = 'none';
    	                    document.getElementById('mapButton').style.display = 'none';
    	                    alert('No matching data found for the given district and mandal.');
    	                }
    	            },
    	            error: function(error) {
    	                console.error('Error fetching teacher data:', error);
    	                alert('Error fetching teacher data. Please try again.');
    	            }
    	        });
    	    }
    		
    		
    		function showMapping() {
    		    const selectedRows = getSelectedRows();
    		    if (selectedRows.length === 0) {
    		        alert('Please select at least one row to map.');
    		        return;
    		    }
    		    
   			  const selectedManagement= document.getElementById('dropdown').options[document.getElementById('dropdown').selectedIndex].text;
   			const selectedTraining = document.getElementById('trainingname').options[document.getElementById('trainingname').selectedIndex].text;
            const selectedTrainingId = document.getElementById('trainingname').value;
            const selectedVenueName = document.getElementById('venueName').options[document.getElementById('venueName').selectedIndex].text;
            const selectedVenueId = document.getElementById('venueName').value;



    		    // Display the mapping table
    		    document.getElementById('resultTable').style.display = 'none';
    		    document.getElementById('mapButton').style.display = 'none';
    		    //hide non-treasuryid form
    		    document.getElementById('form11').style.display = 'none';


    		    document.getElementById('mappingTable').style.display = 'block';
                document.getElementById('submitButton').style.display = 'block';


    		    const mappingTableBody = document.getElementById('mappingTableBody');
    		    mappingTableBody.innerHTML = ''; // Clear previous content


    		    selectedRows.forEach((rowIndex) => {
    		        const teacher = getTeacherData(rowIndex);

    		        const mappingRow = document.createElement('tr');
    		        
    		        appendTableCell(mappingRow, selectedTraining); // Replace with the selected training name

    		        appendTableCell(mappingRow, selectedTrainingId);
    		        
    		        // Replace with the selected training name
    		        appendTableCell(mappingRow, selectedVenueName);
    		        appendTableCell(mappingRow,selectedVenueId); // Add venue ID

    		        
    		        // Add venue name
    		        appendTableCell(mappingRow, selectedManagement); // Replace with the selected management name
    		        appendTableCell(mappingRow, teacher.treasuryid); // Replace with the selected management name
    		        appendTableCell(mappingRow, teacher.teacher_name);
    		        appendTableCell(mappingRow, teacher.districtnamewrk); // Replace with the district
    		        appendTableCell(mappingRow, teacher.mandalnamewrk); // Replace with the mandal
    		        appendTableCell(mappingRow, teacher.designation);
    		        appendTableCell(mappingRow, teacher.email);
    		        appendTableCell(mappingRow, teacher.mobilenumberteacher);
    		        mappingTableBody.appendChild(mappingRow);
    		    });
    		    // Initialize DataTable for mappingTable
    		    $('#mappingTable').DataTable();
    		}

    		// Function to get the selected rows based on checkbox selection
    		function getSelectedRows() {
    		    const selectedRows = [];
    		    const checkboxes = document.querySelectorAll('#resultTable tbody input[type="checkbox"]');
    		    checkboxes.forEach((checkbox, index) => {
    		        if (checkbox.checked) {
    		            selectedRows.push(index);
    		        }
    		    });
    		    return selectedRows;
    		}

    		// Function to get teacher data from the resultTable based on row index
    		function getTeacherData(rowIndex) {
    		    const table = document.getElementById('resultTable');
    		    const row = table.rows[rowIndex + 1]; // Add 1 to skip the header row
    		    const teacher = {
    		    	treasuryid:row.cells[2].textContent,
    		        teacher_name: row.cells[3].textContent,
    		        designation: row.cells[6].textContent,
    		        email: row.cells[7].textContent,
    		        mobilenumberteacher: row.cells[8].textContent,
    		        districtnamewrk: row.cells[4].textContent,
    		        mandalnamewrk: row.cells[5].textContent
    		    };
    		    return teacher;
    		}

    		// Function to append a table cell
    		function appendTableCell(row, data) {
    		    const cell = document.createElement('td');
    		    cell.textContent = data;
    		    row.appendChild(cell);
    		}  
    		
    		
    		function save() {
    		    const mappingTableRows = document.querySelectorAll('#mappingTable tbody tr');
    		    const selectedManagement = document.getElementById('dropdown').value;
    		    const type = selectedManagement;
    		    const username = sessionStorage.getItem("username");
    		    const requestDataArray = []; // Array to store multiple data objects

    		    if (!trainingDetails || trainingDetails.length === 0) {
    		        console.error('trainingDetails is not defined or empty.');
    		        return;
    		    }

    		    const apply_start_dt = trainingDetails[0].apply_start_dt || 'N/A';
    		    const apply_end_dt = trainingDetails[0].apply_end_dt || 'N/A';
    		    const training_start_dt = trainingDetails[0].training_start_dt || 'N/A';
    		    const training_end_dt = trainingDetails[0].training_end_dt || 'N/A';
    		    const tstarttime = trainingDetails[0].tstarttime || 'N/A';
    		    const tendtime = trainingDetails[0].tendtime || 'N/A';

    		    mappingTableRows.forEach((row) => {
    		        const rowData = {
    		            trainingid: row.cells[1].textContent,
    		            trainingname: row.cells[0].textContent,
    		            venueid: row.cells[3].textContent,
    		            venuename: row.cells[2].textContent,
    		            createdby: username,
    		            applystartdate: apply_start_dt,
    		            applyenddate: apply_end_dt,
    		            trainingstartdate: training_start_dt,
    		            trainingenddate: training_end_dt,
    		            tstarttime: tstarttime,
    		            tendtime: tendtime
    		        };

    		        if (type === "CC" || type === "ACC" || type === "RP" || type === "PP" || type === "OS") {
    		            const type1 = type.toLowerCase();
    		            const keysToConcat = [type1 + 'treasuryid', type1 + 'name', type1 + 'district', type1 + 'mandal', type1 + 'designation', type1 + 'email', type1 + 'mobile'];

    		            keysToConcat.forEach((keyToConcat, index) => {
    		                const value = getValue(row.cells[index + 5]);
    		                rowData[keyToConcat] = value;
    		            });
    		        }

    		        requestDataArray.push(rowData); // Push rowData to requestDataArray
    		    });

    		    // Call the corresponding API based on type
    		    switch (type) {
    		        case "CC":
    		            saveData(requestDataArray, "${pageContext.request.contextPath}/api/cc/create");
    		            break;
    		        case "ACC":
    		            saveData(requestDataArray, "${pageContext.request.contextPath}/api/acc/create");
    		            break;
    		        case "RP":
    		            saveData(requestDataArray, "${pageContext.request.contextPath}/api/rp/create");
    		            break;
    		        case "PP":
    		            saveData(requestDataArray, "${pageContext.request.contextPath}/api/pp/create");
    		            break;
    		        case "OS":
    		            saveData(requestDataArray, "${pageContext.request.contextPath}/api/os/create");
    		            break;
    		        default:
    		            console.error("Invalid type:", type);
    		            return; // Exit function if type is invalid
    		    }
    		}

    		// Function to send AJAX request
    		function saveData(dataArray, apiUrl) {
    		    $.ajax({
    		        type: "POST",
    		        url: apiUrl,
    		        contentType: "application/json",
    		        data: JSON.stringify(dataArray), // Send the array of data objects
    		        success: function (response) {
    		            console.log('Mapping data saved successfully:', response);
    		            alert("Mapping Data saved successfully");
    		            window.location.href = "${pageContext.request.contextPath}/mastermapping2.jsp";    		        },
    		        error: function (error) {
    		            console.error('Error saving mapping data:', error);
    		            alert('Error saving mapping data. Please try again.');
    		        }
    		    });
    		}


    		function getValue(cell) {
    		    return cell ? cell.textContent.trim() : null;
    		}
  		
  		function showtreasuryField(){
  			 document.getElementById('trs').style.display = 'block';
               document.getElementById('srch').style.display = 'block';
  			
  		}
  		function shownontreasuryField(){
    	    	
    	        document.getElementById('form11').style.display = 'block';    	
    	    }
    		
    		<!-- 	############################# form validation for non-treasuryid & submit the form ######################## -->

    		function saveForm(event) {
		        // Prevent the default form submission
		        event.preventDefault();

		        // Get form input values
		        const name = document.getElementById('mfname').value.trim();
		        const designation = document.getElementById('mfdesignation').value.trim();
		        const phone = document.getElementById('mfphone').value.trim();
		        const email = document.getElementById('mfemail').value.trim();
		        const district = document.getElementById('mfdistrict').value.trim();
		        const mandal = document.getElementById('mfmandal').value.trim();

		        // Validate form inputs
		        if (!name) {
		            alert('Please enter a valid Name.');
		            return;
		        }

		        if (!designation) {
		            alert('Please enter a valid Designation.');
		            return;
		        }

		        if (!phone || !/^\d{10}$/.test(phone)) {
		            alert('Please enter a valid 10-digit Phone number.');
		            return;
		        }

		        // Regular expression for a simple email validation
		        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		        if (!emailRegex.test(email)) {
		            alert('Please enter a valid Email address.');
		            return;
		        }

		        if (!district) {
		            alert('Please enter a valid District.');
		            return;
		        }

		        if (!mandal) {
		            alert('Please enter a valid Mandal.');
		            return;
		        }

		        // If all validations pass, proceed with adding a new row
		        const resultTableBody = document.getElementById('tableBody');
		        const newRow = resultTableBody.insertRow();

		        const slNoCell = newRow.insertCell(0);
		        slNoCell.textContent = resultTableBody.rows.length;

		        const actionCell = newRow.insertCell(1);
		        const checkbox = document.createElement('input');
		        checkbox.type = 'checkbox';
		        actionCell.appendChild(checkbox);

		        const treasuryIdCell = newRow.insertCell(2);
		        treasuryIdCell.textContent = document.getElementById('treasuryId').value.trim();

		        const teacherNameCell = newRow.insertCell(3);
		        teacherNameCell.textContent = name;

		        const districtCell = newRow.insertCell(4);
		        districtCell.textContent = district;

		        const mandalCell = newRow.insertCell(5);
		        mandalCell.textContent = mandal;

		        const designationCell = newRow.insertCell(6);
		        designationCell.textContent = designation;

		        const emailCell = newRow.insertCell(7);
		        emailCell.textContent = email;

		        const mobileCell = newRow.insertCell(8);
		        mobileCell.textContent = phone;

		        // Display the result table
		        document.getElementById('resultTable').style.display = 'block';
		        document.getElementById('mapButton').style.display = 'block';

		        alert('Form submitted successfully!');
		    }   
			
    		<!-- 	############################# cancel form validation for non-treasuryid ######################## -->

    		function cancelForm() {
    		    // Hide the entire form
    		    document.getElementById('form11').style.display = 'none';
    		}

			
			
			
    </script>


</body>
</html>
