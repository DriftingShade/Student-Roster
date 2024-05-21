<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${student.name}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
</head>
<body>
	<div class="container w-75 mx-auto text-center">
		<h1><c:out value="${student.name}"/>'s Classes</h1>
		<p><a href="/">Dashboard</a></p>
		
		<form action="/students/${student.id}/add-class" method="post">
			<table class="table w-50 mx-auto">
			    <thead>
			        <tr>
			            <td>	
			            	Classes:				
							<select name="courseId" id="courseId" class="input">
			                    <c:forEach var="course" items="${availableCourses}">
			                    	<option value="${course.id}">${course.name}</option>
			                    </c:forEach>
			                </select>
			            </td>
			            <td><input class="input" class="button" type="submit" value="Add"/></td>
			        </tr>
			    </thead>
			</table>
		</form>
		
		<hr>
		
		<table class="table w-50 mx-auto">
			<thead>
				<tr>
					<th>Class Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${assignedCourses}">
					<tr>
						<td><a href="/classes/${course.id}"><c:out value="${course.name}"/></a></td>
						<td><a href="/students/${student.id}/classes/${course.id}/drop">drop</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
