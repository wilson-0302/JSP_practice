<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form method="get" action="form_ok.jsp">
사용자 이름 <input type="text" name="username"><br/>
    <input type="submit" value="전송"/>
</form>
</body>
</html>