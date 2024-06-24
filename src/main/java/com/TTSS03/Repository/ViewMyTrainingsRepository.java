package com.TTSS03.Repository;

import java.util.List;

import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ViewMyTrainings;

public interface ViewMyTrainingsRepository extends JpaRepository<ViewMyTrainings, Integer> {

	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.treasuryid = :treasuryid")
	List<ViewMyTrainings> findByTreasuryId(@Param("treasuryid") String treasuryid);
	
	@Query("SELECT  distinct sv.tname,sv.ref_planner_id FROM ViewMyTrainings sv WHERE sv.appliedtype= :appliedtype")
	List<String> findByTnameAppliedType(@Param("appliedtype") String appliedtype);
	
	@Query("SELECT  distinct sv.tname,sv.ref_planner_id FROM ViewMyTrainings sv WHERE sv.status= :status")
	List<String> findByTnameStatus(@Param("status") String status);
	
	
	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByTid(@Param("ref_planner_id") String ref_planner_id, @Param("appliedtype") String appliedtype);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.vid = :vid AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByVid(@Param("vid") String vid, @Param("appliedtype") String appliedtype);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.district_name = :district_name AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByDistrict(@Param("district_name") String district_name, @Param("appliedtype") String appliedtype);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.designation = :designation AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByDesgignation(@Param("designation") String designation, @Param("appliedtype") String appliedtype);
	
	
	
	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByTidStatus(@Param("ref_planner_id") String ref_planner_id, @Param("status") String status);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.vid = :vid AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByVidStatus(@Param("vid") String vid, @Param("status") String status);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.district_name = :district_name AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByDistrictStatus(@Param("district_name") String district_name, @Param("status") String status);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.designation = :designation AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByDesgignationStatus(@Param("designation") String designation, @Param("status") String status);

	
	
	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByTidVid(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid, @Param("appliedtype") String appliedtype);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.district_name = :district_name AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findDataByTidVidDist(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid, @Param("district_name") String district_name, @Param("appliedtype") String appliedtype);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.district_name = :district_name AND sv.designation = :designation AND sv.appliedtype = :appliedtype", nativeQuery = true)
	List<Map<String, Object>> findTrainingById(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid,
			@Param("district_name") String district_name, @Param("designation") String designation,
			@Param("appliedtype") String appliedtype);
	
	
	
	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByTidVidStatus(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid, @Param("status") String status);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.district_name = :district_name AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findDataByTidVidDistStatus(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid, @Param("district_name") String district_name, @Param("status") String status);

	@Query(value = "SELECT * FROM mytrainings sv WHERE sv.ref_planner_id = :ref_planner_id AND sv.vid = :vid AND sv.district_name = :district_name AND sv.designation = :designation AND sv.status = :status", nativeQuery = true)
	List<Map<String, Object>> findTrainingStatusWithDesg(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid, @Param("district_name") String district_name, @Param("designation") String designation, @Param("status") String status);

	
	
	@Query("SELECT distinct sv.district_name FROM ViewMyTrainings sv WHERE sv.vid = :vid")
	List<String> findDistrictByTid(@Param("vid") String vid);
	

	
	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.ref_planner_id = :ref_planner_id and sv.vid = :vid and sv.district_name = :district_name and sv.appliedtype = :appliedtype")
	List<Map<String, Object>> findTrainingWithoutDesg(@Param("ref_planner_id") String ref_planner_id,@Param("vid") String vid,@Param("district_name") String district_name,@Param("appliedtype") String appliedtype);
	
		
	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.ref_planner_id = :ref_planner_id and sv.vid = :vid and sv.district_name = :district_name and sv.status = :status")
	List<Map<String, Object>> findTrainingStatusWithoutDesg(@Param("ref_planner_id") String ref_planner_id,@Param("vid") String vid,@Param("district_name") String district_name,@Param("status") String status);

	
	@Query("SELECT COUNT(t) FROM ViewMyTrainings t WHERE t.ref_planner_id = :refPlannerId AND t.vid = :venueId")
	int countAppliedTrainings(@Param("refPlannerId") String refPlannerId, @Param("venueId") String venueId);

