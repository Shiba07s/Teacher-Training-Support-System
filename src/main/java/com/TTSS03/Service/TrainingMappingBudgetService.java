package com.TTSS03.Service;

import java.util.List;
import java.util.Map;
import com.TTSS03.Entity.TrainingMappingBudget;

public interface TrainingMappingBudgetService {
	
	List<TrainingMappingBudget> findDistinctTrainingAndVenue();

	
	
	
	 List<TrainingMappingBudget> findDistinctTrainingTransactions();
	 List<TrainingMappingBudget> getAllMappingData(  String trainingid,String venueid);
	 
	List<TrainingMappingBudget> getAllMappingData1(String trainingid, String venueid);
	
	List<TrainingMappingBudget> getMappingDataOnTrainingidAndVenueid(String trainingid,String venueid);
	//void updateTrainingMappingBudget(String trainingid, String venueid, TrainingMappingBudget trainingMappingBudget) ;
	//void updateAllMappings(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) ;
	
	void updateSingleMapping(String trainingid, String venueid, List<TrainingMappingBudget> updatedMapping) ;
	void updateAllMappings(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings);
	void updaterecordstatusSecondlevel(String trainingid, String venueid,TrainingMappingBudget trainingMappingBudget) ;	
	void updatestatus(String trainingid, String venueid);
	
	void updaterecordstatusSecondlevel(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappingss) ;
	
	List<TrainingMappingBudget> findByMappingId(long mid) ;
	
	void updateTrainingMappingBudgetByid(long mid, TrainingMappingBudget trainingMappingBudget)  ;
	
//	List<TrainingMappingBudget> getAllMappingDataSecondLevel() ;
	
	List<Map<String, Object>> findDistinctByTrainingIdAndVenueId(String trainingId, String venueId);
	
	List<Map<String, Object>> findDistinctEntries(String trainingId, String venueId);
	List<Map<String, Object>> findDistinctEntriesAll();
	
	List<TrainingMappingBudget> findFirstLevelApproval(String trainingid, String venueid);
	List<TrainingMappingBudget> findSecondLevelApproval();
	
	List<String>findAllDistinctVenues(String trainingid);
    List<String> findDistinctTrainings();
}
