package com.wangxinwei.dao;

import com.wangxinwei.Mgr.*;
import com.wangxinwei.model.Admin;

public interface AdminDAO {
	public Admin validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException;

	public void updatePasssword(Admin admin, String newPassword1) throws UserNotFoundException;
}
