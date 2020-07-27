<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");
//��ҳ
int pageNo=1;
int pageCount=1;
int pageSize=3;

String strPageNo=request.getParameter("pageno");
if(strPageNo!=null&&!strPageNo.trim().equals("")){
	pageNo=Integer.parseInt(strPageNo);
}

String strPageCount=request.getParameter("pagecount");
if(strPageCount!=null&&!strPageCount.trim().equals("")){
	pageCount=Integer.parseInt(strPageCount);
}

String strPageSize=request.getParameter("pagesize");
if(strPageSize!=null&&!strPageSize.trim().equals("")){
	pageSize=Integer.parseInt(strPageSize);
}

if(pageNo>pageCount)
{
	pageNo=pageCount;
}
if(pageNo<1)
{
	pageNo=1;
}

String strUpPageSIze=request.getParameter("uppagesize");
if(strUpPageSIze!=null&&!strUpPageSIze.equals("uppagesize"))
{
	strPageSize=request.getParameter("pagesize");
	pageSize=Integer.parseInt(strPageSize);
}
%>

<%
//��ҳ ����ҳ���ķ���
String action=request.getParameter("action");

List<String> grades=new ArrayList<String>();
grades=StudentMgr.getInstance().getGrade();
String strStuGrade=null;

List<Student> students=new ArrayList<Student>();

//actions ��ָͨ��<a>����Ĳ�������Ҫת������
String actions=request.getParameter("actions");
if(action!=null&&action.trim().equals("search")){
	if(actions!=null&&actions.trim().equals("page"))
	{
		strStuGrade = new String(request.getParameter("stugrade").getBytes("ISO-8859-1"),"gb2312");
	}else
	{
		strStuGrade=request.getParameter("stugrade");	
	}
	
	String strStuName=request.getParameter("searchname");
	String strDepartment=null;
	pageCount=StudentMgr.getInstance().searchStudents(students,pageNo,pageSize,strStuGrade,strDepartment,strStuName);
}else
{
	strStuGrade=grades.get(grades.size()-1);

	pageCount=StudentMgr.getInstance().getStudents(students,pageNo,pageSize,strStuGrade);	
}
if(pageNo>pageCount)
{
	pageNo=pageCount;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>ѧ��־Ը��ѯ</title>
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
.form-control{
	width:200px;
}
.wenzi{
margin-top:5px;
font-family:΢���ź�;
font-size:18px;
}
.floatleft{
float:left;
}
.mleft{
margin-left:20px;
margin-bottom:20px;
}
.searchpart{
height:20px;
margin-top:20px;
}
.infotable{
margin-top:10px;
}
.pgc{
	width:80px;
	float:left;
	margin-left:200px;
}
.btns{
margin-left:10px;
}
</style>
</head>
<body>
<div class="searchpart">
	<form class="floatleft" name="searchform" action="studentwish.jsp" method="post">
		<input type="hidden" name="action" value="search" />
		<div class="wenzi mleft floatleft">�꼶��</div>
		<select class="mleft floatleft form-control" name="stugrade">
		 <%
		for(Iterator<String> it=grades.iterator();it.hasNext();)
		{
			String grade=it.next();
			if(!grade.equals(strStuGrade))
			{
				%>
				<option value =<%=grade %>><%=grade %></option>
				<%
			}
			else
			{
				%>
				<option value =<%=grade %> selected="selected"><%=grade %></option>
				<%
			}
		}
		%>
		</select>
		<div class="wenzi mleft floatleft">������</div>
		<input class="floatleft form-control" type="text" name="searchname" />
		<input class="mleft btn" type="submit" value="����" />
	</form>
</div>	
	
	<table border="1" align="center" class="table table-bordered">
		<tr>
			<th>���</th>
			<th>ѧ��</th>
			<th>����</th>
			<th>��һ־Ը</th>
			<th>�ڶ�־Ը</th>
			<th>����־Ը</th>
			<th>����־Ը</th>
			<th>����־Ը</th>
			<th>����־Ը��</th>
			<th>�޸�ʱ��</th>
		</tr>
		<%
		int num=1;
		for(Iterator<Student> it=students.iterator();it.hasNext();)
		{
			Student p=it.next();
			%>
			<tr>
				<td><%=num++%></td>
				<td><%=p.getStuNo() %></td>
				<td><%=p.getStuName() %></td>
				<td><%=p.getDeparment1() %></td>
				<td><%=p.getDeparment2() %></td>
				<td><%=p.getDeparment3() %></td>
				<td><%=p.getDeparment4() %></td>
				<td><%=p.getDeparment5() %></td>
				<td><%=p.getDeparment6() %></td>
				<td><%=p.getUpdateTime() %></td>
			</tr>
			<%
		}
		
		%>
	</table>
	
		<center>
		<table>
		<tr>
		<td>
		<% 
		if(pageCount>1)
		{
		%>
		<nav aria-label="Page navigation">
			<ul class="pagination">
 			<li>
			<a href="studentwish.jsp?pageno=<%=1 %>&pagecount=<%=pageCount%>&pagesize=<%=pageSize%>&stugrade=<%=strStuGrade %>&action=search&actions=page">��ҳ</a>    
			</li>
			<li>
			<a href="studentwish.jsp?pageno=<%=pageNo-1 %>&pagecount=<%=pageCount%>&pagesize=<%=pageSize%>&stugrade=<%=strStuGrade %>&action=search&actions=page">��һҳ</a> 
			</li>
			<li>
  			<a href="#">��<%=pageNo %>ҳ</a>
  			</li>
			<li>
  			<a href="#">��<%=pageCount %>ҳ</a>
  			</li>
			<li>
			<a href="studentwish.jsp?pageno=<%=pageNo+1 %>&pagecount=<%=pageCount%>&pagesize=<%=pageSize%>&stugrade=<%=strStuGrade %>&action=search&actions=page">��һҳ</a>
			</li>
			<li>
			<a href="studentwish.jsp?pageno=<%=pageCount %>&pagecount=<%=pageCount%>&pagesize=<%=pageSize%>&stugrade=<%=strStuGrade %>&action=search&actions=page">βҳ</a>
			</li>
			</ul>
		</nav>	
		<% 
		}else
		{
			%>
			<nav aria-label="Page navigation">
			  <ul class="pagination">
		  			<li>
		  			<a href="#">��<%=pageNo %>ҳ</a>
		  			</li>
					<li>
		  			<a href="#">��<%=pageCount %>ҳ</a>
		  			</li>
			  </ul>
			</nav>
			<% 
		}
		%>
		</td>
		<td>
		<form name="uppagesize" action="studentwish.jsp" method="post">
		<input type="hidden" name="uppagesize" value="uppagesize" />
		<select class="pgc form-control" name="pagesize">
		  <option value ="3">3</option>
		  <option value ="5">5</option>
		  <option value="50">50</option>
		  <option value="100">100</option>
		</select>
		<input class="btn btns" type="submit" value="ȷ��" />
		</form>
		</td>
		</tr>
		</table>
	 </center>
</body>
</html>