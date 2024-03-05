<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.fitness.connection.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Participant</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
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
			<h1 class="text-center">Add Participant</h1>
			<form id="addParticipantForm" method="post"
				action="ParticipantServlet" onsubmit="return validateForm()">
				<div class="mb-3">
					<label for="participantName" class="form-label">Participant
						Name</label> <input type="text" class="form-control" id="participantName"
						name="name" placeholder="Enter participant name" required>
					<div id="participantNameError" class="error-message"></div>
				</div>
				<div class="mb-3">
					<label for="participantPhone" class="form-label">Participant
						Phone</label> <input type="text" class="form-control"
						id="participantPhone" name="phone"
						placeholder="Enter participant phone number" required>
					<div id="participantPhoneError" class="error-message"></div>
				</div>
				<div class="mb-3">
					<label for="participantEmail" class="form-label">Participant
						Email</label> <input type="email" class="form-control"
						id="participantEmail" name="email"
						placeholder="Enter participant email address" required>
					<div id="participantEmailError" class="error-message"></div>
				</div>
				<div class="mb-3">
					<label for="batchId" class="form-label">Batch ID</label> <select
						class="form-select" id="batchId" name="bid" required>
						<option value="">Select batch ID</option>
						<%
						try {
							Connection conn = DBConnection.getConnection();
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT bid, name FROM Batch");
							while (rs.next()) {
								int batchId = rs.getInt("bid");
								String batchName = rs.getString("name");
						%>
						<option value="<%=batchId%>"><%=batchName%></option>
						<%
						}
						conn.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</select>
					<div id="batchIdError" class="error-message"></div>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Add
						Participant</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		function validateForm() {
			var participantName = document.getElementById('participantName').value
					.trim();
			var participantPhone = document.getElementById('participantPhone').value
					.trim();
			var participantEmail = document.getElementById('participantEmail').value
					.trim();
			var batchId = document.getElementById('batchId').value;

			var isValid = true;

			if (participantName === "") {
				document.getElementById('participantNameError').innerHTML = "Participant Name is required";
				isValid = false;
			} else {
				document.getElementById('participantNameError').innerHTML = "";
			}

			if (participantPhone === "") {
				document.getElementById('participantPhoneError').innerHTML = "Participant Phone is required";
				isValid = false;
			} else {
				document.getElementById('participantPhoneError').innerHTML = "";
			}

			if (participantEmail === "") {
				document.getElementById('participantEmailError').innerHTML = "Participant Email is required";
				isValid = false;
			} else {
				document.getElementById('participantEmailError').innerHTML = "";
			}

			if (batchId === "") {
				document.getElementById('batchIdError').innerHTML = "Batch ID is required";
				isValid = false;
			} else {
				document.getElementById('batchIdError').innerHTML = "";
			}

			return isValid;
		}
	</script>

</body>
</html>
