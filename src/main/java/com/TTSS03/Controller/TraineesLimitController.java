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
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Service.TraineesLimitService;

@RestController
@RequestMapping("/api")
public class TraineesLimitController {

	@Autowired
	private TraineesLimitService traineesLimitService;

	/**
	 * Retrieves all trainee limit data.
	 * 
	 * @return ResponseEntity containing a list of TraineesLimit objects and HTTP
	 *         status OK
	 */
	@GetMapping("/traineeLimit")
	public ResponseEntity<List<TraineesLimit>> getAllTraineeData() {
		List<TraineesLimit> allData = traineesLimitService.getAllTraineesLimit();
		return new ResponseEntity<List<TraineesLimit>>(allData, HttpStatus.OK);
	}

	/**
	 * Creates a new trainee limit entry.
	 * 
	 * @param traineesLimit The TraineesLimit object to be created
	 * @return ResponseEntity containing the created TraineesLimit object and HTTP
	 *         status OK
	 */
	@PostMapping("/create/traineeLimit")
	public ResponseEntity<TraineesLimit> createTraineesLimit(@RequestBody TraineesLimit traineesLimit) {
		TraineesLimit saveOneVendorLimit = traineesLimitService.saveOneTraineesLimit(traineesLimit);
		return ResponseEntity.ok(saveOneVendorLimit);
	}

	/**
	 * Updates an existing trainee limit entry.
	 * 
	 * @param sl            The serial number of the trainee limit entry to be
	 *                      updated
	 * @param traineesLimit The updated TraineesLimit object
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@PutMapping("/updateTraineesLimit/{sl}")
	public ResponseEntity<String> updateVendorLimit(@PathVariable long sl, @RequestBody TraineesLimit traineesLimit) {
		try {
			traineesLimitService.updateTraineesLimit(sl, traineesLimit);
			return new ResponseEntity<>("TraineesLimit updated successfully", HttpStatus.OK);
		} catch (Exception e) {
			// Log the exception or handle it accordingly
			return new ResponseEntity<>("Failed to update TraineesLimit", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Deactivates a trainee limit entry.
	 * 
	 * @param sl The serial number of the trainee limit entry to be deactivated
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@DeleteMapping("/deleteTraineesLimit/{sl}")
	public ResponseEntity<String> deActivateVendorLimit(@PathVariable long sl) {

		try {
			traineesLimitService.deActivateTraineesLimit(sl);
			return ResponseEntity.ok("TraineesLimit   De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating TraineesLimit  :" + e.getMessage());
		}
	}

	/**
	 * Finds a trainee limit entry by serial number.
	 * 
	 * @param sl The serial number of the trainee limit entry to be found
	 * @return ResponseEntity containing the TraineesLimit object and HTTP status OK
	 */
	@GetMapping("/getbyTraineesLimitid/{sl}")
	public ResponseEntity<TraineesLimit> findTraineesLimit(@PathVariable("sl") long sl) {

		TraineesLimit traineeLimit = traineesLimitService.getTraineesLimit(sl);
		return ResponseEntity.ok(traineeLimit);
	}

}
