<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Training Selection</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 20px;
}

.container {
	max-width: 700px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	/* 	display: block; */
	margin-bottom: 10px;
	font-weight: bold;
	margin-right: 10px;
}

select, input {
	/* 	width: 100%; */
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-right: 10px;
}

/* input[type="checkbox"] {
/* 	margin-right: 5px;
/* } */
button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

.row {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 16px;
}

/* Style for each column */
.column {
	flex: 1;
	margin-bottom: 16px;
}

#resultTable, #vendorTable, #teacherTable, #tadaTable {
	width: 85%;
	border-collapse: collapse;
	margin-top: 20px;
	margin-left: 8%;
}

#resultTable th, #resultTable td, #vendorTable th, #vendorTable td,
	#teacherTable th, #teacherTable td, #tadaTable th, #tadaTable td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #007bff;
}

h4 {
	color: #007bff;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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


</head>
<body>
	<h2>Budget Screen</h2>
	<div class="container">
		<form id="trainingForm" action="#" method="post">

			<!-- First Row -->
			<div class="row">
				<div class="col-md-3">
					<label for="trainingDropdown">Training Name :</label> <select
						id="trainingDropdown" class="form-control" onchange="fun()">
						<!-- Add more training options as needed -->
					</select>
				</div>

				<div class="col-md-3">
					<label for="venueDropdown">Venue Name:</label> <select
						id="venueDropdown" class="form-control" onchange="searchVenue()">
						<option value="" disabled selected>Select a Venue</option>
					</select>
				</div>

				<div class="col-md-3">
					<label for="tyd">Training Year And Date :</label> <input
						type="text" id="tyd" class="form-control">
				</div>

				<div class="col-md-3">
					<label for="trtype">Training Type :</label> <input type="text"
						id="trtype" class="form-control">
				</div>
			</div>

			<!-- Second Row -->
			<div class="row">
				<div class="col-md-3">
					<label for="vendorInput">Agency :</label> <input type="text"
						id="vendor" class="form-control">
				</div>

				<div class="col-md-3">
					<label for="budget">Budget For This Training:</label> <input
						type="text" id="budget" class="form-control">
				</div>

				<div class="col-md-4">
					<div class="form-group">
						<label for="accountHead">Head Of Account/Source Bank :</label> <select
							id="accountHead" class="form-control">
							<option value="" disabled selected>Select an Account
								Head</option>
							<option value="SCERT">SCERT</option>
							<option value="CSE">CSE</option>
							<option value="CSI">CSI</option>
							<option value="MDM">MDM</option>
							<option value="SS">SS</option>
						</select>
					</div>
				</div>
			</div>


			<div style="display: none;">
				<label for="venuecapacity">Venue Capacity :</label> <input
					type="text" id="venuecapacity">
			</div>
			<div style="display: none;">
				<label for="venueInput">Venue ID:</label> <input type="text"
					id="venue">
			</div>


			<div style="display: none;">
				<label for="venuename">Venue Name This Training:</label> <input
					type="text" id="venuename">
			</div>
			<div style="display: none;">
				<label for="venueInput">Training Id:</label> <input type="text"
					id="trainingId">
			</div>


			<h4>Choose Components:</h4>

			<div id="componentsContainer" class="column"></div>


			<button type="button" id="submit" onclick="showTable()">Set
				Actual Price</button>
		</form>

	</div>

	</div>
	<h2 id="resultHeading" style="display: none;">Training Results</h2>
	<div  class="table-responsive-xl table-responsive-md table-responsive-lg table-responsive-sm table-responsive-xxl">
	    <table id="resultTable" style="display: none;">
		<tr>

			<th>Components</th>
			<th>Limit</th>
			<th>No Of Days</th>
			<th>Price per Day</th>

			<th>Total Amount</th>
			<th>Unit</th>
		</tr>
		<!-- Table rows will be dynamically added here using JavaScript -->
	</table>
	</div>
	
	<div id="totalamountforthistraining"
		style="display: none; margin-top: 20px; margin-left: 8%;">
		<div class="row">
			<div class="col-md-3">
				<label for="budget">Total Amount For This Training:</label> <input
					type="text" id="taftt">
			</div>
			<div class="col-md-3">
				<button type="button" id="post" onclick="postdata()"
				  class="btn btn-success"	style="display: none; margin-top:53px">Submit</button>
			</div>
<!--            <div> -->
<!--               <button type="button" id="post" onclick="postdata()" class="btn btn-success d-none d-md-block d-lg-none d-sm-block d-lg-block" style="width:120px ; margin-left: 3%;height:50px">Submit</button> -->
<!--            </div> -->
             
              

		</div>
	</div>





	<div id="count" class="column" style="display: none;">
		<h4>No of HM and Teachers Applied For This Training</h4>


		<div>
			<label for="hm">HM For This Training:</label> <input type="text"
				id="hm">
		</div>


		<div>
			<label for="teacher">Teachers For This Training:</label> <input
				type="text" id="teacher">
		</div>

		<div>
			<label for="total">Total Participants For This Training:</label> <input
				type="text" id="total">
		</div>

	</div>



	<script>
function searchVenue(){
    const venue = document.getElementById('venueDropdown').value;
    console.log(venue);
    
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/api/search/venueId?vid=" + venue,
        success: function(data) {
           
          
            document.getElementById('venuecapacity').value = data[0].vcapacity;
            document.getElementById('venue').value = data[0].vid;
        },
        error: function(error) {
            console.error('Error fetching training details:', error);
            alert('Error fetching training details. Please try again.');
        }
    });
    search();
 
 
	
}
 
 
 
