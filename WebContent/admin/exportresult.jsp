<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.io.*,java.util.*,java.text.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*,org.apache.poi.ss.usermodel.Workbook" %>
<%@ include file="_sessioncheck.jsp" %>

<%!
public void testOutputExcel(List<Student> students){
	System.out.println(students.size());
	//创建一个工作
	HSSFWorkbook workbook=new HSSFWorkbook();
	
	//创建一个工作表
	HSSFSheet sheet=workbook.createSheet("专业分流结果表");
	
	HSSFSheet sheet2=workbook.createSheet();
	
	//创建行，并在行中写入数据（表头）
	String[] title={"序号","学号","姓名","性别","学院",
	                "年级","基础分","附加分","总成绩","新专业","第一志愿",
	                "第二志愿","第三志愿","第四志愿","第五志愿","第六志愿","修改时间"};
	//创建第一行
	HSSFRow row=sheet.createRow(0);
	for(int i=0;i<title.length;i++)
	{
		HSSFCell cell=row.createCell(i);//创建单元格
		cell.setCellValue(title[i]);
	}
	
	//把List的数据放进表格
	SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	for(int i=0;i<students.size();i++)
	{
		HSSFRow row2=sheet.createRow(i+1);
		Student student=students.get(i);
		
		HSSFCell cell1=row2.createCell(0);
		cell1.setCellValue(i);
		HSSFCell cell2=row2.createCell(1);
		cell2.setCellValue(student.getStuNo());
		HSSFCell cell3=row2.createCell(2);
		cell3.setCellValue(student.getStuName());
		HSSFCell cell4=row2.createCell(3);
		cell4.setCellValue(student.getSex());
		HSSFCell cell5=row2.createCell(4);
		cell5.setCellValue(student.getStuGrade());
		HSSFCell cell6=row2.createCell(5);
		cell6.setCellValue(student.getStuGrade());
		HSSFCell cell7=row2.createCell(6);
		cell7.setCellValue(student.getBasicScore());
		HSSFCell cell8=row2.createCell(7);
		cell8.setCellValue(student.getExtraScore());
		HSSFCell cell9=row2.createCell(8);
		cell9.setCellValue(student.getBasicScore()+student.getExtraScore());
		HSSFCell cell10=row2.createCell(9);
		cell10.setCellValue(student.getNewDeparment());
		HSSFCell cell11=row2.createCell(10);
		cell11.setCellValue(student.getDeparment1());
		HSSFCell cell12=row2.createCell(11);
		cell12.setCellValue(student.getDeparment2());
		HSSFCell cell13=row2.createCell(12);
		cell13.setCellValue(student.getDeparment3());
		HSSFCell cell14=row2.createCell(13);
		cell14.setCellValue(student.getDeparment4());
		HSSFCell cell15=row2.createCell(14);
		cell15.setCellValue(student.getDeparment5());
		HSSFCell cell16=row2.createCell(15);
		cell16.setCellValue(student.getDeparment6());
		HSSFCell cell17=row2.createCell(16);
		if(student.getUpdateTime()!=null)
		{
			cell17.setCellValue(simpleDateFormat.format(student.getUpdateTime()));
		}else
		{
			cell17.setCellValue(student.getUpdateTime());
		}
		//System.out.println(student.getUpdateTime());
	}
	
	//内存、把数据输出
	File file=new File("D:\\afile\\studentresult.xls");
	try
	{
		OutputStream outputStream=new FileOutputStream(file);
		workbook.write(outputStream);	
	}catch(Exception e)
	{
		System.out.println("有问题！");
		e.printStackTrace();
	}
}
%>


<%
List<Student> students=new ArrayList<Student>();
String strStuGrade = new String(request.getParameter("stugrade").getBytes("ISO-8859-1"),"gb2312");
//这里有个BUG，需要在专业分流结果界面，查询一下2018级的信息，再导入才可以将stugrade的值进行更新
System.out.println("strStuGrade");
students=StudentMgr.getInstance().getGradeStudents(strStuGrade);
testOutputExcel(students);
System.out.println("成功！");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="styles/basic.css" rel="stylesheet" type="text/css" />
<title>download</title>
</head>
<%
response.setCharacterEncoding("gb2312");
request.setCharacterEncoding("gb2312");
String filepath ="D:\\afile\\studentresult.xls";
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
</html>
