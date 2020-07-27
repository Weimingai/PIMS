<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.io.*,java.util.*,java.text.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*,org.apache.poi.ss.usermodel.Workbook" %>
<%@ include file="_sessioncheck.jsp" %>

<%!
public void testOutputExcel(List<Student> students){
	System.out.println(students.size());
	//����һ������
	HSSFWorkbook workbook=new HSSFWorkbook();
	
	//����һ��������
	HSSFSheet sheet=workbook.createSheet("רҵ���������");
	
	HSSFSheet sheet2=workbook.createSheet();
	
	//�����У���������д�����ݣ���ͷ��
	String[] title={"���","ѧ��","����","�Ա�","ѧԺ",
	                "�꼶","������","���ӷ�","�ܳɼ�","��רҵ","��һ־Ը",
	                "�ڶ�־Ը","����־Ը","����־Ը","����־Ը","����־Ը","�޸�ʱ��"};
	//������һ��
	HSSFRow row=sheet.createRow(0);
	for(int i=0;i<title.length;i++)
	{
		HSSFCell cell=row.createCell(i);//������Ԫ��
		cell.setCellValue(title[i]);
	}
	
	//��List�����ݷŽ����
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
	
	//�ڴ桢���������
	File file=new File("D:\\afile\\studentresult.xls");
	try
	{
		OutputStream outputStream=new FileOutputStream(file);
		workbook.write(outputStream);	
	}catch(Exception e)
	{
		System.out.println("�����⣡");
		e.printStackTrace();
	}
}
%>


<%
List<Student> students=new ArrayList<Student>();
String strStuGrade = new String(request.getParameter("stugrade").getBytes("ISO-8859-1"),"gb2312");
//�����и�BUG����Ҫ��רҵ����������棬��ѯһ��2018������Ϣ���ٵ���ſ��Խ�stugrade��ֵ���и���
System.out.println("strStuGrade");
students=StudentMgr.getInstance().getGradeStudents(strStuGrade);
testOutputExcel(students);
System.out.println("�ɹ���");

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
System.out.println("û���ļ�");
return;
}
//String filefilename = file.substring(file.lastIndexOf("\\")+1);
String filefilename=file;
System.out.println("�ļ���Ϊ��"+filefilename);
os = response.getOutputStream();
response.setHeader("content-disposition", "attachment;filename=" + new String(filefilename.getBytes("GBK"), "ISO-8859-1"));
response.setContentType("application/octet-stream");//�˽����� ���ļ������޹�
byte temp[] = new byte[1024];
fis = new FileInputStream(file);
int n = 0;
while ((n = fis.read(temp)) != -1) {
os.write(temp, 0, n);
}
} catch (Exception e) {
out.print("������");
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
