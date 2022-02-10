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
    	//요청시간을 Date로 parsing 후 time가져오기
    	Date reqDate;
		try {
			reqDate = dateFormat.parse(reqDateStr);
			long reqDateTime = reqDate.getTime();
	    	//현재시간을 요청시간의 형태로 format 후 time 가져오기
	    	curDate = dateFormat.parse(dateFormat.format(curDate));
	    	long curDateTime = curDate.getTime();
	    	long minute = (curDateTime - reqDateTime) / 60000;
	    	String result;    	
	    	if(minute < 1) {
	    		result = "방금 전";
	    	}
	    	else if(minute < 60){
	    		result = minute + "분 전";
	    	}
	    	else if(minute < 1440) {
	    		result = (minute / 60) + "시간 전";
	    	}
	    	else if(minute < 43200) {
	    		result = (minute / 1440) + "일 전";
	    	}
	    	else {
	    		result = "1달 전";
	    	}
	    	return result;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
