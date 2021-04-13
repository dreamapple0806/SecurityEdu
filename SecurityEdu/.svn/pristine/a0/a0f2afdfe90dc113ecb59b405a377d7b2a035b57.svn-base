package kr.co.hjit;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface EduDAO {
	int eduInfoRegister(@Param("edu_name")String edu_name, @Param("edu_birth")String edu_birth, @Param("edu_phone")String edu_phone
			, @Param("edu_mail")String edu_mail, @Param("edu_infochk")String edu_infoChk) throws Exception;

	ArrayList<VisitVO> getList(@Param("edu_name")String name, @Param("symd")String symd, @Param("eymd")String eymd);
}
