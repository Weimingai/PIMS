<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");

String action=request.getParameter("action");
if(action!=null&&action.equals("delete"))
{
	String strStuNo=request.getParameter("stuno");
	if(strStuNo!=null&&!strStuNo.equals(""))
	{
		StudentMgr.getInstance().deleteStudent(strStuNo);
		%>
		<script type="text/javascript">
			alert("É¾³ý³É¹¦£¡");
			window.history.back(-1);
		</script>
		<%
	}
}
%>
