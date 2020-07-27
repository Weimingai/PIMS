package com.wangxinwei.Mgr;
import com.wangxinwei.dao.*;
import com.wangxinwei.model.Admin;

public class AdminMgr {
	//����ģʽ
		//����һ����̬�Ķ���
		private static AdminMgr am=null;
		AdminDAO dao=null;
		//��̬�鹹��һ�� sm
		static {
			if(am==null)
			{
				am=new AdminMgr();
				//you should read the config file to set the specific dao object
				am.setDAO(new AdminMySqlDAO());
			}
		}
		//����һ��˽�еĹ��췽��
		private AdminMgr() {}
		//�õ�StudentMgr
		public static AdminMgr getInstance() {
			return am;
		}
		//����DAO
		public void setDAO(AdminDAO dao)
		{
			this.dao=dao;
		}
		
		public Admin validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException
		{
			return dao.validate(username,password);
		}
		
		public void updatePassword(Admin admin,String newPassword1) throws UserNotFoundException
		{
			dao.updatePasssword(admin,newPassword1);
		}
}
