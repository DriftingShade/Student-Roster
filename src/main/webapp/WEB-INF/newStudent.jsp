<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <title>New Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container mx-auto w-75 text-center">
		<h1>New Student</h1>
		<p><a href="/">Dashboard</a></p>
		<form:form action="/students/new" modelAttribute="student" method="post">
			<div>
				<form:errors path="name"/>
				<form:label path="name" for="name">Name:</form:label>
				<form:input path="name" type="text"/>
			</div>
			<div>
				<form:select path="dorm" class="my-3">
				    <c:forEach var="dorm" items="${dorms}">
				    	<option value="${dorm.id}">${dorm.name}</option>
				    </c:forEach>
				</form:select>
			</div>
			<div>
				<input value="Add" class="btn btn-primary my-3" type="submit"/>
			</div>
		</form:form>
	</div>
</body>
</html>