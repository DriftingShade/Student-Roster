<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <title>Dorms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container mx-auto w-75 text-center">
		<h1>Dorms</h1>
		<p><a href="/dorms/new">Add a new dorm</a></p>
		<p><a href="/students/new">Add a new student</a></p>
		
		<p><a href="/classes/new">Add a new class</a></p>
		<p><a href="/classes">View all classes</a></p>
		
		<table class="table text-center w-50 mx-auto">
			<thead>
				<tr>
					<th>Dorm</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dorm" items="${dorms}">
					<tr>
						<td><c:out value="${dorm.name}"/></td>
						<td><a href="/dorms/${dorm.id}"><c:out value="See Students"/></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
