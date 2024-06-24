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

import com.TTSS03.Entity.StatusMaster;
import com.TTSS03.Service.StatusMasterService;

@RestController
@RequestMapping("/api")
public class StatusMasterController {

	@Autowired
	private StatusMasterService statusMasterService;

	/**
	 * Retrieves all status records.
	 * 
	 * @return ResponseEntity containing a list of all status records
	 */
	@GetMapping("/status")
	public ResponseEntity<List<StatusMaster>> findAllStatus() {
		List<StatusMaster> allStaus = statusMasterService.getAllStatus();
		return ResponseEntity.ok(allStaus);
	}

	/**
	 * Creates a new status record.
	 * 
	 * @param statusMaster The status information to be created
	 * @return ResponseEntity containing the created status record
	 */
	@PostMapping("/create/status")
	public ResponseEntity<StatusMaster> createOneStatus(@RequestBody StatusMaster statusMaster) {
		StatusMaster saveOneStatus = statusMasterService.saveOneStatus(statusMaster);
		return ResponseEntity.ok(saveOneStatus);

	}

	/**
	 * Updates the status name of a training status record.
	 * 
	 * @param statuscode The code of the status record to be updated
	 * @param statusname The new name for the status
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateTrainingStatus/{statuscode}")
	public ResponseEntity<String> updateTrainingStatus(@PathVariable("statuscode") long statuscode,
			@RequestParam("statusname") String statusname) {

		try {
			statusMasterService.updateTrainingStatus(statuscode, statusname);
			return ResponseEntity.ok("Training status updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training status: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a status record.
	 * 
	 * @param statuscode The code of the status record to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteStatus/{statuscode}")
	public ResponseEntity<String> deActivateStatus(@PathVariable long statuscode) {

		try {
			statusMasterService.deActivateTrainingStatus(statuscode);
			return ResponseEntity.ok("Training status De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training status:" + e.getMessage());
		}

	}

	/**
	 * Retrieves a status record by its code.
	 * 
	 * @param statuscode The code of the status record to retrieve
	 * @return ResponseEntity containing the status record
	 */
	@GetMapping("/getStatusCodeByid/{statuscode}")
	public ResponseEntity<StatusMaster> getMnagementcodebyId(@PathVariable("statuscode") long statuscode) {
		StatusMaster statusMaster = statusMasterService.findByStatusId(statuscode);
		return ResponseEntity.ok(statusMaster);
	}

}