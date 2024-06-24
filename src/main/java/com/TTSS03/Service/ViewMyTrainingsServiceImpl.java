package com.TTSS03.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Repository.AppliedTrainingsFromTraineeRepository;
import com.TTSS03.Repository.NominateTrainingsRepository;
import com.TTSS03.Repository.ScheduleTrainingsRepository;
import com.TTSS03.Repository.SearchVenueRepository;
import com.TTSS03.Repository.ViewMyTrainingsRepository;
import com.TTSS03.utill.NominateTrainingsDto;

@Service
public class ViewMyTrainingsServiceImpl implements ViewMyTrainingsService {

	@Autowired
	private NominateTrainingsRepository nominateTrainingsRepository;

	@Autowired
	ViewMyTrainingsRepository ViewMyTrainingsRepo;

	@Autowired
	AppliedTrainingsFromTraineeRepository appliedTrainingsFromTraineeRepo;

	@Autowired
	ScheduleTrainingsRepository ScheduleTrainingsRepo;

	@Autowired
	SearchVenueRepository SearchVenueRepo;

    @PersistenceContext(unitName = "firstentityManagerFactoryBean")
	private EntityManager entityManager;

	@Override
	public List<ViewMyTrainings> findByTreasuryId(String treasuryid) {
		return ViewMyTrainingsRepo.findByTreasuryId(treasuryid);
	}

	@Override
	public List<String> findByTname(String appliedtype) {
		return ViewMyTrainingsRepo.findByTnameAppliedType(appliedtype);
	}

	@Override
	public List<String> findByTnameStatus(String status) {
		return ViewMyTrainingsRepo.findByTnameStatus(status);
	}

