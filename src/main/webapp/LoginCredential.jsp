<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Import jQuery library -->

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f2f2;
    }
    .container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
    }
    .form-group input, select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .btn-group {
        display: flex;
        justify-content: space-between;
    }
    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-primary {
        background-color: #007bff;
        color: #fff;
    }
    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
        margin-left: 10px;
    }
    #btn-submit{
        display: flex;
        justify-content: center;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Login User Form</h2>
    <form id="loginForm">
        <div class="form-group">
            <label for="roleName">Role Name:</label>
            <select id="dropdown"></select>
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="text" class="form-control" id="password" name="password" required>
        </div>
        <div class="btn-group" id="btn-submit">
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="cancel()">Cancel</button>
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        // Function to fetch names and populate dropdown
        function fetchNames() {
            $.ajax({
                url: '${pageContext.request.contextPath}/api/names', // Change this URL to match your API endpoint
                type: 'GET',
                success: function(data) {
                    $('#dropdown').empty();
                    var options = '<option value="" selected disabled>---Select Role---</option>';
                    for (var i = 0; i < data.length; i++) {
                        var dataArray = data[i].split(',');
                        options += '<option value="' + dataArray[1] + '">' + dataArray[0] + '</option>';
                    }
                    $('#dropdown').html(options);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching data:', error);
                }
            });
        }

        // Call fetchNames function when document is ready
        fetchNames();

        // Form submission event handler
        $('#loginForm').submit(function(event) {
            event.preventDefault(); // Prevent the form from submitting normally

            // Collect form data
            var formData = {
                rolename:  $("#dropdown option:selected").text(),
                username: $('#username').val(),
                password: $('#password').val()
            };

            // Send form data via AJAX
            $.ajax({
                url: '${pageContext.request.contextPath}/api/credential/admin',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    console.log('Data stored successfully:', response);
                    alert(response);
//                     window.location.href = '${pageContext.request.contextPath}/MainFrameAdmin.jsp';
		            window.location.href = "${pageContext.request.contextPath}/LoginCredential.jsp";


                    // Optionally, perform any actions after successful data submission
                },
                error: function(xhr, status, error) {
                    console.error('Error storing data:', error);
                    // Show error message and response data in an alert box
                    alert('Failed to submit form : ' + error + xhr.responseText);
                }
            });
        });

        // Cancel function
        function cancel() {
            window.location.href = "${pageContext.request.contextPath}/LoginCredential.jsp";

//             document.getElementById("loginForm").reset();
        }
    });
</script>



</body>
</html>