	@Query("SELECT m FROM ViewMyTrainings m WHERE m.treasuryid = :treasuryid AND m.ref_planner_id = :ref_planner_id ")
	List<ViewMyTrainings> findByTreasuryIdAndRefPlannerId(@Param("treasuryid") String treasuryid,
			@Param("ref_planner_id") String ref_planner_id);

//	@Query("SELECT  mt.treasuryid,tm.tname, vm.vname, tm.tmode, tm.tdescription, tm.training_start_dt, tm.training_end_dt, vm.vaddress, vm.vcontactno, vm.vcontactmailid, vm.maplocation,tm.resourcetype "
//			+ "FROM AppliedTrainingsFromTrainee mt "
//			+ "JOIN ScheduleTrainings tm ON mt.ref_planner_id = tm.ref_planner_id "
//			+ "JOIN SearchVenue vm ON mt.venueid = vm.vid " + "WHERE mt.treasuryid = :treasuryid and mt.ref_planner_id = tm.ref_planner_id and mt.venueid = vm.vid")
//	List<Object[]> findTrainingDetailsByTreasuryId(@Param("treasuryid") String treasuryid );
//	

	// get Data for waiting-for-approval list
	@Query(value = "SELECT mt.tname, mt.tmode,  mt.treasuryid, mt.tdescription,mt.vaddress,tm.mobileno_teacher,tm.design,tm.dob,tm.teacher_name,tm.school_code,tm.district_name,mt.applydateandtime,mt.resourcetype, mt.ref_planner_id "
			+ "FROM mytrainings mt " + "JOIN tteacher_master_update tm ON mt.treasuryid = tm.treasuryid "
			+ "WHERE mt.status = 'waiting for approval'", nativeQuery = true)
	List<Object[]> findCustomData();

	// get Data for approved list
	@Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription,mt.vaddress, mt.secondlevelapproval ,tm.mobileno_teacher,tm.design,tm.dob,tm.teacher_name,tm.school_code,tm.district_name,mt.applydateandtime,mt.resourcetype,mt.ref_planner_id  "
			+ "FROM mytrainings mt " + "JOIN tteacher_master_update tm ON mt.treasuryid = tm.treasuryid "
			+ "WHERE mt.status ='approved'", nativeQuery = true)
	List<Object[]> findApprovedData();

	// get Data for rejected list
	@Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription, mt.vaddress, mt.remarks, "
			+ "tm.mobileno_teacher, tm.design, tm.dob, tm.teacher_name, tm.school_code, tm.district_name, "
			+ "mt.applydateandtime, mt.resourcetype, mt.ref_planner_id " + "FROM mytrainings mt "
			+ "JOIN tteacher_master_update tm ON mt.treasuryid = tm.treasuryid "
			+ "WHERE mt.status = 'rejected'", nativeQuery = true)
	List<Object[]> findRejectedData();

	@Modifying
	@Query("UPDATE ViewMyTrainings v SET v.status = 'approved' WHERE v.treasuryid = :treasuryId  AND v.ref_planner_id = :refPlannerId AND v.vid= :vid")
	void updateStatusByTreasuryId(@Param("treasuryId") String treasuryId, @Param("refPlannerId") String refPlannerId,
			@Param("vid") String vid);

	@Query("SELECT a FROM ViewMyTrainings a WHERE a.treasuryid = :treasuryid AND a.tname = :tname")
	List<ViewMyTrainings> findByTreasuryIdAndTname(@Param("treasuryid") String treasuryid,
			@Param("tname") String tname);

	@Modifying
	@Query("UPDATE ViewMyTrainings v SET v.status = 'rejected' WHERE v.treasuryid = :treasuryId  AND v.ref_planner_id = :refPlannerId")
	void rejectStatusByTreasuryId(@Param("treasuryId") String treasuryId, @Param("refPlannerId") String refPlannerId);

	//
	@Query("SELECT COUNT(e) FROM ViewMyTrainings e WHERE e.status = 'waiting for approval'")
	long countByStatusWaitingForApproval();

	//
	@Query("SELECT COUNT(e) FROM ViewMyTrainings e WHERE e.status = 'approved'")
	long countByStatusAppoved();

	@Query("SELECT COUNT(e) FROM ViewMyTrainings e WHERE e.status = 'rejected'")
	long countByStatusRejected();

	@Modifying
	@Transactional
	@Query("UPDATE ViewMyTrainings t SET t.status = 'rejected', t.remarks = :remarks WHERE t.treasuryid = :treasuryId AND t.ref_planner_id = :refPlannerIds AND t.vid= :vid")
	void updateStatusAndRemarks(@Param("treasuryId") String treasuryId, @Param("refPlannerIds") String refPlannerIds,
			@Param("vid") String vid, @Param("remarks") String remarks);

	@Modifying
	@Transactional
	@Query("UPDATE ViewMyTrainings m SET m.status = 'approved', m.secondlevelapproval = :secondlevelapproval WHERE m.treasuryid = :treasuryId AND m.ref_planner_id = :refPlannerIds AND m.vid= :vid ")
	void updateStatusAndRemarksForSecondLevelApproval(@Param("treasuryId") String treasuryId,
			@Param("refPlannerIds") String refPlannerIds, @Param("vid") String vid,
			@Param("secondlevelapproval") String secondlevelapproval);

	// self-attended trainees will show on waiting-for-approval radio button table