	@Override
	public List<Map<String, Object>> findDataByTid(String ref_planner_id, String appliedtype) {
		return ViewMyTrainingsRepo.findDataByTid(ref_planner_id, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findDataByVid(String vid, String appliedtype) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByVid(vid, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findDataByDistrict(String district_name, String appliedtype) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByDistrict(district_name, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findDataByDesgigantion(String designation, String appliedtype) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByDesgignation(designation, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findDataByVidStatus(String vid, String status) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByVidStatus(vid, status);
	}

	@Override
	public List<Map<String, Object>> findDataByDistrictStatus(String district_name, String status) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByDistrictStatus(district_name, status);
	}

	@Override
	public List<Map<String, Object>> findDataByDesgigantionStatus(String designation, String status) {
		// TODO Auto-generated method stub
		return ViewMyTrainingsRepo.findDataByDesgignationStatus(designation, status);
	}

	@Override
	public List<Map<String, Object>> findDataByTidVid(String ref_planner_id, String vid, String appliedtype) {
		return ViewMyTrainingsRepo.findDataByTidVid(ref_planner_id, vid, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findDataByTidVidDist(String ref_planner_id, String vid, String district_name,
			String appliedtype) {
		return ViewMyTrainingsRepo.findDataByTidVidDist(ref_planner_id, vid, district_name, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findTrainingById(String ref_planner_id, String vid, String district_name,
			String designation, String appliedtype) {
		return ViewMyTrainingsRepo.findTrainingById(ref_planner_id, vid, district_name, designation, appliedtype);
	}

	@Override
	public List<Map<String, Object>> findTrainingWithoutDesg(String ref_planner_id, String vid, String district_name,
			String appliedtype) {
		return ViewMyTrainingsRepo.findTrainingWithoutDesg(ref_planner_id, vid, district_name, appliedtype);
	}

	@Override
	public List<String> findDistrictByTid(String vid) {
		return ViewMyTrainingsRepo.findDistrictByTid(vid);
	}

	@Override
	public List<Map<String, Object>> findDataByTidStatus(String ref_planner_id, String status) {
		return ViewMyTrainingsRepo.findDataByTidStatus(ref_planner_id, status);
	}

	@Override
	public List<Map<String, Object>> findDataByTidVidStatus(String ref_planner_id, String vid, String status) {
		return ViewMyTrainingsRepo.findDataByTidVidStatus(ref_planner_id, vid, status);
	}

	@Override
	public List<Map<String, Object>> findDataByTidVidDistStatus(String ref_planner_id, String vid, String district_name,
			String status) {
		return ViewMyTrainingsRepo.findDataByTidVidDistStatus(ref_planner_id, vid, district_name, status);
	}

	@Override
	public List<Map<String, Object>> findTrainingStatusWithDesg(String ref_planner_id, String vid, String district_name,
			String designation, String status) {
		return ViewMyTrainingsRepo.findTrainingStatusWithDesg(ref_planner_id, vid, district_name, designation, status);
	}

	@Override
	public List<Map<String, Object>> findTrainingStatusWithoutDesg(String ref_planner_id, String vid,
			String district_name, String status) {
		return ViewMyTrainingsRepo.findTrainingStatusWithoutDesg(ref_planner_id, vid, district_name, status);
	}

	public List<Map<String, Object>> getCustomData() {
		List<Object[]> result = ViewMyTrainingsRepo.findCustomData();

		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("MobileNumber", row[5]);
			rowData.put("Designation", row[6]);
			rowData.put("DOB", row[7]);
			rowData.put("FullName", row[8]);
			rowData.put("SchoolUdiseCode", row[9]);
			rowData.put("District", row[10]);
			rowData.put("Applydate", row[11]);
			rowData.put("ResourceType", row[12]);
			rowData.put("RefPlannerId", row[13]);
			return rowData;
		}).collect(Collectors.toList());
	}

	// get waiting for approved list
	@Override
	public List<Map<String, Object>> getAppovedData() {
		List<Object[]> result = ViewMyTrainingsRepo.findApprovedData();
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("secondlevelapproval", row[5]);
			rowData.put("MobileNumber", row[6]);
			rowData.put("Designation", row[7]);
			rowData.put("DOB", row[8]);
			rowData.put("FullName", row[9]);
			rowData.put("SchoolUdiseCode", row[10]);
			rowData.put("District", row[11]);
			rowData.put("Applydate", row[12]);
			rowData.put("ResourceType", row[13]);
			rowData.put("RefPlannerId", row[14]);
			return rowData;
		}).collect(Collectors.toList());

	}

	// get waiting for rejected list
	@Override
	public List<Map<String, Object>> getRejectedData() {
		List<Object[]> result = ViewMyTrainingsRepo.findRejectedData();
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("Remarks", row[5]);
			rowData.put("MobileNumber", row[6]);
			rowData.put("Designation", row[7]);
			rowData.put("DOB", row[8]);
			rowData.put("FullName", row[9]);
			rowData.put("SchoolUdiseCode", row[10]);
			rowData.put("District", row[11]);
			rowData.put("Applydate", row[12]);
			rowData.put("ResourceType", row[13]);
			rowData.put("RefPlannerId", row[14]);
			return rowData;
		}).collect(Collectors.toList());

	}

	@Override
	@Transactional
	public void updateStatusToApproved(String treasuryId, String refPlannerId, String vid) {
		ViewMyTrainingsRepo.updateStatusByTreasuryId(treasuryId, refPlannerId, vid);
	}

	@Override
	@Transactional
	public void rejectStatusToApproved(String treasuryId, String refPlannerId) {
		ViewMyTrainingsRepo.rejectStatusByTreasuryId(treasuryId, refPlannerId);
	}

	// count waiting for approval list teachers
	@Override
	public long countWaitingForApprovalUsersList() {
		return ViewMyTrainingsRepo.countByStatusWaitingForApproval();
	}

	// count for approved list teachers
	@Override
	public long countApprovedUsersList() {
		return ViewMyTrainingsRepo.countByStatusAppoved();
	}

	@Override
	public long countRejectedUsersList() {
		return ViewMyTrainingsRepo.countByStatusRejected();
	}

	public void updateStatusAndRemarks(String treasuryId, String refPlannerIds, String vid, String remarks) {
		ViewMyTrainingsRepo.updateStatusAndRemarks(treasuryId, refPlannerIds, vid, remarks);
	}

	public void updateStatusAndRemarksForSecondLevelApproval(String treasuryId, String refPlannerIds, String vid,
			String secondlevelapproval) {
		ViewMyTrainingsRepo.updateStatusAndRemarksForSecondLevelApproval(treasuryId, refPlannerIds, vid,
				secondlevelapproval);
	}

	public void storeDataNominate(List<NominateTrainingsDto> selectedRowsData) {
		for (NominateTrainingsDto rowData : selectedRowsData) {
			NominateTrainings entity = new NominateTrainings();
			entity.setTreasuryid(rowData.getTreasuryid());
			entity.setRef_planner_id(rowData.getRef_planner_id());
			entity.setVenue_id(rowData.getVenue_id());
			entity.setMobilenumberteacher(rowData.getMobilenumberteacher());
			entity.setTeacher_name(rowData.getTeacher_name());
			entity.setDob(rowData.getDob());
			entity.setDistrict_name(rowData.getDistrict_name());
			entity.setSchool_name(rowData.getSchool_name());
			entity.setSchool_code(rowData.getSchool_code());
			entity.setDesignation(rowData.getDesignation());
			entity.setAppliedtype(rowData.getAppliedtype());

			entity.setTname(rowData.getTname());
			entity.setVenue_name(rowData.getVenue_name());
			entity.setVaddress(rowData.getVaddress());
			entity.setTmode(rowData.getTmode());
			entity.setTraining_start_dt(rowData.getTraining_start_dt());
			entity.setTraining_end_dt(rowData.getTraining_end_dt());
			entity.setTstarttime(rowData.getTstarttime());
			entity.setTendtime(rowData.getTendtime());
			entity.setCoordinatormobileno(rowData.getCoordinatormobileno());

			entity.setMaplocation(rowData.getMaplocation());
			entity.setTdescription(rowData.getTdescription());
			entity.setTagency(rowData.getTagency());
			entity.setResourcetype(rowData.getResourcetype());

			// Save to the database
			nominateTrainingsRepository.save(entity);
		}
	}

	// get self attended teachers list
//		@Override
//		public List<Map<String, Object>> getSelfAttendedData() {
//			List<Object[]> result = ViewMyTrainingsRepo.findSelfAttendedTeachersData();
//			return result.stream().map(row -> {
//				Map<String, Object> rowData = new HashMap<>();
//				rowData.put("TrainingName", row[0]);
//				rowData.put("TrainingMode", row[1]);
//				rowData.put("TreasuryId", row[2]);
//				rowData.put("Description", row[3]);
//				rowData.put("VenueName", row[3]);
//				rowData.put("vaddress", row[4]);
//				rowData.put("secondlevelapproval", row[5]);
//				rowData.put("MobileNumber", row[6]);
//				rowData.put("Designation", row[7]);
//				rowData.put("DOB", row[8]);
//				rowData.put("FullName", row[9]);
//				rowData.put("SchoolUdiseCode", row[10]);
//				rowData.put("District", row[11]);
//				rowData.put("Applydate", row[12]);
//				rowData.put("ResourceType", row[13]);
//				rowData.put("RefPlannerId", row[14]);
//				return rowData;
//			}).collect(Collectors.toList());
//
//		}

//		public List<Map<String, Object>> getSelfAttendedData() {
//			 return ViewMyTrainingsRepo.findSelfAttendedTeachersData();
//		 }
//		
	public List<NominateTrainings> getNominatedTrainings() {
		return nominateTrainingsRepository.findByAppliedtype("nominated");
	}
	// public List<Map<String, Object>> getNominateTeacher() {
//			 return ViewMyTrainingsRepo.findNominatedTrainings();
//		 }

	@Override
	public List<Map<String, Object>> getSelfTrainingsWaitingForApproval() {
		return ViewMyTrainingsRepo.findSelfAttendedTeachersData();
	}

	@Override
	public List<Map<String, Object>> getNominatedTrainingsWaitingForApproval() {
		return ViewMyTrainingsRepo.findNominatedTrainings();
	}

//		 public List<Map<String, Object>> getNominateTeacher() {
//				List<Object[]> resultNominate = ViewMyTrainingsRepo.findNominatedTrainings();
//		 
//				return resultNominate.stream().map(row -> {
//					Map<String, Object> rowData = new HashMap<>();
//					rowData.put("TreasuryId", row[0]);
//					rowData.put("Description", row[1]);
//					rowData.put("RefPlannerId", row[2]);
//					rowData.put("MobileNumber", row[3]);
//					rowData.put("Designation", row[4]);
//					rowData.put("DOB", row[5]);
//					rowData.put("TrainingName", row[6]);
//					rowData.put("TrainingMode", row[7]);
//					rowData.put("VenueName", row[8]);
//					rowData.put("vaddress", row[9]);
//					rowData.put("ResourceType", row[10]);
//					rowData.put("FullName", row[11]);
//					rowData.put("SchoolUdiseCode", row[12]);
//					rowData.put("District", row[13]);
//					rowData.put("Applydate", row[14]);
//
//					
//					return rowData;
//				}).collect(Collectors.toList());
//			}

	@Override
	@Transactional
	public void updateStatusToApprovedNomonate(String treasuryId, String refPlannerId) {
		nominateTrainingsRepository.updateStatusByTreasuryId(treasuryId, refPlannerId);

	}

	@Override
	public List<Map<String, Object>> findRejectedData() {
		return ViewMyTrainingsRepo.findRejectedTeachersData();
	}

	@Override
	public List<Map<String, Object>> findApprovedDataTeacher() {
		return ViewMyTrainingsRepo.findApprovedTeachersData();
	}

	@Override
	public List<Map<String, Object>> findApprovedDataTeacherTrainingVenueId(String trainingId, String venueId) {
		return ViewMyTrainingsRepo.findApprovedDataListTrainingVenueId(trainingId, venueId);
	}

	@Override
	public List<ViewMyTrainings> savemyTrainingsxyz(String treasuryid, String ref_planner_id, String venueid) {
		// Check if records exist with the given treasuryid, ref_planner_id, and venueid

		// Proceed to fetch training details
		List<Object[]> findTrainingDetails = ViewMyTrainingsRepo.findTrainingDetails(ref_planner_id, venueid,
				treasuryid);

		for (Object[] row : findTrainingDetails) {
			for (int i = 0; i < row.length; i++) {
				System.out.println("Index " + i + ": " + row[i]);
			}
			System.out.println(); // Add a newline to separate rows
		}

		// Process and save training details
		List<ViewMyTrainings> viewMyTrainingsList = new ArrayList<>();
		for (Object[] row : findTrainingDetails) {
			ViewMyTrainings viewMyTrainings = new ViewMyTrainings();
			viewMyTrainings.setVid((String) row[11]);
			viewMyTrainings.setRef_planner_id((String) row[0]);
			viewMyTrainings.setTreasuryid((String) row[17]);
			viewMyTrainings.setTname((String) row[1]);
			viewMyTrainings.setVname((String) row[15]);
			viewMyTrainings.setTmode((String) row[4]);
			viewMyTrainings.setTdescription((String) row[2]);
			viewMyTrainings.setStartdate((String) row[5]);
			viewMyTrainings.setEnddate((String) row[6]);
			viewMyTrainings.setVaddress((String) row[10]);
			viewMyTrainings.setVcontact((String) row[14] + " " + (String) row[13]);
			viewMyTrainings.setMaplocation((String) row[16]);
			viewMyTrainings.setResourcetype((String) row[7]);
			viewMyTrainings.setTagency((String) row[3]);
			viewMyTrainings.setTstarttime((String) row[8]);
			viewMyTrainings.setTendtime((String) row[9]);
			viewMyTrainings.setMobilenumberteacher((String) row[20]);
			viewMyTrainings.setDob((String) row[21]);
			viewMyTrainings.setDistrict_name((String) row[23]);
			viewMyTrainings.setSchool_code((String) row[22]);
			viewMyTrainings.setTeacher_name((String) row[19]);
			viewMyTrainings.setDesignation((String) row[18]);
			viewMyTrainings.setSchool_name((String) row[24]);

			// Set other fields based on your query

			viewMyTrainingsList.add(viewMyTrainings);

			System.out.println("list count: " + viewMyTrainingsList.size());
		}

		// Save the training details
		return ViewMyTrainingsRepo.saveAll(viewMyTrainingsList);
	}

	@Override
	public List<ViewMyTrainings> checkIfAlreadyAppliedTrainings(String treasuryId, String refPlannerIds) {
		List<ViewMyTrainings> trainings = ViewMyTrainingsRepo.findByTreasuryIdAndRefPlannerId(treasuryId,
				refPlannerIds);
		return trainings;
	}

	@Override
	public int countAppliedTrainings(String refPlannerId, String venueId) {
		return ViewMyTrainingsRepo.countAppliedTrainings(refPlannerId, venueId);
	}

	@Override
	public Map<String, String> getTeacherCounts(String refPlannerId, String venueId) {
		Map<String, String> teacherCounts = new HashMap<>();

		int totalApprovedTeachers = ViewMyTrainingsRepo.countApprovedTeachers(refPlannerId, venueId);
		int hmTeachers = ViewMyTrainingsRepo.countHMTeachers(refPlannerId, venueId);
		int allTeachers = ViewMyTrainingsRepo.countAllTeachers(refPlannerId, venueId);

		teacherCounts.put("Total_Approved_Teachers", totalApprovedTeachers + " nos");
		teacherCounts.put("HM", String.valueOf(hmTeachers) + " nos");
		teacherCounts.put("Teachers", String.valueOf(allTeachers) + " nos");

		return teacherCounts;
	}

	@Override
	public List<Map<String, Object>> filterBasedOnChange(String ref_planner_id, String vid, String district_name,
			String designation, String status, String appliedtype) {
		System.out.println("ref_planner_id: " + ref_planner_id + ", vid: " + vid + ", district_name: " + district_name
				+ ", designation: " + designation + ", appliedtype: " + appliedtype);

		// Create JPQL query string
		StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM mytrainings  WHERE ");

		// List to store conditions
		List<String> conditions = new ArrayList<>();

		// Append conditions for non-null parameters
		if (ref_planner_id != null && !ref_planner_id.isEmpty() && !"null".equals(ref_planner_id.toLowerCase())) {
			conditions.add("ref_planner_id = :ref_planner_id");
		}
		if (vid != null && !vid.isEmpty() && !"null".equals(vid.toLowerCase())) {
			conditions.add("vid = :vid");
		}
		if (district_name != null && !district_name.isEmpty() && !"null".equals(district_name.toLowerCase())) {
			conditions.add("district_name = :district_name");
		}
		if (designation != null && !designation.isEmpty() && !"null".equals(designation.toLowerCase())) {
			conditions.add("designation = :designation");
		}
		if (status != null && !status.isEmpty() && !"null".equals(status.toLowerCase())) {
			conditions.add("status = :status");
		}
		if (appliedtype != null && !appliedtype.isEmpty() && !"null".equals(appliedtype.toLowerCase())) {
			conditions.add("appliedtype = :appliedtype");
		}
		System.out.println(conditions);
		// Append the conditions to the JPQL query builder
		sqlBuilder.append(String.join(" AND ", conditions));
		System.out.println("SQL Query: " + sqlBuilder.toString());

		// Create the JPQL query
		Query query = entityManager.createNativeQuery(sqlBuilder.toString());
		// Set parameter values for non-null parameters
		if (ref_planner_id != null && !ref_planner_id.isEmpty() && !"null".equals(ref_planner_id.toLowerCase())) {
			query.setParameter("ref_planner_id", ref_planner_id);
		}
		if (vid != null && !vid.isEmpty() && !"null".equals(vid.toLowerCase())) {
			query.setParameter("vid", vid);
		}
		if (district_name != null && !district_name.isEmpty() && !"null".equals(district_name.toLowerCase())) {
			query.setParameter("district_name", district_name);
		}
		if (designation != null && !designation.isEmpty() && !"null".equals(designation.toLowerCase())) {
			query.setParameter("designation", designation);
		}
		if (status != null && !status.isEmpty() && !"null".equals(status.toLowerCase())) {
			query.setParameter("status", status);
		}
		if (appliedtype != null && !appliedtype.isEmpty() && !"null".equals(appliedtype.toLowerCase())) {
			query.setParameter("appliedtype", appliedtype);
		}

		// Execute the query
		@SuppressWarnings("unchecked")
		List<Object[]> results = query.getResultList();
		for (Object[] row : results) {
			System.out.println(Arrays.toString(row));
		}

		// Convert the list of results to a list of maps
		List<Map<String, Object>> convertedResults = results.stream().map(row -> {
			Map<String, Object> resultMap = new HashMap<>();
			for (int i = 0; i <= 30; i++) {
				resultMap.put(getKey(i), row[i]);
			}
			return resultMap;
		}).collect(Collectors.toList());

		// Return the converted results
		return convertedResults;
	}

	private String getKey(int index) {
		String[] keys = { "slno", "treasuryid", "ref_planner_id", "vid", "tname", "tdescription", "tagency", "tmode",
				"vname", "vaddress", "vcontact", "startdate", "enddate", "rejectedby", "maplocation",
				"applydateandtime", "resourcetype", "remarks", "", "", "status", "appliedtype", "mobilenumberteacher",
				"teacher_name", "dob", "district_name", "school_name", "school_code", "designation", "tstarttime",
				"tendtime" };
		return keys[index];
	}
}