function showTable() {
    var selectedTrainingDropdown = document.getElementById("trainingDropdown");
    var selectedTrainingOption = selectedTrainingDropdown.options[selectedTrainingDropdown.selectedIndex];
    var selectedTraining = {
        text: selectedTrainingOption.text,
        value: selectedTrainingOption.value
    };
    var selectedOptions = getSelectedOptions();
 
    // Fetch limits from API
    fetch('api/resources-and-rates?resourceNames=' + selectedOptions.join(','))
        .then(response => response.json())
        .then(data => {
            // Create a table row for each selected option
            selectedOptions.forEach(function (option) {
                // Find the resource information for the current option
                const resourceInfo = data.find(resource => resource[0] === option);
 
                if (resourceInfo) {
                    var row = "<tr>" +
                        "<td>" + option + "</td>" +
                        "<td>" + resourceInfo[1] + "</td>" +
                        "<td><input id='noofdays' type='text' class='noOfDays' name='noOfDays' value='" + noofdays + "'></td>" +
                        "<td><input type='text' class='pricePerDay' name='pricePerDay' oninput='calculateTotal(this, \"" + resourceInfo[2] + "\")'></td>" +
                        "<td><input type='text' class='totalAmount' name='totalAmount' readonly></td>" +
                        "<td>" + resourceInfo[2] + "</td>" +
                        "</tr>";
                    // Append the row to the table
                    document.getElementById("resultTable").innerHTML += row;
                } else {
                    console.error('Resource information not found for', option);
                }
            });
 
            // Show the table
            document.getElementById("resultTable").style.display = "table";
            document.getElementById("totalamountforthistraining").style.display = "block";
//             document.getElementById("vendorTable").style.display = "table";
//             document.getElementById("tadaTable").style.display = "table";
            document.getElementById("post").style.display = "block";
 
        })
        .catch(error => console.error('Error fetching resource information:', error));
}
 
