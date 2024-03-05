<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.fitness.connection.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Participant</title>
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

.form-control {
	margin-bottom: 20px;
}

.card {
	background-color: #B7F0E9; /* Set your desired background color */
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
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h1 class="card-title">Update Participant</h1>
						<form id="updateParticipantForm" method="Post"
							action="ParticipantServlet">
							<input type="hidden" name="_method" value="PUT">
							<div class="mb-3">
								<label for="participantId" class="form-label">Participant
									ID</label> <select class="form-select" id="participantId" name="pid"
									required>
									<option value="">Select participant ID to update</option>
									<%
									try {
										Connection conn = DBConnection.getConnection();
										Statement stmt = conn.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT pid,name FROM Participant");
										while (rs.next()) {
											int participantId = rs.getInt("pid");
											String participantName = rs.getString("name");
									%>
									<option value="<%=participantId%>"><%=participantName%></option>
									<%
									}
									conn.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label for="participantName" class="form-label">New
									Participant Name</label> <input type="text" class="form-control"
									id="participantName" name="name"
									placeholder="Enter new participant name" required>
							</div>
							<div class="mb-3">
								<label for="participantPhone" class="form-label">New
									Participant Phone</label> <input type="text" class="form-control"
									id="participantPhone" name="phone"
									placeholder="Enter new participant phone number" required>
							</div>
							<div class="mb-3">
								<label for="participantEmail" class="form-label">New
									Participant Email</label> <input type="email" class="form-control"
									id="participantEmail" name="email"
									placeholder="Enter new participant email address" required>
							</div>
							<div class="mb-3">
								<label for="batchId" class="form-label">New Batch ID</label> <select
									class="form-select" id="batchId" name="bid" required>
									<option value="">Select new batch ID</option>
									<%
									try {
										Connection conn = DBConnection.getConnection();
										Statement stmt = conn.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT bid,name FROM Batch");
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
							</div>
							<button type="submit" class="btn btn-primary">Update
								Participant</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
