<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*" %>
<%

Admin admin=(Admin)session.getAttribute("user");
if(admin==null)
{
	response.sendRedirect("../login.jsp");
}

%>