<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<% 
session.removeAttribute("user");
%>
<script type="text/javascript">
	alert("ע���ɹ���");
	window.parent.location.href="login.jsp";
</script>