<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");
%>

<%
//��ҳ ����ҳ���ķ���
String action=request.getParameter("action");
String strStuNo=request.getParameter("stuno");
System.out.println(request.getParameter("stuno"));
System.out.println(strStuNo);
Student student=null;
if(action!=null&&action.trim().equals("modify")){
	if(strStuNo!=null&&!strStuNo.equals(""))
	{
		student=StudentMgr.getInstance().getStudent(strStuNo);
	}
}else if(action.equals("formmodify"))
{
	
		String strBasicScore=request.getParameter("basicscore");
		String strExtraScore=request.getParameter("extrascore");
		student=StudentMgr.getInstance().getStudent(strStuNo);
		System.out.println(strStuNo);
		System.out.println(student.getStuNo());
		StudentMgr.getInstance().updateStuInfo(student,strBasicScore,strExtraScore);
		%>
		<script type="text/javascript">
		alert("�޸ĳɹ���");
		window.location.href="studentmodify.jsp?stuno=<%=student.getStuNo()%>&action=modify";
		</script>
		<%	
}
else
{
	%>
	<script type="text/javascript">
		alert("���벻��ȷ");
		window.history.back(-1);
	</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�޸�ѧ����Ϣ</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- ��ѡ�� Bootstrap �����ļ���һ�㲻�����룩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:΢���ź�;
}
a{ 
text-decoration:none;
}
a:link {
	color:#000000;
}
a:visited {
	color:#000000;
}
a:hover {
	color:#000000;
}
.btns
{
width:80px;
margin-left:200px;
}
</style>
</head>
<body>
	<form name="stumodify" action="studentmodify.jsp" method="post">
		<input type="hidden" name="action" value="formmodify" />
		<input type="hidden" name="stuno" value=<%=student.getStuNo() %> />
		<table border="1" class="table table-bordered">
			<tr>
				<td>ѧ��</td>
				<td><%=student.getStuNo() %></td>
			</tr>
			<tr>
				<td>����</td>
				<td><%=student.getStuName() %></td>
			</tr>
			</tr>
			<tr>
				<td>�Ա�</td>
				<td><%=student.getSex() %></td>
			</tr>
			<tr>
				<td>ѧԺ</td>
				<td><%=student.getStuSchool() %></td>
			</tr>
			<tr>
				<td>�꼶</td>
				<td><%=student.getStuGrade() %></td>
			</tr>
			<tr>
				<td>ԭרҵ</td>
				<td><%=student.getOldDeparment() %></td>
			</tr>
			<tr>
				<td>ԭ�༶</td>
				<td><%=student.getOldClass() %></td>
			</tr>
			<tr>
				<td>������</td>
				<td><input type="text" name="basicscore" value=<%=student.getBasicScore() %> /></td>
			</tr>
			<tr>
				<td>���ӷ�</td>
				<td><input type="text" name="extrascore" value=<%=student.getExtraScore() %> /></td>
			</tr>
			<tr>
				<td>�ܷ�</td>
				<td><%=student.getBasicScore()+student.getExtraScore() %></td>
			</tr>
			<tr>
				<td colspan="2"><input class="btn btns" type="submit" value="ȷ��"></td>
			</tr>
		</table>
	</form>
</body>
</html>