<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//BUG：修改专业后无法自动刷新，专业分流板块的代码还没有实现

request.setCharacterEncoding("gb2312");

List<String> grades=new ArrayList<String>();
grades=StudentMgr.getInstance().getGrade();
List<Department> departments=new ArrayList<Department>();
departments=DepartmentMgr.getInstance().getDepartment();
com.wangxinwei.model.Time time=new com.wangxinwei.model.Time();
TimeMgr.getInstance().getTime(time);

//进行专业分流
String actionset=request.getParameter("action");
if(actionset!=null&&actionset.equals("doaction"))
{
	String stuGrade=request.getParameter("stugrade");
	int result;
	result=StudentMgr.getInstance().professionDiversion(stuGrade);
	if(result==-1)
	{
		%>
		<script type="text/javascript">
			alert("专业设置人数与学生总人数不匹配，请重新设置专业人数！");
			//多加了一步跳转界面，以便刷新该页面的修改
			//window.location.href="studentinfo.jsp";
			//window.history.back(-1);
		</script>
		<% 
	}else if(result==1)
	{
		%>
		<script type="text/javascript">
		alert("专业分流成功！");
		//多加了一步跳转界面，以便刷新该页面的修改
		//window.location.href="studentinfo.jsp";
		//window.history.back(-1);
		</script>
		<%
	}
	
}
//设置时间
else if(actionset!=null&&actionset.equals("timesetaction"))
{
	Timestamp startTime=null;
	Timestamp endTime=null;
	boolean isset=false;
	
	String strStratTime=request.getParameter("starttime");
	if(strStratTime==null||strStratTime.trim().equals(""))
	{
		startTime=null;
	}else{
		startTime=Timestamp.valueOf(request.getParameter("starttime"));
	}
	String strEndTime=request.getParameter("endtime");
	if(strEndTime==null||strEndTime.trim().equals(""))
	{
		endTime=null;
	}else{
		endTime=Timestamp.valueOf(request.getParameter("endtime"));
	}
	
	isset=TimeMgr.getInstance().setTime(startTime,endTime);
	if(isset==true)
	{
		%>
			<script type="text/javascript">
				alert("志愿填报时间设置成功！");
				//多加了一步跳转界面，以便刷新该页面的修改
				window.location.href="studentinfo.jsp";
				window.location.href="professionset.jsp";
			</script>
		<% 
	}
	else{
		%>
		<script type="text/javascript">
			alert("志愿填报时间设置失败！");
		</script>
	<% 
	}
}
//进行专业设置修改
else if(actionset!=null&&actionset.equals("prosetaction"))
{
	String strId=request.getParameter("id");
	String strDepartment=request.getParameter("department");
	String strStuCount=request.getParameter("stucount");
	
	int id=-1;
	int stuCount=-1;
	
	if(strId!=null&&!strId.equals(""))
	{
		id=Integer.parseInt(strId);
	}
	if(strStuCount!=null&&!strStuCount.equals(""))
	{
		stuCount=Integer.parseInt(strStuCount);
	}
	
	Department department=null;
	if(id!=-1&&stuCount!=-1)
	{
		department=new Department(id,strDepartment,stuCount);
		DepartmentMgr.getInstance().updateDepartmrnt(department);
		%>
		<script language="javascript">
		alert("修改成功！");
		window.location.href="studentinfo.jsp";
		window.location.href="professionset.jsp";
		</script>
		<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>专业分流设置</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<!-- bootstrap时间控件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:微软雅黑;
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
h2{
font-family:微软雅黑;
font-size:20px;
font-size:
}
.main{
	margin-left:80px;
	margin-top:80px;
}
.form-control{
	width:200px;
}
.wenzi{
margin-top:5px;
font-family:微软雅黑;
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
.btns{
margin-left:50px;
}
.btnss{
margin-left:20px;
margin--bottom:10px;
}
.proset table td{
border:1px;
text-algin:center;
}
.tableinput {
border:none;
}
.btnssa{
margin-top:53px;
}
.mid{
font-family:微软雅黑;
font-size:18px;
}
.displaytime{
margin-top:10px;
font-family:宋体;
font-size:16px;
}
</style>
</head>
<body>
<div class="main">
	<div class="prostart">
	<form class="floatleft" neme="doaction" action="professionset.jsp" method="post">
	<input type="hidden" name="action" value="doaction" />
	<h2>开始分流</h2>
	<input type="hidden" name="actionsearch" value="search" />
	<div class="wenzi floatleft">年级：</div>
	<select class="mleft floatleft form-control" name="stugrade">
	 <%
	for(Iterator<String> it=grades.iterator();it.hasNext();)
	{
		String grade=it.next();
		%>
		<option value =<%=grade %>><%=grade %></option>
		<%
	}
	%>
	</select>
	<button class="btn btns">专业分流</button>
	<br />
	</form>
	<a href="downmuban.jsp"><button class="btn btns btnssa">导入模板下载</button></a>
	</div>
	<br />
	<div class="protime">
	<h2>志愿填报时间设置</h2>
	<form name="timeset" action="professionset.jsp" method="post">
	<input type="hidden" name="action" value="timesetaction" />
	<table>
		<tr>
			<td>
		            <!--指定 date标记-->
		            <div class='input-group date' id='datetimepicker1'>
		                <input type='text' class="form-control" name="starttime" />
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
			</td>
			<td> <div class="mid">&nbsp;至&nbsp;</div> </td>
			<td>
		            <!--指定 date标记-->
		            <div class='input-group date' id='datetimepicker2'>
		                <input type='text' class="form-control" name="endtime" />
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
			</td>
			<td><input class="btn btnss" type="submit" value="提交" /></td>
		</tr>
	</table>
	</form>
	
	<script type="text/javascript">
	$(function () {
	    $('#datetimepicker1').datetimepicker({
	        format: 'YYYY-MM-DD hh:mm:ss',
	        locale: moment.locale('zh-cn')
	    });
	});
	$(function () {
	    $('#datetimepicker2').datetimepicker({
	        format: 'YYYY-MM-DD hh:mm:ss',
	        locale: moment.locale('zh-cn')
	    });
	});
	</script>
	
	<div class="displaytime">
	<font color="red">当前专业分流时间：<%=time.getStartTime() %>-<%=time.getEndTime() %></font>
	</div>
	</div>

	<div class="proset">
	<br />
	<h2>专业设置</h2>
	<input type="hidden" name="action" value="prosetaction" />
	<table>
		<tr>
			<th>序号</th>
			<th>专业</th>
			<th>人数</th>
			<th>更新</th>
		</tr>
		<%
		for(Iterator<Department> it=departments.iterator();it.hasNext();)
		{
			Department department=it.next();
			%>
			<form name=<%=department.getId() %> action="professionset.jsp" method="post">
			<input type="hidden" name="action" value="prosetaction" />
			<tr>
				<td><input class="tableinput form-control" type="text" name="id" value=<%=department.getId() %> readonly /></td>
				<td><input class="tableinput form-control" type="text" name="department" value=<%=department.getDeparment() %> /></td>
				<td><input class="tableinput form-control" type="text" name="stucount" value=<%=department.getStuCount() %> /></td>
				<td><input class="tableinput btn" type="submit" value="更新" /></td>
				<!--
				<td><a href="departmentdelete.jsp">删除</a></td>
				-->
			</tr>
			</form>
			<%
		}
		%>
	</table>
	</div>
</div>
</body>
</html>