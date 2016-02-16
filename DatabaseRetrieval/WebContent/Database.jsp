<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "SSDIAssignment";
String userId = "root";
String password = "puppy@143";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Student Information from Database</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="2">
<tr>

</tr>
<tr bgcolor="#f5f5dc">
<td><b>Student id</b></td>
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String result ="SELECT * FROM Student";
resultSet = statement.executeQuery(result);
while(resultSet.next()){
%>
<tr bgcolor="#f0f8ff">

<td><%=resultSet.getString("studentID") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>