//	@Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription , mt.vname, mt.vaddress, mt.secondlevelapproval ,tm.mobileno_teacher,tm.design,tm.dob,tm.teacher_name,tm.school_code,tm.district_name,mt.applydateandtime,mt.resourcetype,mt.ref_planner_id "
//			+ "FROM mytrainings mt " + "JOIN tteacher_master_update tm ON mt.treasuryid = tm.treasuryid "
//			+ "WHERE mt.appliedtype ='self' AND mt.status='Waiting For Approval'", nativeQuery = true)
//	List<Map<String, Object>> findSelfAttendedTeachersData();

	// nominate trainees will show on waiting-for-approval radio button table
//	@Query(value = "SELECT mt.treasuryid, tm.tdescription, tm.ref_planner_id, mt.mobilenumberteacher, mt.designation, mt.dob, tm.tname, tm.tmode, tm.venue_name, tm.vaddress, tm.resourcetype, mt.teacher_name, mt.school_code, mt.district_name, mt.applydateandtime " +
//	        "FROM mytrainings mt " +
//	        "JOIN ttransactiontraining tm ON mt.ref_planner_id = tm.ref_planner_id " +
//	        "WHERE mt.appliedtype = 'Nominated' AND mt.status='Waiting For Approval'", nativeQuery = true)
//	List<Map<String, Object>> findNominatedTrainings();

	// nominate trainees will show on waiting-for-approval radio button table
	@Query(value = "SELECT * FROM mytrainings mt WHERE mt.appliedtype = 'Nominated' AND mt.status = 'Waiting For Approval'", nativeQuery = true)
	List<Map<String, Object>> findNominatedTrainings();

	// self-attended trainees will show on waiting-for-approval radio button table
	@Query(value = "SELECT * FROM mytrainings tm where tm.appliedtype='Self' and tm.status='waiting for approval' ;", nativeQuery = true)
	List<Map<String, Object>> findSelfAttendedTeachersData();

//	 
	@Query(value = "SELECT * FROM mytrainings mt WHERE mt.status = 'rejected'", nativeQuery = true)
	List<Map<String, Object>> findRejectedTeachersData();

	@Query(value = "SELECT * FROM mytrainings mt WHERE mt.status = 'approved'", nativeQuery = true)
	List<Map<String, Object>> findApprovedTeachersData();

