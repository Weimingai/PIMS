<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//BUG：修改专业后无法自动刷新，专业分流板块的代码还没有实现
//BUG修改日志：修改专业后session无法自动更新，所以更换从数据库提取数据进行显示

request.setCharacterEncoding("gb2312");
//这里犯了一个很傻的错误，Time和java.sql里面的Time重复了，因为前面已经写了很多代码所有不方便更改，只能这样了。
//判断当前时间段是否允许修改志愿
com.wangxinwei.model.Time time=new com.wangxinwei.model.Time();
TimeMgr.getInstance().getTime(time);

Timestamp now=new Timestamp(System.currentTimeMillis());

//一些变量
List<Department> departments=new ArrayList<Department>();
departments=DepartmentMgr.getInstance().getDepartment();
Student wishstudent=(Student)session.getAttribute("user");
List<String> studep=new ArrayList<String>();

if(!(now.after(time.getStartTime())&&now.before(time.getEndTime())))
{
	%>
	<script type="text/javascript">
		alert("当前时间段不允许修改志愿！");
		window.history.back(-1);
	</script>
	<% 
}
else
{
	
	studep.add(wishstudent.getDeparment1());
	studep.add(wishstudent.getDeparment2());
	studep.add(wishstudent.getDeparment3());
	studep.add(wishstudent.getDeparment4());
	studep.add(wishstudent.getDeparment5());
	studep.add(wishstudent.getDeparment6());
	studep.add(wishstudent.getDeparment7());
	studep.add(wishstudent.getDeparment8());
	studep.add(wishstudent.getDeparment9());
	studep.add(wishstudent.getDeparment10());

	//提交选择
	String action=request.getParameter("action");
	if(action!=null&&action.equals("select"))
	{
		List<String> subwish=new ArrayList<String>();	
		String strmid="";
		String strpara="";
		for(int i=1;i<=departments.size();i++)
		{
			//参数获取
			strpara="dep"+i;
			strmid=request.getParameter(strpara);
			if(strmid!=null&&!strmid.equals(""))
			{
				subwish.add(strmid);
			}
		}
		
		//检查是否有相同的专业
		String temp="";
		boolean chongfu=false;
		for(int i=0;i<subwish.size()-1;i++)
		{
			temp=subwish.get(i);
			for(int j=i+1;j<subwish.size();j++)
			{
				if(temp.equals(subwish.get(j)))
				{
					chongfu=true;
				}
			}
		}
		
		if(chongfu==true)
		{
			%>
			<script type="text/javascript">
				alert("志愿不可以选择重复专业，请重新填写！");
			</script>
			<% 
			System.out.println("重复！");
			return;
		}else{
			//填充数组
			String[] writewish=new String[10];
			for(int i=0;i<subwish.size();i++)
			{
				writewish[i]=subwish.get(i);
			}
			
			//进行修改
			StudentMgr.getInstance().updateDep(wishstudent,writewish);
			session.setAttribute("user",wishstudent);	
			%>
			<script type="text/javascript">
				alert("保存成功！");
			</script>
			<% 
		}
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>志愿填报界面</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
.title{
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
	font-family:微软雅黑;
	font-size:25px;
}
.selectmain table{
	border-collapse: collapse;
}
.selectmain td{
	/*border:1px solid;*/
	text-align:center;
	font-size:18px;
	font-family:微软雅黑;
	width:200px;
	height:45px;
}
.form-control{
font-size:16px;
font-family:微软雅黑;
}
.btn{
}
.btn2{
font-family:微软雅黑;
margin-top:30px;
}
</style>
</head>
<body>
<div class="title">志愿选择界面</div>
<div class="selectmain">
<form name="wishform" action="wishselect.jsp" method="post">
	<input type="hidden" name="action" value="select" />
	<center>
	<table>
	<%
	for(int i=1;i<=departments.size();i++)
	{
		String str="dep"+i;
	%><tr>
		<td>志愿<%=i %></td>
		<td>
		<select class="form-control" name=<%=str %>>
		 <%
		for(int j=0;j<departments.size();j++)
		{
			if(j==0)
			{
				%>
				<option value =<%=departments.get(j).getDeparment() %> select="selected"><%=departments.get(j).getDeparment() %></option>
				<%
			}else
			{
				%>
				<option value =<%=departments.get(j).getDeparment() %> select="selected"><%=departments.get(j).getDeparment() %></option>
				<%
			}
		}
		%>
		</select>
		</td>
		</tr>
	<%
	}
	%>
	<tr>
	<td><input class="btn btn2" type="submit" value="保存"/></td>
	<td><input class="btn btn2" type="reset" value="重新选择" /></td>
	</tr>
	</table>
	</center>
</form>
</div>
</body>
</html>