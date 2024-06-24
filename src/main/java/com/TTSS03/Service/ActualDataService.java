package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.ActualData;

public interface ActualDataService {
	
	
	ActualData saveOneData(ActualData actualData);
	
	List<ActualData>getAll();
//	ActualData getDataById(int refplannerid);
	List<ActualData>getDataById(String refplannerid);
	
	List<ActualData> findByYearAndMonth(String tyear, String tmonth);
	
	ActualData updateOne(String refplannerid,ActualData actualData);
	
	public void deactivateTraining(String refplannerid);

	List<ActualData> getUnconfirmedData();

	void updateTrainingStatus(String refplannerid, String preferdlocation);

	void updateStatusAndRemarks(String refplannerid, String preferdlocation, String remarks);
	
	
	
	//void uploadAndStoreFile(MultipartFile file) throws IOException;

	//void save(MultipartFile file);
//	 void save(MultipartFile file);
//	 ByteArrayInputStream load();
//	 List<ActualData> getAllTutorials();
	//void processExcelFile(MultipartFile file) throws IOException ;
	
	

}
