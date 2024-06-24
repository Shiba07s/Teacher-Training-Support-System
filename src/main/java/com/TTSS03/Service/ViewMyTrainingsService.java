package com.TTSS03.Service;

import java.util.List;
import java.util.Map;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.utill.NominateTrainingsDto;

public interface ViewMyTrainingsService {

	// List<ViewMyTrainings> savemyTrainings(String treasuryid);

	List<ViewMyTrainings> savemyTrainingsxyz(String treasuryid, String ref_planner_id, String venueid);

	List<ViewMyTrainings> findByTreasuryId(String treasuryid);

	List<Map<String, Object>> getCustomData();

	List<Map<String, Object>> getAppovedData();

	List<Map<String, Object>> getRejectedData();

	void updateStatusToApproved(String treasuryId, String refPlannerId, String vid);

	void rejectStatusToApproved(String treasuryId, String refPlannerId);

	long countWaitingForApprovalUsersList();

	List<Map<String, Object>> findApprovedDataTeacherTrainingVenueId(String trainingId, String venueId);

	long countApprovedUsersList();

	long countRejectedUsersList();

	void updateStatusAndRemarks(String treasuryId, String refPlannerIds, String vid, String remarks);

	void updateStatusAndRemarksForSecondLevelApproval(String treasuryId, String refPlannerIds, String vid,
			String secondlevelapproval);

	void storeDataNominate(List<NominateTrainingsDto> selectedRowsData);

//	List<Map<String, Object>> getSelfAttendedData();

	List<NominateTrainings> getNominatedTrainings();

	// List<Map<String, Object>> getNominateTeacher();

	List<Map<String, Object>> getSelfTrainingsWaitingForApproval();

	List<Map<String, Object>> getNominatedTrainingsWaitingForApproval();

	void updateStatusToApprovedNomonate(String treasuryId, String refPlannerId);

	List<Map<String, Object>> findRejectedData();

	List<Map<String, Object>> findApprovedDataTeacher();

	List<ViewMyTrainings> checkIfAlreadyAppliedTrainings(String treasuryId, String refPlannerIds);

	int countAppliedTrainings(String refPlannerId, String venueId);

	Map<String, String> getTeacherCounts(String refPlannerId, String venueId);
	
	
	List<String> findByTname(String appliedtype);
	
	List<String> findByTnameStatus(String status);



	List<Map<String, Object>> findDataByTid(String ref_planner_id, String appliedtype);

	List<Map<String, Object>> findDataByTidVid(String ref_planner_id, String vid, String appliedtype);

	List<Map<String, Object>> findDataByTidVidDist(String ref_planner_id, String vid, String district_name,
			String appliedtype);
	List<Map<String, Object>> findTrainingById(String ref_planner_id, String vid, String district_name, String designation,String appliedtype);
	
	List<Map<String, Object>> findTrainingWithoutDesg(String ref_planner_id, String vid, String district_name,String appliedtype);

	
	
	List<String> findDistrictByTid(String vid);
	
	
	
	List<Map<String, Object>> findDataByTidStatus(String ref_planner_id, String status);

	List<Map<String, Object>> findDataByTidVidStatus(String ref_planner_id, String vid, String status);

	List<Map<String, Object>> findDataByTidVidDistStatus(String ref_planner_id, String vid, String district_name,
			String status);
	List<Map<String, Object>> findTrainingStatusWithDesg(String ref_planner_id, String vid, String district_name,
			String designation, String status);
	List<Map<String, Object>> findTrainingStatusWithoutDesg(String ref_planner_id, String vid, String district_name,
			String status);

	List<Map<String, Object>> findDataByVid(String vid, String appliedtype);

	List<Map<String, Object>> findDataByDistrict(String district_name, String appliedtype);

	List<Map<String, Object>> findDataByDesgigantion(String designation, String appliedtype);

	List<Map<String, Object>> findDataByVidStatus(String vid, String status);

	List<Map<String, Object>> findDataByDistrictStatus(String district_name, String status);

	List<Map<String, Object>> findDataByDesgigantionStatus(String designation, String status);

	List<Map<String, Object>> filterBasedOnChange(String ref_planner_id, String vid, String district_name,
			String designation,String status, String appliedtype);

}
