<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>New Dorm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container mx-auto w-75">
		<h1 class="text-center">Create A Dorm</h1>
		<form:form action="/createdorm" class="form-control w-25 mx-auto" method="post" modelAttribute="dorm">
			<form:label path="name" class="my-3">Dorm Name:</form:label>
			<form:input path="name" class="form-control my-3"></form:input>
			<form:errors path="name"></form:errors>
			<button type="submit" class="btn btn-primary my-3">Create!</button>
		</form:form>
		<div class="container text-center">
			<a href="/" class="btn btn-primary my-5">Back To Dorms</a>
		</div>
	</div>
</body>
</html>