package model.postInfo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class CalcDateDiff {
	private String reqDateStr;	
	
	public String getReqDateStr() {
		return reqDateStr;
	}
	public void setReqDateStr(String reqDateStr) {
		this.reqDateStr = reqDateStr;
	}

	public String Calc(String reqDateStr) {
		Date curDate = new Date();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	//��û�ð��� Date�� parsing �� time��������
    	Date reqDate;
		try {
			reqDate = dateFormat.parse(reqDateStr);
			long reqDateTime = reqDate.getTime();
	    	//����ð��� ��û�ð��� ���·� format �� time ��������
	    	curDate = dateFormat.parse(dateFormat.format(curDate));
	    	long curDateTime = curDate.getTime();
	    	long minute = (curDateTime - reqDateTime) / 60000;
	    	String result;    	
	    	if(minute < 1) {
	    		result = "��� ��";
	    	}
	    	else if(minute < 60){
	    		result = minute + "�� ��";
	    	}
	    	else if(minute < 1440) {
	    		result = (minute / 60) + "�ð� ��";
	    	}
	    	else if(minute < 43200) {
	    		result = (minute / 1440) + "�� ��";
	    	}
	    	else {
	    		result = "1�� ��";
	    	}
	    	return result;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
