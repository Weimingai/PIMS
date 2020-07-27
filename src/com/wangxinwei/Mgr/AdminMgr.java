package com.wangxinwei.Mgr;
import com.wangxinwei.dao.*;
import com.wangxinwei.model.Admin;

public class AdminMgr {
	//单例模式
		//设置一个静态的对象
		private static AdminMgr am=null;
		AdminDAO dao=null;
		//静态块构造一个 sm
		static {
			if(am==null)
			{
				am=new AdminMgr();
				//you should read the config file to set the specific dao object
				am.setDAO(new AdminMySqlDAO());
			}
		}
		//构造一个私有的构造方法
		private AdminMgr() {}
		//得到StudentMgr
		public static AdminMgr getInstance() {
			return am;
		}
		//设置DAO
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
