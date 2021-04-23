package kr.co.hjit;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("eduService")
public class EduServiceImpl implements EduDAO{
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
	@Autowired
	private EduDAO eduDAO;

	@Override
	public int eduInfoRegister(String edu_name, String edu_birth, String edu_phone, String edu_mail, String edu_infoChk)
			throws Exception {
		try {
			eduDAO.eduInfoRegister(edu_name, edu_birth, edu_phone, edu_mail, edu_infoChk);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;	
	}

	@Override
	public ArrayList<VisitVO> getList(String name, String symd, String eymd) {
		logger.info("getList");
		
		return eduDAO.getList(name, symd, eymd);	
	}


}
