package kr.co.hjit;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.util.CellRangeAddress;


public class ExcelFunction {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public HSSFCell workingStatus(HSSFSheet sheet, ArrayList<VisitVO> list){	
		logger.info("workingStatus");	
		//본선작업상황
		HSSFRow row0 = sheet.createRow(0);
		HSSFRow row1 = sheet.createRow(1);
		HSSFCell cell = null;
		
		sheet.addMergedRegion(new CellRangeAddress(1, 3, 0, 0));    // 이름
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 1, 1));    // 생년월일
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 2, 2));    // 연락처
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 3, 4));    // 이메일
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 5, 6));    // 동의여부
		sheet.addMergedRegion(new CellRangeAddress(2, 3, 5, 5));    // 입력일자
		
		cell = row0.createCell(0);
		cell.setCellValue("이름");
		cell = row0.createCell(1);
		cell.setCellValue("생년월일");
		cell = row0.createCell(2);
		cell.setCellValue("연락처");
		cell = row0.createCell(3);
		cell.setCellValue("이메일");
		cell = row0.createCell(4);
		cell.setCellValue("동의여부");
		cell = row0.createCell(4);
		cell.setCellValue("입력일자");

		// 조회내용
		VisitVO bean = new VisitVO();
		
		for(int a=0; a<list.size(); a++){
			bean = list.get(a);
			// 엑셀 데이터 입력

			
			for(int d=0; d<14; d++){
				cell = row1.createCell(d);	

				cell.setCellValue(d+1);
				
				if(d==0){					
					System.out.println("name : " + bean.getEdu_name());
					cell.setCellValue(bean.getEdu_name());
				}	
				if(d==1){
					cell.setCellValue(bean.getEdu_birth());					
				}	
				if(d==2){
					cell.setCellValue(bean.getEdu_phone());					
				}	
				if(d==3){	
					cell.setCellValue(bean.getEdu_mail());				
				}	
				if(d==4){	
					cell.setCellValue(bean.getEdu_infochk());				
				}	
			}
		}
		
		return cell;
	}
	
}
