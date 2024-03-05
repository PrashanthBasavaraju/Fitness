<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Batch</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
/* Custom CSS for styling */
body {
	background-color: #A3E6BA; /* Light grey background */
}

.container {
	margin-top: 50px;
}

.card {
	max-width: 500px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #B7F0E9;
}

.form-control {
	margin-bottom: 20px;
}

.navbar-custom {
	background-color: #4CAF50;
}

.navbar-custom .navbar-brand {
	font-weight: bold;
	color: #fff; /* Text color for the brand */
}

.navbar-custom .nav-link {
	font-size: 18px;
	color: #fff; /* Text color for the links */
}

.navbar-custom .dropdown-menu {
	background-color: #f8f9fa;
}

.navbar-custom .dropdown-menu a {
	color: #526291 !important;
}

.navbar-custom .dropdown-menu a:hover {
	background-color: #F7F79D !important;
}

.error-message {
	color: red;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Lucky Fitness</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="AddBatch.jsp">AddBatch</a></li>
					<li class="nav-item"><a class="nav-link"
						href="UpdateBatch.jsp">Update Batch</a></li>
					<li class="nav-item"><a class="nav-link"
						href="AddParticipant.jsp">Add Participant</a></li>
					<li class="nav-item"><a class="nav-link"
						href="UpdateParticipant.jsp">Update Participant</a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="card">
			<h1 class="text-center">Add Batch</h1>
			<form id="addBatchForm" method="post" action="BatchServlet"
				onsubmit="return validateForm()">
				<div class="mb-3">
					<label for="batchName" class="form-label">Batch Name</label> <input
						type="text" class="form-control" id="batchName" name="name"
						placeholder="Enter batch name" required>
					<div id="batchNameError" class="error-message"></div>
				</div>
				<div class="mb-3">
					<label for="batchTime" class="form-label">Batch Time</label> <select
						class="form-select" id="batchTime" name="time" required>
						<option value="">Select batch time</option>
						<option value="Morning">Morning</option>
						<option value="Evening">Evening</option>
					</select>
					<div id="batchTimeError" class="error-message"></div>
				</div>
				<button type="submit" class="btn btn-primary">Add Batch</button>
			</form>
		</div>
	</div>

	<script>
		function validateForm() {
			var batchName = document.getElementById('batchName').value.trim();
			var batchTime = document.getElementById('batchTime').value;

			var isValid = true;

			if (batchName === "") {
				document.getElementById('batchNameError').innerHTML = "Batch Name is required";
				isValid = false;
			} else {
				document.getElementById('batchNameError').innerHTML = "";
			}

			if (batchTime === "") {
				document.getElementById('batchTimeError').innerHTML = "Batch Time is required";
				isValid = false;
			} else {
				document.getElementById('batchTimeError').innerHTML = "";
			}

			return isValid;
		}
	</script>


</body>
</html>
