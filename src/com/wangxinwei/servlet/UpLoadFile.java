package com.wangxinwei.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.*;
import org.apache.commons.fileupload.*;
import java.util.*;
import java.util.regex.*;
import java.io.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.wangxinwei.Mgr.StudentMgr;
import com.wangxinwei.model.Student;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import javax.servlet.http.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpLoadFile
 */

public class UpLoadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpLoadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("studentinfo.jsp");
		//System.out.println("执行1！");
		doPost(request,response);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 千锋教育，失败
		//上传文件的路径,得到的是部署在tomcat下面的项目中的uploadfile路径
		String uploadPath=request.getServletContext().getRealPath("/uploadfile");
    	// 文件上传大的工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 文件上传的核心类
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 解析request对象
        try {
        	//表单中的数据list里面
        	List<FileItem> fileItems=upload.parseRequest(request);
        	for(FileItem fileItem:fileItems)
        	{
        		String name=fileItem.getFieldName();//文件名称
        		name="testimport.xls";
        		String fieldName=fileItem.getFieldName();//表单中属性名称
        		
        		System.out.println("name:"+name);
        		System.out.println("fieldName:"+fieldName);
        		
        		//得到上传文件的输入流
        		InputStream ips=fileItem.getInputStream();
        		//IO流的拷贝操作
        		File file=new File("D:\\afile\\testimport.xls");
        		//File file=new File(uploadPath+File.separator+name);//先创建一个文件
        		//System.out.println("输出文件："+uploadPath+File.separator+name);
        		FileOutputStream ops=new FileOutputStream(file);//输出流
        		
        		byte[] data=new byte[2048];//一次读取2048字节
        		
        		int read=0;//记录读取到哪里
        		
        		try {
        			while((read=ips.read(data,0,data.length))!=-1)
            		{
            			ops.write(data,0,read);//写的操作
            		}
        		}catch(Exception e)
        		{
        			e.printStackTrace();
        		}finally {
        			//关闭资源
        			if(ips!=null)
        			{
        				ips.close();
        			}
        			if(ops!=null)
        			{
        				ops.close();
        			}
        		}
 
        	}
        }catch(FileUploadException e)
        {
        	e.printStackTrace();
        }
           
		//将文件读取存入数据库
        
        readfile();
	}
	
	public void readfile() throws IOException {
		File f=new File("D:\\afile\\testimport.xls");
		
		try {
			InputStream ips=new FileInputStream(f);
			HSSFWorkbook book=new HSSFWorkbook(ips);
			HSSFSheet sheet=book.getSheetAt(0);
			
			int begin=1;
			
			int end=sheet.getLastRowNum();//表最后一行
			
			for(int i=begin;i<=end;i++)
			{
				HSSFRow row=sheet.getRow(i);
				//设置转换类型
				row.getCell(1).setCellType(CellType.STRING);
				row.getCell(2).setCellType(CellType.STRING);
				row.getCell(3).setCellType(CellType.STRING);
				row.getCell(4).setCellType(CellType.STRING);
				row.getCell(5).setCellType(CellType.STRING);
				row.getCell(6).setCellType(CellType.STRING);
				row.getCell(7).setCellType(CellType.STRING);
				
				String stuNo=row.getCell(1).getStringCellValue();
				String stuName=row.getCell(2).getStringCellValue();
				String sex=row.getCell(3).getStringCellValue();
				String stuSchool=row.getCell(4).getStringCellValue();
				String stuGrade=row.getCell(5).getStringCellValue();
				String oldDepartment=row.getCell(6).getStringCellValue();
				String oldClass=row.getCell(7).getStringCellValue();
				double basicScore=row.getCell(8).getNumericCellValue();
				double extraScore=row.getCell(9).getNumericCellValue();
				int stuRank=(int) row.getCell(10).getNumericCellValue();
				
				Student student=new Student(stuNo,stuName,sex, stuSchool, stuGrade, oldDepartment,
						oldClass, basicScore, extraScore, stuRank);
				StudentMgr.getInstance().addstudent(student);
			}
			System.out.println("导入成功！");
		}catch(FileNotFoundException e)
		{
			System.out.println("文件未找到！");
		}
	}
}
