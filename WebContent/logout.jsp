<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<% 
session.removeAttribute("user");
%>
<script type="text/javascript">
	alert("×¢Ïú³É¹¦£¡");
	window.parent.location.href="login.jsp";
</script>