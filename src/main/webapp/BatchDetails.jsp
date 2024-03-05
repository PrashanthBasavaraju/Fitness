<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.fitness.connection.DBConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Batch Participants</title>
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
	max-width: none;
	margin: 0 auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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
		<h1>Batch Participants</h1>
		<div class="row">
			<%
			try {
				// Retrieve batch ID from request parameters
				String batchId = request.getParameter("bid");

				// Query the database to retrieve participants for the given batch ID
				Connection conn = DBConnection.getConnection();
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM Participant WHERE bid = ?");
				ps.setString(1, batchId);
				ResultSet rs = ps.executeQuery();

				// Iterate over the result set and display participants
				while (rs.next()) {
			%>
			<div class="col-md-4 mb-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							Participant ID:
							<%=rs.getString("pid")%></h5>
						<p class="card-text">
							Participant Name:
							<%=rs.getString("name")%></p>
						<p class="card-text">
							Participant Phone:
							<%=rs.getString("phone")%></p>
						<p class="card-text">
							Participant Phone:
							<%=rs.getString("email")%></p>

					</div>
				</div>
			</div>
			<%
			}
			conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
