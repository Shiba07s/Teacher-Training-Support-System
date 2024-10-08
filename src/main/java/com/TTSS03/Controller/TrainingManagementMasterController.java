package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TrainingManagementMaster;
import com.TTSS03.Service.TrainingManagementMasterService;

@RestController
@RequestMapping("/api")
public class TrainingManagementMasterController {

	@Autowired
	TrainingManagementMasterService TrainingManagementMasterservice;

	/**
	 * Retrieves all training managements.
	 * 
	 * @return ResponseEntity containing a list of TrainingManagementMaster objects
	 *         and HTTP status OK
	 */
	@GetMapping("/Allmanagement")
	public ResponseEntity<List<TrainingManagementMaster>> findAllManagement() {
		List<TrainingManagementMaster> findAllManagement = TrainingManagementMasterservice.findAllManagement();
		return ResponseEntity.ok(findAllManagement);
	}

	/**
	 * Adds a new training management.
	 * 
	 * @param TrainingManagementmaster The TrainingManagementMaster object to be
	 *                                 added
	 * @return ResponseEntity containing the added TrainingManagementMaster object
	 *         and HTTP status OK
	 */
	@PostMapping("/add/Management")
	public ResponseEntity<TrainingManagementMaster> addOnecategory(
			@RequestBody TrainingManagementMaster TrainingManagementmaster) {
		TrainingManagementMaster saveOneManagement = TrainingManagementMasterservice
				.saveOneManagement(TrainingManagementmaster);
		return ResponseEntity.ok(saveOneManagement);
	}

	/**
	 * Updates an existing training management.
	 * 
	 * @param management_code The unique identifier of the training management to be
	 *                        updated
	 * @param management_name The updated training management name
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@PutMapping("/updateTrainingManagement/{management_code}")
	public ResponseEntity<String> updateTrainingCategory(@PathVariable("management_code") long management_code,
			@RequestParam("management_name") String management_name) {

		try {
			TrainingManagementMasterservice.updateManagement(management_code, management_name);
			return ResponseEntity.ok("Training management updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training management: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a training management.
	 * 
	 * @param management_code The unique identifier of the training management to be
	 *                        deactivated
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@DeleteMapping("/delete/management/{management_code}")
	public ResponseEntity<String> deActivatemanagementType(@PathVariable long management_code) {
		try {
			TrainingManagementMasterservice.deActivateManagement(management_code);
			return ResponseEntity.ok("Management De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training management:" + e.getMessage());
		}
	}

	/**
	 * Finds a training management by its unique identifier.
	 * 
	 * @param management_code The unique identifier of the training management to be
	 *                        found
	 * @return ResponseEntity containing the TrainingManagementMaster object and
	 *         HTTP status OK
	 */
	@GetMapping("/getbymanagementCodeid/{management_code}")
	public ResponseEntity<TrainingManagementMaster> getMnagementcodebyId(
			@PathVariable("management_code") long management_code) {
		TrainingManagementMaster management = TrainingManagementMasterservice.findById(management_code);
		return ResponseEntity.ok(management);
	}

}