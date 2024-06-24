<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Add your CSS styles or include a CSS file here -->
    <style>
    body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}
 
.container {
    max-width: 800px;
    margin: 20px auto;
}
 
header {
    background-color: #3498db;
    color: #fff;
    text-align: center;
    padding: 10px 0;
}
 
h1{
    color: #e7e9ea;
}
h2 {
    color: #3e8ab0;
}
 
.profile-section {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}
 
.profile-info {
    flex: 1;
    padding: 20px;
    border: 1px solid #ddd;
    box-sizing: border-box;
}
 
.profile-info h2 {
    margin-bottom: 10px;
}
 
.profile-image {
    flex-basis: 30%;
    background-color: #f0f0f0;
    padding: 20px;
    box-sizing: border-box;
}
 
.profile-image img {
    max-width: 100%;
    height: auto;
      width: 100%;
    height: 100%;
}
 
.training-data {
    border: 1px solid #ddd;
    padding: 20px;
    box-sizing: border-box;
}
 
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}
 
th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}
 
thead {
    background-color: #f2f2f2;
}
 
 
tbody tr:hover {
    background-color: #f5f5f5;
}
 
 
 
 
 
/* Styles for table headers (th) */
#trainingTable th {
    background-color: #3498db;
    color: #fff;
    padding: 10px;
}
 
/* Styles for even rows in the table body (tbody tr:nth-child(even)) */
 
 profile-image{
    width: 20%;
    height: 30%;
 
 }
   
    </style>
</head>
<body>
 
    <header>
        <h1>Teacher Profile</h1>
    </header>
 
    <div class="container">
 
        <div class="profile-section" id="teacherDetails">
            <div class="profile-info">
                <h2>About The Teacher</h2>
<!--             <p id="aadharContainer"><strong>Aadhar:</strong> <span id="aadhar"></span></p> -->
<!--             <p id="cmfsIdContainer"><strong>CMFS ID:</strong> <span id="cmfs_id"></span></p> -->
<!--             <p id="complexCodeContainer"><strong>Complex Code:</strong> <span id="complex_code"></span></p> -->
        </div>
            <div class="profile-image">
                <!-- Add profile image here -->
    <img src="./assets/teacher.jpg" alt="Teacher's Profile Image">
            </div>
        </div>
 
        <div class="training-data" id="trainingData">
            <h2>Previous Training Details</h2>
            <table id="trainingTable">
                <thead>
                    <tr>
                        <th>Training Name</th>
                        <th>Training Mode</th>
                        <th>Resource Type</th>
                        <th>State</th>
                        <th>Number Of Days</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Data will be dynamically added here using JavaScript -->
                </tbody>
            </table>
        </div>
 
    </div>
 
   <script>
   
   function getTreasuryIdFromUrl() {
       const urlParams = new URLSearchParams(window.location.search);
       return urlParams.get('treasuryId');
   }
 
   // Function to handle data fetching
   function fetchData() {
       // Get treasuryId from the URL
       const treasuryId = getTreasuryIdFromUrl();
 
        // Fetch teacher details
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/api/training/previous?treasuryId=' + treasuryId,
            success: function (trainingResponse) {
                console.log('Training Previous API Response:', trainingResponse);
 
                // Process the training response and update the HTML content
                const trainingTableBody = $('#trainingTable tbody');
                trainingTableBody.empty(); // Clear existing data
 
                trainingResponse.forEach(training => {
                    const row = $('<tr>');
                    row.append($('<td>').text(training.trainingname));
                    row.append($('<td>').text(training.trainingmode));
                    row.append($('<td>').text(training.resourcetype));
                    row.append($('<td>').text(training.state));
                    row.append($('<td>').text(training.numberofdays));
                    trainingTableBody.append(row);
                });
            },
            error: function (error) {
                console.error('Error fetching Training Previous data:', error);
                // Handle the error as needed
            }
        });
 
        // AJAX request to the second endpoint
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/api/findteachers?treasuryid=' + treasuryId,
            success: function (teacherResponse) {
                console.log('Find Teachers API Response:', teacherResponse);
 
                // Loop through each teacher in the array
                for (let i = 0; i < teacherResponse.length; i++) {
                    const teacher = teacherResponse[i];
 
                    // Create a new set of elements for each teacher
                    const teacherContainer = $('<div class="teacher-container"></div>');
 
                    // Append details to the container
                    teacherContainer.append('<p><strong>TreasuryId:</strong> <span class="treasury">' + teacher.treasuryid + '</span></p>');
                    teacherContainer.append('<p><strong>Aadhar:</strong> <span class="aadhar">' + teacher.aadhar + '</span></p>');
 
                    teacherContainer.append('<p><strong>CMFS ID:</strong> <span class="cmfs_id">' + teacher.cmfs_id + '</span></p>');
                    teacherContainer.append('<p><strong>Complex Code:</strong> <span class="complex_code">' + teacher.complex_code + '</span></p>');
                    teacherContainer.append('<p><strong>Teacher Name:</strong> <span class="name">' + teacher.teacher_name + '</span></p>');
                    teacherContainer.append('<p><strong>Mobile Number:</strong> <span class="name">' + teacher.mobilenumberteacher + '</span></p>');
                    teacherContainer.append('<p><strong>Working District:</strong> <span class="name">' + teacher.districtnamewrk + '</span></p>');
                    teacherContainer.append('<p><strong>Designation:</strong> <span class="name">' + teacher.designation + '</span></p>');
                    teacherContainer.append('<p><strong>School mgmt name:</strong> <span class="name">' + teacher.sch_mgt_name + '</span></p>');
                    teacherContainer.append('<p><strong>Gender:</strong> <span class="name">' + teacher.gender + '</span></p>');
                    teacherContainer.append('<p><strong>DOB:</strong> <span class="name">' + teacher.dob + '</span></p>');
                    teacherContainer.append('<p><strong>Complex Code:</strong> <span class="name">' + teacher.complex_code + '</span></p>');
                    teacherContainer.append('<p><strong>Complex School Name:</strong> <span class="name">' + teacher.complex_school_name + '</span></p>');
                    teacherContainer.append('<p><strong>Workplace:</strong> <span class="name">' + teacher.workplace + '</span></p>');
 
                    // Append the container to the profile-info div
                    $('.profile-info').append(teacherContainer);
                }
            },
            error: function (error) {
                console.error('Error fetching Find Teachers data:', error);
                // Handle the error as needed
            }
        });
    }
 
    // Call the fetchData function when the page loads
    $(document).ready(fetchData);
</script>
 
</body>
</html>