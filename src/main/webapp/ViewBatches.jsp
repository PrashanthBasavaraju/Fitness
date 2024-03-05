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
<title>View All Batches</title>
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

	<%
	BatchOperations batch = new BatchOperations();
	List<Batch> batches = batch.viewAllBatches();
	pageContext.setAttribute("allbatches", batches);
	%>
	<div class="container">
		<h1>View All Batches</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Batch ID</th>
					<th scope="col">Batch Name</th>
					<th scope="col">Batch Time</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="batch" items="${allbatches}">
					<tr>
						<td>${batch.bid}</td>
						<td>${batch.name}</td>
						<td>${batch.time}</td>
						<td>
							<form method="post" action="BatchServlet">
								<input type="hidden" name="_method" value="DELETE"> <input
									type="hidden" name="bid" value="${batch.bid}">
								<button type="submit" class="btn btn-danger" name="action"
									value="delete">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
