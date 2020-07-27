package com.wangxinwei.dao;

import java.sql.Timestamp;
import com.wangxinwei.model.*;

public interface TimeDAO {

	boolean setTime(Timestamp startTime, Timestamp endTime);

	void getTime(Time time);

}
