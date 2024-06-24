package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;
import com.TTSS03.Service.AppliedTrainingsFromTraineeService;

@RestController
@RequestMapping("/api")
public class AppliedTrainingsFromTraineeController {

	@Autowired
	AppliedTrainingsFromTraineeService appliedTrainingsFromTraineeService;

	/**
	 * Saves a single training record.
	 * 
	 * @param appliedTrainingsFromTrainee The details of the training to save
	 * @return ResponseEntity containing the saved training record
	 */
	@PostMapping("/savetrainings")
	public ResponseEntity<AppliedTrainingsFromTrainee> saveOneTraining(
			@RequestBody AppliedTrainingsFromTrainee appliedTrainingsFromTrainee) {
		AppliedTrainingsFromTrainee saveEmployeeTrainings = appliedTrainingsFromTraineeService
				.saveEmployeeTrainings(appliedTrainingsFromTrainee);

		return ResponseEntity.ok(saveEmployeeTrainings);
	}

}
