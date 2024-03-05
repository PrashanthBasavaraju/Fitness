<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.fitness.connection.*"%>
<%@ page import="com.fitness.models.*"%>
<%@ page import="com.fitness.dbOperations.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
/* Custom CSS for styling */
body {
	background-color: #C3E5BA;
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
						href="ViewBatches.jsp">View Batches</a></li>
					<li class="nav-item"><a class="nav-link"
						href="AddParticipant.jsp">Add Participant</a></li>
					<li class="nav-item"><a class="nav-link"
						href="UpdateParticipant.jsp">Update Participant</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ViewParticipants.jsp">View Participants</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="min-height: 100vh;">
		<div>
			<h1 class="text-center">Welcome to Gym Management System</h1>
			<%
			BatchOperations batch = new BatchOperations();
			List<Batch> batches = batch.viewAllBatches();
			pageContext.setAttribute("allbatches", batches);
			%>

			<div class="container">
				<h1>Batches</h1>
				<div class="row">
					<c:forEach var="batch" items="${allbatches}">
						<div class="col-md-4 mb-4">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Batch ID: ${batch.bid}</h5>
									<p class="card-text">Batch Name: ${batch.name}</p>
									<p class="card-text">Batch Time: ${batch.time}</p>
									<a href="BatchDetails.jsp?bid=${batch.bid}"
										class="btn btn-primary">Details</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<%
			ParticipantOperations po = new ParticipantOperations();
			List<Participant> participants = po.viewAllParticipants();
			pageContext.setAttribute("allparticipants", participants);
			%>
			<div class="container">
				<h1>Participants</h1>
				<div class="row">
					<c:forEach var="participant" items="${allparticipants}">
						<div class="col-md-4 mb-4">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Participant ID: ${participant.pid}</h5>
									<p class="card-text">Participant Name: ${participant.name}</p>
									<p class="card-text">Participant Phone:
										${participant.phone}</p>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