function calculateTotal(input, unit) {
    var row = input.closest("tr");
    var quantity = row.querySelector(".noOfDays").value;
    var pricePerUnit = input.value;
    var totalAmount;
 
    // Check if the unit is "per day"
    if (unit.toLowerCase() === "per day") {
        totalAmount = quantity * pricePerUnit;
    } else {
        totalAmount = pricePerUnit;
    }
 
    // Set the calculated total amount in the corresponding field
    row.querySelector(".totalAmount").value = totalAmount;
    totalamountforThisTraining();
}
 
 
function totalamountforThisTraining(){
	 let totalAmountForTraining = 0;
 
	    // Iterate through rows in the resultTable
	    const rows = document.querySelectorAll('#resultTable tr');
	    for (let i = 1; i < rows.length; i++) { // Skip header row
	        const row = rows[i];
	        const totalAmountCell = row.querySelector('.totalAmount');
	        if (totalAmountCell) {
	            const totalAmount = parseFloat(totalAmountCell.value || 0);
	            totalAmountForTraining += totalAmount;
	        }
	        document.getElementById('taftt').value = totalAmountForTraining;
	        document.getElementById('totalamountforthistraining').style.display = 'block';
	    }
}
 
 
    function getSelectedOptions() {
        var options = document.querySelectorAll('input[type="checkbox"]:checked');
        var selectedOptions = [];
 
        options.forEach(function (option) {
            selectedOptions.push(option.value);
        });
 
        return selectedOptions;
    }
    
   
 
    </script>

	<script>
   
   function postdata() {
	    // Declare modifiedPostData at the beginning
	    let modifiedPostData;
 
	    // Get values from input fields
	    const trainingId = document.getElementById('trainingDropdown').value;
	    const trainingname = trainingDropdown.options[trainingDropdown.selectedIndex].text;
	    const schedulebudget = parseFloat(document.getElementById('budget').value); // Parse to float
	    const totalAmount = parseFloat(document.getElementById('taftt').value); // Parse to float
 
	    const venueId = document.getElementById('venue').value;
	    const venueName = venueDropdown.options[venueDropdown.selectedIndex].text;
	    
	    const trainingtype = document.getElementById('trtype').value;
	    const headOfAccount = document.getElementById('accountHead').value;

 
	    // Get data from the resultTable
	    const resultTableData = getTableValues('resultTable');
 
	    const mappedResultTableData = resultTableData.map(item => {
	        console.log('Mapped Result Table Item:', item);
	        return {
	            tcname: item['components'] || '',
	            estimatedbudget: item['limit'] || 0,
	            frequency: item['no of days'] || 0,
	            amount: item['price per day'] || 0,
	            sanctionedbudget: item['total amount'] || 0,
	            unit: item['unit'] || ''
	        };
	    });
 
	    modifiedPostData = [...mappedResultTableData];
 
	    console.log(modifiedPostData);
 
	    if (totalAmount <= schedulebudget) {
	        // Make a POST request to your API endpoint
	        $.ajax({
	            type: 'POST',
	            url: '${pageContext.request.contextPath}/api/save/bdgtmapping?trainingid=' + trainingId + '&trainingname=' + trainingname + '&budgetedyear=23-24' + '&venueid=' + venueId + '&vname=' + venueName + '&schedulebudget=' + schedulebudget+ '&trainingtype='+trainingtype+ '&accounthead='+headOfAccount,
	            contentType: 'application/json',
	            data: JSON.stringify(modifiedPostData),
	            success: function (response) {
	                console.log('POST request successful:', response);
	                alert("Budget Mapping Successfully");
	                 window.location.href="${pageContext.request.contextPath}/dashboard.jsp";
	            },
	            error: function (error) {
	                console.error('Error making POST request:', error);
	            }
	        });
	    } else {
	        alert("Total Amount exceeds Estimated Budget. Please adjust the components price to stay within Estimated budget.");
	    }
	}
 
	function getTableValues(tableId) {
	    const table = document.getElementById(tableId);
	    const data = [];
 
	    // Iterate through rows (skip the first row with headers)
	    for (let i = 1; i < table.rows.length; i++) {
	        const row = table.rows[i];
	        const rowData = {};
 
	        // Iterate through cells
	        for (let j = 0; j < row.cells.length; j++) {
	            const cell = row.cells[j];
	            const columnName = table.rows[0].cells[j].textContent.trim();
 
	            // Check if the cell contains an input field
	            const inputField = cell.querySelector('input');
	            if (inputField) {
	                rowData[columnName.toLowerCase()] = inputField.value.trim();
	            } else {
	                rowData[columnName.toLowerCase()] = cell.textContent.trim();
	            }
	        }
 
	        data.push(rowData);
	    }
 
	    return data;
	}
 
    	var noofdays;
  		$(document).ready(function() {
  			var noofdays;
            // Fetch training names from the API endpoint
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/distinct/trainings",
                success: function(data) {
                    const trainingDropdown = $("#trainingDropdown");
                    trainingDropdown.empty(); // Clear previous content
 
                    trainingDropdown.append('<option value="" disabled selected>Select a Training</option>');
 
                    data.forEach(training => {
                        const parts = training.split(',');
                        const refPlannerId = parts[0].trim();
                        const tname = parts[1].trim();
 
                        const trainingOption = $("<option></option>")
                            .attr("value", refPlannerId)
                            .text(tname);
                        
                        trainingDropdown.append(trainingOption);
                    });
                },
                error: function(error) {
                    console.error('Error fetching training data:', error);
                }
            });
            
            
            
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/component/components",
                success: function (data) {
                    // Assuming data is an array of objects, each representing a component
                    var componentsContainer = $('#componentsContainer');
                    var row = $('<div>', {class: 'row'}); // Create a row container

                    data.forEach(function (component, index) {
                        // Create a new checkbox element
                        const checkbox = $('<input>', {
                            type: 'checkbox',
                            id: 'option' + (index + 1), // Generate a unique ID for each checkbox
                            name: 'components',
                            value: component.resources, // Assuming the 'name' property in your API represents the component name
                            class: 'mr-2' // Add margin to the right (adjust the value as needed)
                        });

                        // Create a label for the checkbox
                        const label = $('<label>', {
                            for: 'option' + (index + 1),
                            text: component.resources, // Display the component name as the label text
                            //class: 'ml-2' // Add margin to the left (adjust the value as needed)
                        });

                        // Create a div to hold the checkbox and label with col-md-3 class
                        if(component.resources==="LOGISTIC"){
                        	const div = $('<div>', {class: 'col-md-2'});
                            div.append(checkbox, label);
                         // Append the div to the row
                            row.append(div);
                        }else{
                        	const div = $('<div>', {class: 'col-md-3'});
                            div.append(checkbox, label);
                         // Append the div to the row
                            row.append(div);
                        }
                        

                        

                        // If four columns are added, create a new row
                        if ((index + 1) % 4 === 0 || index === data.length - 1) {
                            componentsContainer.append(row);
                            row = $('<div>', {class: 'row'}); // Create a new row for the next set of checkboxes
                        }
                    });
                },
                error: function (error) {
                    console.error('Error fetching component details:', error);
                    alert('Error fetching component details. Please try again.');
                }
            });

        });
        function search() {
            const selectedTrainingId = document.getElementById('trainingDropdown').value;
            const selectedVenueId = document.getElementById('venueDropdown').value;
 
            // Fetch training details from the API
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/scheduledTrainingsbyid?ref_planner_id=" + selectedTrainingId+"&venue_id="+selectedVenueId,
                success: function (data) {
                    // Assuming data[0].tagency contains the vendor information for the first item
                    const vendorField = document.getElementById('vendor');
 
                     const budgetField = document.getElementById('budget');
                     
                     const trainingYearAndDate = document.getElementById('tyd');
                     const trainingType = document.getElementById('trtype');
 
                    
                    // Update the value of the vendor field
                    vendorField.value = data[0].tagency;
                    
                    trainingYearAndDate.value=data[0].tyear+"("+data[0].training_start_dt+" to "+data[0].training_end_dt+")";
                    
                    trainingType.value=data[0].trainingtype;
                    
                   budgetField.value=data[0].schedulebudget;
                    var startdate=new Date(data[0].training_start_dt);
                    var enddate=new Date(data[0].training_end_dt);
                    
                    var duration = (enddate - startdate) / (1000 * 60 * 60 * 24)+1;
                    console.log(duration);
				    noofdays=duration;   
                    $('#noofdays').val(duration);
                   // searchVendor(duration);
                },
                error: function (error) {
                    console.error('Error fetching training details:', error);
                    alert('Error fetching training details. Please try again.');
                }
            });
        }
        function fun(){
        	
            const selectedTrainingId = document.getElementById('trainingDropdown').value;
 
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/distinct/venue?ref_planner_id=" + selectedTrainingId,
                success: function(data) {
                	
                	
                	const venueDropdown = document.getElementById('venueDropdown');
                	venueDropdown.innerHTML = ''; // Clear previous options
                	 
                    // Add default option
                    const defaultOption = document.createElement('option');
                    defaultOption.value = ''; // Set value as per your requirement
                    defaultOption.textContent = 'Select a Venue'; // Text for default option
                    defaultOption.disabled = true; // Make it disabled
                    defaultOption.selected = true; // Make it selected by default
                    venueDropdown.appendChild(defaultOption);
                    data.forEach(venue => {
                        const venueOption = document.createElement('option');
                        venueOption.value = venue.split(',')[0]; // assuming the first part is ref_planner_id
                        venueOption.textContent = venue.split(',')[1]; // assuming the second part is tname
                        venueDropdown.appendChild(venueOption);
                    });
                   
 
                    
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
      
    </script>

</body>
</html>