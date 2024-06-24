package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Service.ViewMyTrainingsService;
import com.TTSS03.utill.NominateTrainingsDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api")
public class ViewMyTrainingsController {
	private static final Logger logger = LoggerFactory.getLogger(ViewMyTrainingsController.class);

	@Autowired
	ViewMyTrainingsService viewMyTrainingsService;

	/**
	 * Retrieves all trainings associated with a specific treasury ID.
	 * 
	 * @param treasuryId The ID of the treasury
	 * @return ResponseEntity containing a list of training objects and HTTP status
	 *         OK if successful
	 */
	@GetMapping("/mytrainings")
	public ResponseEntity<List<ViewMyTrainings>> allMyTrainings(@RequestParam String treasuryId) {
		List<ViewMyTrainings> mytrainings = viewMyTrainingsService.findByTreasuryId(treasuryId);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training names based on the applied type.
	 * 
	 * @param appliedtype The type of training application
	 * @return ResponseEntity containing a list of training names and HTTP status OK
	 *         if successful
	 */
	@GetMapping("/mytrainings/tname")
	public ResponseEntity<List<String>> myTrainings(String appliedtype) {
		List<String> mytrainings = viewMyTrainingsService.findByTname(appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on treasury ID and applied type.
	 * 
	 * @param ref_planner_id The ID of the planner
	 * @param appliedtype    The type of training application
	 * @return ResponseEntity containing a list of training data and HTTP status OK
	 *         if successful
	 */
	@GetMapping("/mytrainings/tnamedata")
	public ResponseEntity<List<Map<String, Object>>> myTrainingsTnameData(@RequestParam String ref_planner_id,
			@RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTid(ref_planner_id, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Searches for training data by training name, vendor ID, and applied type.
	 * 
	 * @param ref_planner_id The ID of the planner
	 * @param vid            The ID of the vendor
	 * @param appliedtype    The type of training application
	 * @return ResponseEntity containing a list of training data and HTTP status OK
	 *         if successful
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevname")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByTnameVname(@RequestParam String ref_planner_id,
			@RequestParam String vid, @RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTidVid(ref_planner_id, vid,
				appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/filterbasedonchange")
	public ResponseEntity<List<Map<String, Object>>> filterBasedOnChange(@RequestParam String ref_planner_id,
			@RequestParam String vid, @RequestParam String district_name, @RequestParam String designation,
			@RequestParam String status, @RequestParam String appliedtype) {

		// Check and assign "Null" to empty or null parameters
		if (ref_planner_id == null || ref_planner_id.isEmpty()) {
			ref_planner_id = "null";
		}
		if (vid == null || vid.isEmpty()) {
			vid = "null";
		}
		if (district_name == null || district_name.isEmpty()) {
			district_name = "null";
		}
		if (designation == null || designation.isEmpty()) {
			designation = "null";
		}
		if (appliedtype == null || appliedtype.isEmpty()) {
			appliedtype = "null";
		}
		if (status == null || status.isEmpty()) {
			status = "null";
		}

		List<Map<String, Object>> mytrainings = viewMyTrainingsService.filterBasedOnChange(ref_planner_id, vid,
				district_name, designation, status, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbyvname")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByVname(@RequestParam String vid,
			@RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByVid(vid, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbydistrict")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByDistrict(@RequestParam String district_name,
			@RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByDistrict(district_name, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbydesignation")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByDesignation(@RequestParam String designation,
			@RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByDesgigantion(designation, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbyvnamestatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByVnameStatus(@RequestParam String vid,
			@RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByVidStatus(vid, status);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbydistrictstatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByDistrictStatus(@RequestParam String district_name,
			@RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByDistrictStatus(district_name, status);
		return ResponseEntity.ok(mytrainings);
	}

	@GetMapping("/mytrainings/searchtrainingbydesignationstatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByDesignationsStatus(
			@RequestParam String designation, @RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByDesgigantionStatus(designation,
				status);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Searches for training data by training name, vendor ID, district name, and
	 * applied type.
	 * 
	 * @param ref_planner_id The ID of the planner
	 * @param vid            The ID of the vendor
	 * @param district_name  The name of the district
	 * @param appliedtype    The type of training application
	 * @return ResponseEntity containing a list of training data and HTTP status OK
	 *         if successful
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevnamedist")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByTnameVnameDist(@RequestParam String ref_planner_id,
			@RequestParam String vid, @RequestParam String district_name, @RequestParam String appliedtype) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTidVidDist(ref_planner_id, vid,
				district_name, appliedtype);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on training ID, venue ID, district name,
	 * designation, applied type, and status.
	 * 
	 * @param ref_planner_id The training ID
	 * @param vid            The venue ID
	 * @param district_name  The district name
	 * @param designation    The designation
	 * @param appliedtype    The applied type
	 * @return ResponseEntity containing training data and HTTP status OK
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevnamedistdesg")
	public ResponseEntity<List<Map<String, Object>>> searchTraining(@RequestParam String ref_planner_id,
			@RequestParam String vid, @RequestParam String district_name, @RequestParam String designation,
			@RequestParam String appliedtype) {

		try {
			List<Map<String, Object>> mytrainings;

			if (designation == null || designation.isEmpty() || "null".equals(designation)) {
				mytrainings = viewMyTrainingsService.findTrainingWithoutDesg(ref_planner_id, vid, district_name,
						appliedtype);
			} else {
				// Call method findTrainingById if designation is provided
				mytrainings = viewMyTrainingsService.findTrainingById(ref_planner_id, vid, district_name, designation,
						appliedtype);
			}

			return ResponseEntity.ok(mytrainings);
		} catch (Exception e) {
			// Log the exception for debugging purposes
			logger.error("Error occurred while searching for training: " + e.getMessage(), e);
			// Return an error response with status code 500 (Internal Server Error)
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves district names associated with a specific venue id nad training id.
	 * 
	 * @param vid The venue ID
	 * @return ResponseEntity containing a list of district names and HTTP status OK
	 */
	@GetMapping("/mytrainings/tnamevenuedistrics")
	public ResponseEntity<List<String>> myTrainingsTnameDistrict(@RequestParam String vid) {
		List<String> mytrainings = viewMyTrainingsService.findDistrictByTid(vid);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training names associated with a specific status.
	 * 
	 * @param status The status
	 * @return ResponseEntity containing a list of training names and HTTP status OK
	 */
	@GetMapping("/mytrainings/tnamebystatus")
	public ResponseEntity<List<String>> myTrainingsByStatus(@RequestParam String status) {
		List<String> mytrainings = viewMyTrainingsService.findByTnameStatus(status);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on ref_planner_id and status.
	 * 
	 * @param ref_planner_id The training ID
	 * @param status         The status
	 * @return ResponseEntity containing training data and HTTP status OK
	 */
	@GetMapping("/mytrainings/tnamestatus")
	public ResponseEntity<List<Map<String, Object>>> myTrainingsTnameDataStatus(@RequestParam String ref_planner_id,
			@RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTidStatus(ref_planner_id, status);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on ref_planner_id, venue ID, and status.
	 * 
	 * @param ref_planner_id The training ID
	 * @param vid            The venue ID
	 * @param status         The status
	 * @return ResponseEntity containing training data and HTTP status OK
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevnamestatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByTnameVnamestatus(
			@RequestParam String ref_planner_id, @RequestParam String vid, @RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTidVidStatus(ref_planner_id, vid,
				status);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on ref_planner_id , venue ID, district name,
	 * and status.
	 * 
	 * @param ref_planner_id The training ID
	 * @param vid            The venue ID
	 * @param district_name  The district name
	 * @param status         The status
	 * @return ResponseEntity containing training data and HTTP status OK
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevnamediststatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByTnameVnameDiststatus(
			@RequestParam String ref_planner_id, @RequestParam String vid, @RequestParam String district_name,
			@RequestParam String status) {
		List<Map<String, Object>> mytrainings = viewMyTrainingsService.findDataByTidVidDistStatus(ref_planner_id, vid,
				district_name, status);
		return ResponseEntity.ok(mytrainings);
	}

	/**
	 * Retrieves training data based on training ID, venue ID, district name,
	 * designation, and status.
	 * 
	 * @param ref_planner_id The training ID
	 * @param vid            The venue ID
	 * @param district_name  The district name
	 * @param designation    The designation
	 * @param status         The status
	 * @return ResponseEntity containing training data and HTTP status OK
	 */
	@GetMapping("/mytrainings/searchtrainingtnamevnamedistdesgstatus")
	public ResponseEntity<List<Map<String, Object>>> searchTrainingByStatus(@RequestParam String ref_planner_id,
			@RequestParam String vid, @RequestParam String district_name, @RequestParam String designation,
			@RequestParam String status) {

		try {
			List<Map<String, Object>> mytrainings;

			if (designation == null || designation.isEmpty() || "null".equals(designation)) { // Call method
																								// findTrainingWithoutDesg
																								// if designation is
																								// null or contains
																								// "null"
				mytrainings = viewMyTrainingsService.findTrainingStatusWithoutDesg(ref_planner_id, vid, district_name,
						status);
			} else {
				// Call method findTrainingById if designation is provided
				mytrainings = viewMyTrainingsService.findTrainingStatusWithDesg(ref_planner_id, vid, district_name,
						designation, status);
			}

			return ResponseEntity.ok(mytrainings);
		} catch (Exception e) {
			// Log the exception for debugging purposes
			logger.error("Error occurred while searching for training: " + e.getMessage(), e);
			// Return an error response with status code 500 (Internal Server Error)
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves custom data for trainings waiting for approval.
	 * 
	 * @return ResponseEntity containing custom data and HTTP status OK
	 */
	@GetMapping("/waiting-for-approval")
	public ResponseEntity<List<Map<String, Object>>> getCustomData() {
		List<Map<String, Object>> customData = viewMyTrainingsService.getCustomData();
		return ResponseEntity.ok(customData);
	}

	// update the approved button(waiting for approval)
	/**
	 * Updates the status of a training to 'approved'.
	 * 
	 * @param treasuryId   The treasury ID
	 * @param refPlannerId The reference planner ID
	 * @param vid          The venue ID
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/update-status")
	public ResponseEntity<String> updateStatusToApproved(@RequestParam String treasuryId,
			@RequestParam String refPlannerId, @RequestParam String vid) {
		viewMyTrainingsService.updateStatusToApproved(treasuryId, refPlannerId, vid);
		return new ResponseEntity<>(
				"Status updated to 'approved' for treasuryId: " + treasuryId + ',' + refPlannerId + ',' + vid,
				HttpStatus.OK);
	}

	/**
	 * Updates the status of a training to 'reject'.
	 * 
	 * @param treasuryId   The treasury ID
	 * @param refPlannerId The reference planner ID
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/reject-status")
	public ResponseEntity<String> rejectStatusToApproved(@RequestParam String treasuryId,
			@RequestParam String refPlannerId) {
		viewMyTrainingsService.rejectStatusToApproved(treasuryId, refPlannerId);
		return new ResponseEntity<>("Status updated to 'reject' for treasuryId: " + treasuryId + ',' + refPlannerId,
				HttpStatus.OK);
	}

	/**
	 * Retrieves the count of teachers waiting for approval.
	 * 
	 * @return ResponseEntity containing the count and HTTP status OK
	 */
	@GetMapping("/count-waiting-for-approval")
	public ResponseEntity<Long> countWaitingForApprovalTeachers() {
		long countWaitingForApproval = viewMyTrainingsService.countWaitingForApprovalUsersList();
		return new ResponseEntity<Long>(countWaitingForApproval, HttpStatus.OK);

	}

	/**
	 * Retrieves the count of approved teachers.
	 * 
	 * @return ResponseEntity containing the count and HTTP status OK
	 */
	@GetMapping("/count-approved")
	public ResponseEntity<Long> countApprovedTeachers() {
		long countApproved = viewMyTrainingsService.countApprovedUsersList();
		return new ResponseEntity<Long>(countApproved, HttpStatus.OK);

	}

	/**
	 * Retrieves the count of rejected teachers.
	 * 
	 * @return ResponseEntity containing the count and HTTP status OK
	 */
	@GetMapping("/count-rejected")
	public ResponseEntity<Long> countRejectedTeachers() {
		long countRejected = viewMyTrainingsService.countRejectedUsersList();
		return new ResponseEntity<Long>(countRejected, HttpStatus.OK);

	}

	/**
	 * Updates the status and remarks of a training.
	 * 
	 * @param treasuryId    The treasury ID
	 * @param refPlannerIds The reference planner IDs
	 * @param vid           The venue ID
	 * @param remarks       The remarks
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/remarks")
	public ResponseEntity<String> updateStatusAndRemarks(@RequestParam String treasuryId,
			@RequestParam String refPlannerIds, @RequestParam String vid, @RequestParam String remarks) {
		try {
			viewMyTrainingsService.updateStatusAndRemarks(treasuryId, refPlannerIds, vid, remarks);
			return ResponseEntity.ok("Status and remarks updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating status and remarks: " + e.getMessage());
		}
	}

	/**
	 * Updates the status and remarks for second level approval of a training.
	 * 
	 * @param treasuryId          The treasury ID
	 * @param refPlannerIds       The reference planner IDs
	 * @param vid                 The venue ID
	 * @param secondlevelapproval The second level approval status
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/remarks-approval")
	public ResponseEntity<String> updateStatusAndRemarksForSecondLevelApproval(@RequestParam String treasuryId,
			@RequestParam String refPlannerIds, @RequestParam String vid, @RequestParam String secondlevelapproval) {
		try {
			viewMyTrainingsService.updateStatusAndRemarksForSecondLevelApproval(treasuryId, refPlannerIds, vid,
					secondlevelapproval);
			return ResponseEntity.ok("Status and remarks updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating status and remarks: " + e.getMessage());
		}
	}

	/**
	 * Stores data for nominated trainings.
	 * 
	 * @param selectedRowsData The selected rows data
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PostMapping("/localData")
	public ResponseEntity<String> storeData(@RequestBody List<NominateTrainingsDto> selectedRowsData) {
		try {
			viewMyTrainingsService.storeDataNominate(selectedRowsData);
			return ResponseEntity.ok("Data stored successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error storing data");
		}
	}

	/**
	 * Retrieves the list of self-attended teachers waiting for approval.
	 * 
	 * @return ResponseEntity containing the list of self-attended teachers and HTTP
	 *         status OK
	 */
	@GetMapping("/self-attended")
	public ResponseEntity<List<Map<String, Object>>> getSelfAttendedTeachersList() {
		List<Map<String, Object>> selfTrainingsWaitingForApproval = viewMyTrainingsService
				.getSelfTrainingsWaitingForApproval();
		return ResponseEntity.ok(selfTrainingsWaitingForApproval);
	}

	/**
	 * Retrieves the list of nominated trainings.
	 * 
	 * @return ResponseEntity containing the list of nominated trainings and HTTP
	 *         status OK
	 */
	@GetMapping("/nominated")
	public ResponseEntity<List<NominateTrainings>> getNominatedTrainings() {
		List<NominateTrainings> nominatedTrainings = viewMyTrainingsService.getNominatedTrainings();
		return new ResponseEntity<List<NominateTrainings>>(nominatedTrainings, HttpStatus.OK);
	}

	/**
	 * Retrieves the data for nominated teachers.
	 * 
	 * @return ResponseEntity containing the data for nominated teachers and HTTP
	 *         status OK
	 */
	@GetMapping("/nominate/training")
	public ResponseEntity<List<Map<String, Object>>> getNominateTeachersData() {
		List<Map<String, Object>> nominatedTrainingsWaitingForApproval = viewMyTrainingsService
				.getNominatedTrainingsWaitingForApproval();
		return ResponseEntity.ok(nominatedTrainingsWaitingForApproval);
	}

	/**
	 * Retrieves the list of rejected data.
	 * 
	 * @return ResponseEntity containing the list of rejected data and HTTP status
	 *         OK
	 */
	@GetMapping("/rejected-data")
	public ResponseEntity<List<Map<String, Object>>> getRejectedData() {
		List<Map<String, Object>> findRejectedData = viewMyTrainingsService.findRejectedData();
		return ResponseEntity.ok(findRejectedData);
	}

	/**
	 * Retrieves the list of approved data.
	 * 
	 * @return ResponseEntity containing the list of approved data and HTTP status
	 *         OK
	 */
	@GetMapping("/approved-data")
	public ResponseEntity<List<Map<String, Object>>> getApprovedData() {
		List<Map<String, Object>> findApprovedDataTeacher = viewMyTrainingsService.findApprovedDataTeacher();
		return ResponseEntity.ok(findApprovedDataTeacher);
	}

	/**
	 * Retrieves the list of approved data by training ID and venue ID.
	 * 
	 * @param trainingId The training ID
	 * @param venueId    The venue ID
	 * @return ResponseEntity containing the list of approved data and HTTP status
	 *         OK
	 */
	@GetMapping("/approvedData")
	public ResponseEntity<List<Map<String, Object>>> getApprovedDataTrainingVenueId(@RequestParam String trainingId,
			@RequestParam String venueId) {
		List<Map<String, Object>> approvedDataLists = viewMyTrainingsService
				.findApprovedDataTeacherTrainingVenueId(trainingId, venueId);
		return ResponseEntity.ok(approvedDataLists);
	}

	/**
	 * Processes data and returns the list of view my trainings.
	 * 
	 * @param treasuryId     The treasury ID
	 * @param ref_planner_id The reference planner ID
	 * @param venueid        The venue ID
	 * @return ResponseEntity containing the list of view my trainings and HTTP
	 *         status OK
	 */
	@PostMapping("/processData1234")
	public ResponseEntity<List<ViewMyTrainings>> processData123456(@RequestParam String treasuryId,
			@RequestParam String ref_planner_id, @RequestParam String venueid) {
		List<ViewMyTrainings> savemyTrainings1234 = viewMyTrainingsService.savemyTrainingsxyz(treasuryId,
				ref_planner_id, venueid);

		return ResponseEntity.ok(savemyTrainings1234);
	}

	/**
	 * Checks if the applied trainings exist.
	 * 
	 * @param treasuryId     The treasury ID
	 * @param ref_planner_id The reference planner ID
	 * @return ResponseEntity containing the list of applied trainings and HTTP
	 *         status OK
	 */
	@GetMapping("/HaveAnyTrainings")
	public ResponseEntity<List<ViewMyTrainings>> CheckAppliedTrainings(@RequestParam String treasuryId,
			@RequestParam String ref_planner_id) {

		List<ViewMyTrainings> trainings = viewMyTrainingsService.checkIfAlreadyAppliedTrainings(treasuryId,
				ref_planner_id);
		return ResponseEntity.ok(trainings);
	}

	/**
	 * Counts the applied trainings.
	 * 
	 * @param refPlannerId The reference planner ID
	 * @param venueId      The venue ID
	 * @return The count of applied trainings
	 */
	@GetMapping("/countVenueOnTrainings")
	public int countAppliedTrainings(@RequestParam String refPlannerId, @RequestParam String venueId) {
		return viewMyTrainingsService.countAppliedTrainings(refPlannerId, venueId);
	}

	/**
	 * Retrieves the counts of teachers.
	 * 
	 * @param refPlannerId The reference planner ID
	 * @param venueId      The venue ID
	 * @return ResponseEntity containing the teacher counts and HTTP status OK
	 */
	@GetMapping("/teacherCounts")
	public ResponseEntity<Map<String, String>> getTeacherCounts(@RequestParam String refPlannerId,
			@RequestParam String venueId) {
		Map<String, String> teacherCounts = viewMyTrainingsService.getTeacherCounts(refPlannerId, venueId);
		return ResponseEntity.ok(teacherCounts);
	}

}
