<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="ISO-8859-1">
<title>${dorm.name} Students</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container mx-auto w-75">
		<h1 class="text-center">${dorm.name } Students</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>Student Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${dorm.students}">
					<tr>
						<td>${student.name}</td>
						<td><a href="/students/remove/${student.id}">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="container text-center">
            <h2>Add or Reassign Student</h2>
            <form action="/dorms/${dorm.id}/addStudent" method="post">
                <select name="studentId" class="form-select">
                    <c:forEach var="student" items="${students}">
                        <option value="${student.id}">${student.name} (${student.dorm != null ? student.dorm.name : 'No Dorm'})</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary mt-3">Add</button>
            </form>
        </div>
		<div class="container text-center">
			<a href="/" class="btn btn-primary my-5">Back To Dorms</a>
		</div>
	</div>
</body>
</html>