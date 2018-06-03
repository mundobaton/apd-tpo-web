<%@page import="edu.uade.apd.tpo.repository.AdministracionDelegate"%>
<%@page import="edu.uade.apd.tpo.repository.stub.ClienteStub"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		List<ClienteStub> getClientes() {
			try {
				return AdministracionDelegate.getInstance().getClientes();
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
	
	%>
</body>
</html>