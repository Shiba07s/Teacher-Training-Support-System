<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginpage.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-7">
					<div class="text-box">
						<div class="nav">
							<!--             <img src="./logo1.png" alt=""> -->
							<img src="${pageContext.request.contextPath}/assets/logo1.png"
								alt="">
 
						</div>
					</div>
				</div>
			</div>
 
		</div>
	</div>
	<form class="log">
		<span class="logo-round"><img
			src="${pageContext.request.contextPath}/assets/logo2.png" alt=""></span>
 
		<div class="head">
			<h2>Login</h2>
			<p>Hi, Welcome Back</p>
			<img src="${pageContext.request.contextPath}/assets/hand.png" alt="">
		</div>
		<select id="dropdown">
			 
		</select>
		<input type="text" id="username" placeholder="User ID">
		<input
			type="text" id="password" placeholder="Password">
		<div class="remember">
			<a href="#">Forgot Password</a>
		</div>
		<button id="logins" type="button">Log In</button>
 
	</form>
 
	<div class="carousel">
 
		<i class="prev fa-solid fa-arrow-left"></i>
		<div class="list">
			<img src="${pageContext.request.contextPath}/assets/banner1.JPG"
				alt="image 1">
			<div class="list-text-box">
				<div class="container">
					<div class="banner-text-box">
						<h2>Teacher Training Support System Government Of Andhra
							Pradesh</h2>
						<p>The State is leading an initiative to digitize training
							data, developing a comprehensive platform for end-to-end
							tracking, user-friendly access to materials, personalized
							learning paths, data analytics for progress tracking, and
							technology integration to enhance the training experience.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="list">
			<img src="${pageContext.request.contextPath}/assets/banner2.jpg"
				alt="image 1">
			<div class="list-text-box">
				<div class="container">
					<div class="banner-text-box">
						<h2>Teacher Training Support System Government Of Andhra
							Pradesh</h2>
						<p>The TTSS (Teacher Training Support System) is utilized for
							maintaining records of the training sessions.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="list">
			<img src="${pageContext.request.contextPath}/assets/banner3.jpg"
				alt="image 1">
			<div class="list-text-box">
				<div class="container">
					<div class="banner-text-box">
						<h2>Teacher Training Support System Government Of Andhra
							Pradesh</h2>
						<p>Teachers are central users, registering for professional
							development courses, actively participating in training,
							coursework, assignments, and assessments.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="list">
			<img src="${pageContext.request.contextPath}/assets/banner4.jpg"
				alt="image 1">
			<div class="list-text-box">
				<div class="container">
					<div class="banner-text-box">
						<h2>Teacher Training Support System Government Of Andhra
							Pradesh</h2>
						<p>Elevate education in Andhra Pradesh teacher training
							implementing a comprehensive Teacher Training Support System for
							seamless tracking and data-driven decision-making.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="list">
			<img src="${pageContext.request.contextPath}/assets/banner5.jpeg"
				alt="image 1">
			<div class="list-text-box">
				<div class="container">
					<div class="banner-text-box">
						<h2>Teacher Training Support System Government Of Andhra
							Pradesh</h2>
						<p>The TTSS platform enhances state visibility on teacher
							training within the SALT project and other initiatives.</p>
					</div>
				</div>
			</div>
		</div>
		<i class="next fa-solid fa-arrow-right"></i>
 
		<div class="carousel-indicators"></div>
	</div>
	<div class="bg-img">
		<img src="${pageContext.request.contextPath}/assets/5_asfasw112.jpg"
			alt="">
	</div>
 
 
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
 
	<script>
	var indexurl;
      $(document).ready(function() {
    	// Call fetchNames function to populate the dropdown
  	    fetchNames();
    	    // Function to fetch names from /api/names and populate the dropdown
    	
    	
    	  $('#dropdown').change(function() {
    		    // Get the selected value
    		    var selectedValue = $(this).val();
    		    
    		    $.ajax({
    	              url: '${pageContext.request.contextPath}/api/getroledetails', // Change this URL to match your API endpoint
    	              data: {roleId:selectedValue},
    	              type: 'GET',
    	              success: function(data) {
    	              	//console.log(data);
    	              	indexurl=(data.url).trim();
    	              	console.log(indexurl);  
    	              	var dataJson = JSON.stringify(data);
    	                console.log(dataJson);
    	                sessionStorage.setItem('apiData', dataJson);

    	              },
    	              error: function(xhr, status, error) {
    	                  console.error('Error fetching data:', error);
    	              }
    	          });
    		    // Do something with the selected value
    		    console.log('Selected value:', selectedValue);
    		});
 
 
    	    
    	    
    	    
    	    $("#logins").click(function() {
    	    	
    	    
    			function setTreasuryIdSession() {
 
    				var UserName = document.getElementById('username').value;
    				var UserPassword = document.getElementById('password').value;
     
    				if (typeof (Storage) !== "undefined") {
    					sessionStorage.setItem("UserName", UserName);
    					sessionStorage.setItem("UserPassword", UserPassword);
 
     
    				} else {
    					alert("Sorry, your browser does not support session storage.");
    				}
    			}
    			
    			  
    		
    	    	
    	    	
    	    	
    	        // Fetch the values of username and password
    	        var roleId = $("#dropdown").val();
    	        var roleName = $("#dropdown option:selected").text();
    	        var username = $("#username").val();
    	        var password = $("#password").val();
				var apiUrl;
				var datadetails;
    	        if (roleId === "12") {
					apiUrl = '${pageContext.request.contextPath}/api/teacher/login';
					datadetails = {
				            //roleId: roleId,
				            treasuryid: username,
				            mobilenumberteacher: password
				        };
				} else  {
					apiUrl = '${pageContext.request.contextPath}/api/credential/adminlogin';
					datadetails = {
							roleId:roleId,
							rolename:roleName,
							  username:username,
							  password:password
				        }
				}
    	        setTreasuryIdSession();
    	        callapi(apiUrl,datadetails);
    	        // Here, you can perform further actions such as sending the username and password to a server for authentication
    	    });
 
    	});
      
      function callapi(apiUrl,datadetails){
    	  $.ajax({
	              url: apiUrl, // Change this URL to match your API endpoint
	              type: 'POST',
	              data: JSON.stringify(datadetails),
	              contentType: 'application/json', // Add content type header
 
	              success: function(data) {
	       			console.log(data);
	            	window.location.href = '${pageContext.request.contextPath}' + indexurl;
	              	//console.log(url);  
	              },
	              error: function(xhr, status, error) {
	                  console.error('Error fetching data:', error);
	              }
	          });
      }
      function fetchNames() {
          $.ajax({
              url: '${pageContext.request.contextPath}/api/names', // Change this URL to match your API endpoint
              type: 'GET',
              success: function(data) {
              	
            	  $('#dropdown').empty();
            	     
                  var options = '';
                  options += '<option value="" selected disabled>---Select Role---</option>';                  for (var i = 0; i < data.length; i++) {
                  	// Split the data by commas if it contains commas
                      var dataArray = data[i].split(',');
                      //console.log(dataArray[1]);
                      options += '<option value="' + dataArray[1] + '">' + dataArray[0] + '</option>';
                  }
                  $('#dropdown').html(options);
              },
              error: function(xhr, status, error) {
                  console.error('Error fetching data:', error);
              }
          });
      }
 
 
    </script>
 
	<script>
    const carousel = document.querySelector('.carousel');
    const images = Array.from(carousel.querySelectorAll('.list'));
    const indicatorsContainer = document.querySelector('.carousel-indicators');
    let currentIndex = 0;
 
    images[currentIndex].classList.add('active');
    const prevButton = carousel.querySelector('.prev');
    const nextButton = carousel.querySelector('.next');
 
    prevButton.addEventListener('click', () => updateCarousel(currentIndex - 1));
    nextButton.addEventListener('click', () => updateCarousel(currentIndex + 1));
                
 
    setInterval(() => updateCarousel(currentIndex + 1), 3000);
 
 
    //--------Indicators defined---------//
 
    /* image is the current image being processed, and index is its index in the images array. The function creates a new div, adds the carousel-indicator class to it, sets up a click event listener that calls updateCarousel(index), appends the new div to indicatorsContainer, and then returns the new div. The map() function then returns a new array containing all these new div elements.*/
 
    const indicators = images.map((image, index) => {
	    const indicator = document.createElement('div');
	    indicator.classList.add('carousel-indicator');
	    indicator.addEventListener('click', () => updateCarousel(index));
	    indicatorsContainer.appendChild(indicator);
	    return indicator;
    });
 
     //--------Function to change image---------//
    const updateCarousel = (newIndex) => {
     images[currentIndex].classList.remove('active');
    currentIndex = (newIndex + images.length) % images.length;
     images[currentIndex].classList.add('active');
    updateIndicators();
                };
 
     //--------Function to update indicators---------//
    const updateIndicators = () => {
        indicators.forEach((indicator, index) => {
           if (index === currentIndex) {
             indicator.classList.add('active');
                        } else {
                            indicator.classList.remove('active');
                        }
                    });
                };
 
                updateIndicators();
    </script>
 
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
 