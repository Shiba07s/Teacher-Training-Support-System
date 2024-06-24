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

import com.TTSS03.Entity.AgencyMaster;
import com.TTSS03.Service.AgencyMasterService;

@RestController
@RequestMapping("/api")
public class AgencyMasterController {

	@Autowired
	AgencyMasterService agencyMasterService;

	/**
	 * Retrieves all agencies.
	 * 
	 * @return ResponseEntity containing a list of all agencies
	 */
	@GetMapping("/agency")
	public ResponseEntity<List<AgencyMaster>> findAllAgency() {
		List<AgencyMaster> allAgency = agencyMasterService.getAllAgencyy();
		return ResponseEntity.ok(allAgency);

	}

	/**
	 * Retrieves an agency by its serial number.
	 * 
	 * @param slno The serial number of the agency to retrieve
	 * @return ResponseEntity containing the requested agency
	 */
	@GetMapping("/getbyid/{slno}")
	public ResponseEntity<AgencyMaster> findAgency(@PathVariable("slno") int slno) {
		AgencyMaster agency = agencyMasterService.findAgency(slno);
		return ResponseEntity.ok(agency);
	}

	/**
	 * Creates a new training agency.
	 * 
	 * @param agencyMaster The details of the agency to create
	 * @return ResponseEntity containing the newly created agency
	 */
	@PostMapping("/agency/create")
	public ResponseEntity<AgencyMaster> createOneTrainingAgency(@RequestBody AgencyMaster agencyMaster) {
		AgencyMaster saveOneTrainingAgency = agencyMasterService.saveAgency(agencyMaster);
		return ResponseEntity.ok(saveOneTrainingAgency);

	}

	/**
	 * Updates the name of a training agency.
	 * 
	 * @param slno   The serial number of the agency to update
	 * @param agency The new name of the agency
	 * @return ResponseEntity indicating the success or failure of the update
	 *         operation
	 */
	@PutMapping("/update/{slno}")
	public ResponseEntity<String> update(@PathVariable("slno") int slno, @RequestParam("agency") String agency) {

		try {
			System.out.println(slno + " " + agency);
			agencyMasterService.updateAgency(slno, agency);
			return ResponseEntity.ok("Training category updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training category: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a training agency.
	 * 
	 * @param slno The serial number of the agency to deactivate
	 * @return ResponseEntity indicating the success or failure of the deactivation
	 *         operation
	 */
	@DeleteMapping("/agency/delete/{slno}")
	public ResponseEntity<String> deActivateCategory(@PathVariable("slno") int slno) {

		try {
			agencyMasterService.deActivateTrainingCategory(slno);
			return ResponseEntity.ok("Training Deleted Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training category:" + e.getMessage());
		}

	}

}