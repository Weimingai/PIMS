<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//BUG���޸�רҵ���޷��Զ�ˢ�£�רҵ�������Ĵ��뻹û��ʵ��
//BUG�޸���־���޸�רҵ��session�޷��Զ����£����Ը��������ݿ���ȡ���ݽ�����ʾ

request.setCharacterEncoding("gb2312");
//���ﷸ��һ����ɵ�Ĵ���Time��java.sql�����Time�ظ��ˣ���Ϊǰ���Ѿ�д�˺ܶ�������в�������ģ�ֻ�������ˡ�
//�жϵ�ǰʱ����Ƿ������޸�־Ը
com.wangxinwei.model.Time time=new com.wangxinwei.model.Time();
TimeMgr.getInstance().getTime(time);

Timestamp now=new Timestamp(System.currentTimeMillis());

//һЩ����
List<Department> departments=new ArrayList<Department>();
departments=DepartmentMgr.getInstance().getDepartment();
Student wishstudent=(Student)session.getAttribute("user");
List<String> studep=new ArrayList<String>();

if(!(now.after(time.getStartTime())&&now.before(time.getEndTime())))
{
	%>
	<script type="text/javascript">
		alert("��ǰʱ��β������޸�־Ը��");
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

	//�ύѡ��
	String action=request.getParameter("action");
	if(action!=null&&action.equals("select"))
	{
		List<String> subwish=new ArrayList<String>();	
		String strmid="";
		String strpara="";
		for(int i=1;i<=departments.size();i++)
		{
			//������ȡ
			strpara="dep"+i;
			strmid=request.getParameter(strpara);
			if(strmid!=null&&!strmid.equals(""))
			{
				subwish.add(strmid);
			}
		}
		
		//����Ƿ�����ͬ��רҵ
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
				alert("־Ը������ѡ���ظ�רҵ����������д��");
			</script>
			<% 
			System.out.println("�ظ���");
			return;
		}else{
			//�������
			String[] writewish=new String[10];
			for(int i=0;i<subwish.size();i++)
			{
				writewish[i]=subwish.get(i);
			}
			
			//�����޸�
			StudentMgr.getInstance().updateDep(wishstudent,writewish);
			session.setAttribute("user",wishstudent);	
			%>
			<script type="text/javascript">
				alert("����ɹ���");
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
<title>־Ը�����</title>
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
.title{
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
	font-family:΢���ź�;
	font-size:25px;
}
.selectmain table{
	border-collapse: collapse;
}
.selectmain td{
	/*border:1px solid;*/
	text-align:center;
	font-size:18px;
	font-family:΢���ź�;
	width:200px;
	height:45px;
}
.form-control{
font-size:16px;
font-family:΢���ź�;
}
.btn{
}
.btn2{
font-family:΢���ź�;
margin-top:30px;
}
</style>
</head>
<body>
<div class="title">־Ըѡ�����</div>
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
		<td>־Ը<%=i %></td>
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
	<td><input class="btn btn2" type="submit" value="����"/></td>
	<td><input class="btn btn2" type="reset" value="����ѡ��" /></td>
	</tr>
	</table>
	</center>
</form>
</div>
</body>
</html>