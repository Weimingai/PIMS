<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.io.*,java.util.*,java.text.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*,org.apache.poi.ss.usermodel.Workbook" %>
<%@ include file="_sessioncheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
</head>
<body>
<%
response.setCharacterEncoding("gb2312");
request.setCharacterEncoding("gb2312");
String filepath ="D:\\afile\\studentinfo.xls";
System.out.println("============================"+filepath);
if (filepath != null) {
OutputStream os = null;
FileInputStream fis = null;
try {
String file = filepath;
if (!(new File(file)).exists()) {
System.out.println("没有文件");
return;
}
//String filefilename = file.substring(file.lastIndexOf("\\")+1);
String filefilename=file;
System.out.println("文件名为："+filefilename);
os = response.getOutputStream();
response.setHeader("content-disposition", "attachment;filename=" + new String(filefilename.getBytes("GBK"), "ISO-8859-1"));
response.setContentType("application/octet-stream");//八进制流 与文件类型无关
byte temp[] = new byte[1024];
fis = new FileInputStream(file);
int n = 0;
while ((n = fis.read(temp)) != -1) {
os.write(temp, 0, n);
}
} catch (Exception e) {
out.print("出错了");
} finally {
if (os != null)
os.close();
if (fis != null)
fis.close();
}
out.clear();
out = pageContext.pushBody();
}
%>
</body>
</html>