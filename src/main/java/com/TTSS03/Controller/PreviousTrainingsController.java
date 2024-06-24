package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.PreviousTrainings;
import com.TTSS03.Service.PreviousTrainingsService;

@RestController
@RequestMapping("/api")
public class PreviousTrainingsController {

	@Autowired
	PreviousTrainingsService previousTrainingsService;

	/**
	 * Saves previous training records.
	 * 
	 * @param previousTrainings List of previous training records to be saved
	 * @return ResponseEntity indicating the success of the operation
	 */
	@PostMapping("/save/previoustrainings")
	public ResponseEntity<PreviousTrainings> savePreviousTrainings(
			@RequestBody List<PreviousTrainings> previousTrainings) {
		PreviousTrainings saveonetraining = previousTrainingsService.saveonetraining(previousTrainings);
		return ResponseEntity.ok(saveonetraining);
	}

	/**
	 * Retrieves previous training details for a given treasury ID.
	 * 
	 * @param treasuryId The treasury ID for which to retrieve previous training
	 *                   details
	 * @return ResponseEntity containing the list of previous training details
	 */
	@GetMapping("/training/previous")
	public ResponseEntity<List<PreviousTrainings>> getPreviousTrainingDetails(@RequestParam String treasuryId) {
		List<PreviousTrainings> allPreviousData = previousTrainingsService.getAllPreviousData(treasuryId);
		return new ResponseEntity<List<PreviousTrainings>>(allPreviousData, HttpStatus.OK);

	}

}
