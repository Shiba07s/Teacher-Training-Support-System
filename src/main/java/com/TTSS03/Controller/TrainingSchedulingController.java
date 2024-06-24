package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TrainingScheduling;
import com.TTSS03.Service.TrainingSchedulingService;

@RestController
@RequestMapping("/api")
public class TrainingSchedulingController {

	@Autowired
	private TrainingSchedulingService trainingSchedulingService;

	/**
	 * Schedule a new training.
	 * 
	 * @param trainingScheduling The training scheduling object to be created
	 * @return ResponseEntity containing the created training scheduling and HTTP
	 *         status OK
	 */
	@PostMapping("/schedule/training")
	public ResponseEntity<TrainingScheduling> scheduleOneTraining(@RequestBody TrainingScheduling trainingScheduling) {
		TrainingScheduling createTraining = trainingSchedulingService.createTraining(trainingScheduling);
		return ResponseEntity.ok(createTraining);
	}

	/**
	 * Retrieves all scheduled trainings.
	 * 
	 * @return ResponseEntity containing a list of all scheduled trainings and HTTP
	 *         status OK
	 */
	@GetMapping("/schedule/training/all")
	public ResponseEntity<List<TrainingScheduling>> getAllScheduleTrainings() {
		List<TrainingScheduling> allScheduleTrainings = trainingSchedulingService.findAllScheduleTrainings();
		return ResponseEntity.ok(allScheduleTrainings);
	}

	/**
	 * Retrieves scheduled training by ID.
	 * 
	 * @param ref_planner_id The ID of the training scheduling to retrieve
	 * @return ResponseEntity containing the retrieved training scheduling and HTTP
	 *         status OK
	 */
	@GetMapping("/schedule/training/byId")
	public ResponseEntity<TrainingScheduling> getAllScheduleTrainingsById(@RequestParam String ref_planner_id) {
		TrainingScheduling allScheduleTrainings = trainingSchedulingService
				.findAllScheduleTrainingsById(ref_planner_id);
		return ResponseEntity.ok(allScheduleTrainings);
	}

	/**
	 * Checks if a scheduled training is present or not.
	 * 
	 * @param ref_planner_id The ID of the training scheduling to check
	 * @return ResponseEntity containing true if present, false otherwise, and HTTP
	 *         status OK
	 */
	@GetMapping("/schedule/trainings/byId")
	public ResponseEntity<Boolean> checkIfPresentOrNot(@RequestParam String ref_planner_id) {
	    boolean allScheduleTrainings = trainingSchedulingService.existOrNot(ref_planner_id);
	    return ResponseEntity.ok(allScheduleTrainings);
	}
}
