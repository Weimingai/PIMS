package com.wangxinwei.Mgr;

import java.sql.Timestamp;
import com.wangxinwei.model.*;
import com.wangxinwei.dao.*;

public class TimeMgr {
	//����ģʽ
	//����һ����̬�Ķ���
	private static TimeMgr tm=null;
	TimeDAO dao=null;
	//��̬�鹹��һ�� sm
	static {
		if(tm==null)
		{
			tm=new TimeMgr();
			//you should read the config file to set the specific dao object
			tm.setDAO(new TimeMySqlDAO());
		}
	}
	//����һ��˽�еĹ��췽��
	private TimeMgr() {}
	//�õ�StudentMgr
	public static TimeMgr getInstance() {
		return tm;
	}
	//����DAO
	public void setDAO(TimeDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * ����־Ը���ʱ���
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public boolean setTime(Timestamp startTime,Timestamp endTime)
	{
		return dao.setTime(startTime,endTime);
	}
	
	/**
	 * ��ȡ־Ը�ʱ���
	 */
	public void getTime(Time time) {
		dao.getTime(time);
	}
}
