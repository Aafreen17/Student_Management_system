<%@page import="com.codegnan.beans.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.codegnan.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
if(session != null && session.getAttribute("username")!=null ){
		%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><h2>Student Management System</h2>
	<%
	StudentService studentService = new StudentService();
	List<Student> students = studentService.findAllStudents();
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
		</tr>
		<%
		for(Student student : students){
			%>
			<tr>
				<td><%= student.getId() %></td>
				<td><%= student.getName() %></td>
				<td><%= student.getEmail() %></td>
			</tr>
			<%
		}
		
		%>
		
	</table>
	<%
	
	%>
</body>
</html>

<%
}
else{
	%>
	<jsp:forward page="index.jsp">
		<jsp:param value="Invalid way to access" name="msg"/>
	</jsp:forward>
	<%
}
%>