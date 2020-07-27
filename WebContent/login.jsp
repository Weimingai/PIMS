<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,com.wangxinwei.servlet.*" %>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.io.*,java.util.*,java.text.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*,org.apache.poi.ss.usermodel.Workbook" %>
<%
String action=request.getParameter("action");
if(action!=null&&action.equals("login")){
	String role=request.getParameter("role");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	if(role.equals("admin"))
	{
		Admin admin=null;
		try{
			admin=AdminMgr.getInstance().validate(username, password);
		}catch(UserNotFoundException e)
		{
			%>
			<script type="text/javascript">
				alert("�˺Ų�����");
				window.history.back(-1);
			</script>
			<%
			//response.sendRedirect("login.jsp");
			return;
		}catch(PasswordNotCorrectException e){
			%>
			<script type="text/javascript">
				alert("���벻��ȷ");
				window.history.back(-1);
			</script>
			<%
			return;
		}
		
		session.setAttribute("user",admin);
		response.sendRedirect("admin/adminIndex.jsp");
	}else if(role.equals("student"))
	{
		Student student=null;
		try{
			student=StudentMgr.getInstance().validate(username, password);
		}catch(UserNotFoundException e)
		{
			%>
				<script type="text/javascript">
					alert("�˺Ų�����");
					window.history.back(-1);
				</script>
			<%
			return;
		}catch(PasswordNotCorrectException e){
			%>
			<script type="text/javascript">
				alert("���벻��ȷ");
				window.history.back(-1);
			</script>
			<%
			return;
		}
		session.setAttribute("user",student);
		response.sendRedirect("student/studentIndex.jsp");
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�人����ѧרҵ������Ϣ����ϵͳ</title>
<!-- ���°汾�� Bootstrap ���� CSS �ļ� -->
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
.title{
	font-family:����;
	font-size:40px;
	color:#1681bf;
	margin-top:10px;
	text-align:center;
}
.main{
/*
	background-color:#1681bf;
	background-image:url(../timg.jpg);*/
	background="timg.jpg";
	height:600px;
	width:1200px;
	margin:0 auto;
	margin-top:20px;
	position:relative;
}
.login_box{
	width:400px;
	height:400px;
	background-color:#FFFFFF;
	position:absolute;
	right:60px;
	top:100px;
}
.login_inner{
	width:350px;
	margin:0 auto;
	margin-top:60px;
}
.danxuan{
	margin-bottom:10px;
}
.textint{
	margin-bottom:10px;
	width:300px;
}
#yanzhengma{
	margin-top:20px;
	width:150px;
}
.yanzheng{
	padding-left:20px;
	font-size:20px;
}
.button{
	margin-top:10px;
	margin-right:60px;
	width:80px;
	height:35px;
}
#loginbutton{
	margin-left:50px;
}
.footer{
	height:60px;
	text-align:center;
	border-top:10px;
	font-size:15px;
}
.footer_text{
	padding-top:25px;
}
.checknum{
width:100px;
margin-right:30px;
}
</style>
<script language="javascript">
	
	var code="" ; //��ȫ�� ������֤��
    function createCode(){
    code = "";
    var codeLength = 4;//��֤��ĳ���
    var checkCode = document.getElementById("checkCode");
    checkCode.value = "";
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
 
 
    for(var i=0;i<codeLength;i++) {
       var charIndex = Math.floor(Math.random()*35);
       code +=selectChar[charIndex];
    }
    if(code.length != codeLength){
       createCode();
    }
    document.getElementById("checkCode").innerHTML = code;
    }
	
	function checklogin(){
		if(validate())
		{
			return true;
		}else{
			return false;
		}
	}
	
	function validate () {
    var inputCode = document.getElementById("checkNum").value.toUpperCase();
 
 
    if(inputCode.length <=0) {
       alert("��������֤�룡");
       return false;
    }
    else if(inputCode != code ){
       alert("��֤���������");
       createCode();
       return false;
    }
    else {
       return true;
    }
    }
	
</script>
	
</head>
<body onload="createCode();">
	<div class="title">�人����ѧרҵ������Ϣ����ϵͳ</div>
	<div class="main" style="background:url(timg.jpg)">
		<div class="login_box">
			<div class="login_inner">
				<form name="loginform" action="login.jsp" method="post" onsubmit="return checklogin()">
					<input type="hidden" name="action" value="login" />
					<font font-size="10px">Role:</font><br />
					<div class="danxuan">
					<label class="radio-inline">
					<input type="radio" name="role" id="inlineRadio1" value="admin" checked> ����Ա
					</label>
					<label class="radio-inline">
					<input type="radio" name="role" id="inlineRadio2" value="student"> ѧ��
					</label>
					</div>
					<font font-size="10px">ID:</font><br />
					<input class="textint form-control" type="text" name="username" placeholder="�˺�" />
					<font font-size="10px">Password:</font><br />
					<input class="textint form-control" type="password" name="password" placeholder="����" />
					<table>
						<tr>
							<td>
								<input id="checkNum" class="checknum form-control" type="text" name="password" placeholder="��֤��" />
							</td>
							<td>
								<!-- <div class="yanzheng">1236</div> -->
								<a id="checkCode" onclick="createCode()"></a>
							</td>
						</tr>
					</table>
					<input id="loginbutton" class="button btn btn-default" type="submit" value="��¼" />
					<input class="button btn btn-default" type="reset" value="����" />
				</form>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<p class="footer_text">
		��Ȩ���У��人����ѧ����ѧԺ @2020 Wangxinwei
		</p>
	</div>
</body>
</html>