//	@Query(value = "SELECT mt.treasuryid, tr.mobileno_teacher, tr.teacher_name, tr.design, tr.dob, tm.resourcetype, " +
//	        "tr.district_name, tr.school_code,tm.venue_id, tm.tname, tm.tmode, tm.tdescription,tm.venue_name, tm.vaddress, mt.ref_planner_id, " +
//	        "mt.appliedtype, mt.remarks, mt.applydateandtime " +
//	        "FROM mytrainings mt, ttransactiontraining tm, tteacher_master_update tr " +
//	        "WHERE tm.ref_planner_id = mt.ref_planner_id AND mt.treasuryid = tr.treasuryid " +
//	        "AND mt.status = 'approved'", nativeQuery = true)
//	List<Map<String, Object>>findApprovedDataList();

//	@Query(value = "SELECT mt.treasuryid, tr.mobileno_teacher, tr.teacher_name, tr.design, tr.dob, tm.resourcetype, " +
//	        "tr.district_name, tr.school_code,tm.venue_id, tm.tname, tm.tmode, tm.tdescription,tm.venue_name, tm.vaddress, mt.ref_planner_id, " +
//	        "mt.appliedtype, mt.remarks, mt.applydateandtime " +
//	        "FROM mytrainings mt, ttransactiontraining tm, tteacher_master_update tr " +
//	        "WHERE tm.ref_planner_id = mt.ref_planner_id AND mt.treasuryid = tr.treasuryid " +
//	        "AND mt.status = 'approved' AND tm.ref_planner_id = :refPlannerId AND tm.venue_id = :venueId", nativeQuery = true)
//	List<Map<String, Object>> findApprovedDataListTrainingVenueId(@Param("refPlannerId") String trainingId, @Param("venueId") String venueId);
//	    

	@Query(value = "SELECT * FROM mytrainings mt WHERE mt.status = 'approved' AND mt.ref_planner_id = :refPlannerId AND mt.vid = :venueId", nativeQuery = true)
	List<Map<String, Object>> findApprovedDataListTrainingVenueId(@Param("refPlannerId") String trainingId,
			@Param("venueId") String venueId);
	// NominateTrainings findByTreasuryidAndRefPlannerId(String treasuryid, String
	// ref_planner_id);

	@Query("SELECT tr.ref_planner_id, tr.tname, tr.tdescription, tr.tagency, tr.tmode, tr.training_start_dt, "
			+ "tr.training_end_dt,  tr.resourcetype,tr.tstarttime,tr.tendtime, "
			+ "vm.vaddress, vm.vid, vm.vcontactname, vm.vcontactmailid, vm.vcontactno, vm.vname , vm.maplocation, "
			+ "tm.treasuryid ,tm.designation ,tm.teacher_name, tm.mobilenumberteacher, tm.dob, tm.complex_code,tm.districtnamewrk ,tm.school_name "
			+ "FROM ScheduleTrainings tr, SearchVenue vm, TreasuryGovt1 tm "
			+ "WHERE (tr.ref_planner_id = :ref_planner_id) " + "AND (vm.vid = :vid) " + "AND (tr.venue_id = :vid) "
			+ "AND (tm.treasuryid = :treasuryid)")
	List<Object[]> findTrainingDetails(@Param("ref_planner_id") String ref_planner_id, @Param("vid") String vid,
			@Param("treasuryid") String treasuryid);

	@Query("SELECT COUNT(mt) FROM ViewMyTrainings mt WHERE mt.ref_planner_id = :refPlannerId AND mt.vid = :venueId AND mt.status = 'approved'")
	int countApprovedTeachers(@Param("refPlannerId") String refPlannerId, @Param("venueId") String venueId);

	@Query("SELECT COUNT(mt) FROM ViewMyTrainings mt WHERE (mt.designation LIKE '%head%' OR mt.designation LIKE '%princ%' OR mt.designation LIKE '%hm%') "
			+ "AND mt.ref_planner_id = :refPlannerId AND mt.vid = :venueId AND mt.status = 'approved'")
	int countHMTeachers(@Param("refPlannerId") String refPlannerId, @Param("venueId") String venueId);

	@Query("SELECT COUNT(mt) FROM ViewMyTrainings mt WHERE mt.ref_planner_id = :refPlannerId AND mt.vid = :venueId AND mt.status = 'approved'")
	int countAllTeachers(@Param("refPlannerId") String refPlannerId, @Param("venueId") String venueId);

}
