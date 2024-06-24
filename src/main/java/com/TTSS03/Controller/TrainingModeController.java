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

import com.TTSS03.Entity.TrainingMode;
import com.TTSS03.Service.TrainingModeService;

@RestController
@RequestMapping("/api")
public class TrainingModeController {

	@Autowired
	private TrainingModeService trainingModeService;

	/**
	 * Retrieves all training modes.
	 * 
	 * @return ResponseEntity containing a list of all training modes and HTTP
	 *         status OK
	 */
	@GetMapping("/trainingMode")
	public ResponseEntity<List<TrainingMode>> findAllTrainingMode() {

		List<TrainingMode> allTrainingMode = trainingModeService.getAllTrainingMode();

		return ResponseEntity.ok(allTrainingMode);

	}

	/**
	 * Creates a new training mode.
	 * 
	 * @param trainingMode The training mode object to be created
	 * @return ResponseEntity containing the created training mode and HTTP status
	 *         OK
	 */
	@PostMapping("/create/trainingMode")
	public ResponseEntity<TrainingMode> createOneTrainingMode(@RequestBody TrainingMode trainingMode) {
		TrainingMode saveOneTrainingMode = trainingModeService.saveOneTrainingMode(trainingMode);
		return ResponseEntity.ok(saveOneTrainingMode);

	}

	/**
	 * Updates an existing training mode.
	 * 
	 * @param trainingModecode The code of the training mode to be updated
	 * @param trainingMode     The updated name of the training mode
	 * @return ResponseEntity containing a success message or error message and HTTP
	 *         status
	 */
	@PutMapping("/updateTrainingMode/{trainingModecode}")
	public ResponseEntity<String> updateTrainingMode(@PathVariable("trainingModecode") long trainingModecode,
			@RequestParam("trainingMode") String trainingMode) {

		try {
			trainingModeService.updateTrainingMode(trainingModecode, trainingMode);
			return ResponseEntity.ok("Training mode updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training spell: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a training mode.
	 * 
	 * @param trainingModecode The code of the training mode to be deactivated
	 * @return ResponseEntity containing a success message or error message and HTTP
	 *         status
	 */
	@DeleteMapping("/deleteTrainingMode/{trainingModecode}")
	public ResponseEntity<String> deActivateSpell(@PathVariable("trainingModecode") long trainingModecode) {

		try {
			trainingModeService.deActivateTrainingMode(trainingModecode);
			return ResponseEntity.ok("Training mode De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training mode:" + e.getMessage());
		}

	}

	/**
	 * Retrieves a training mode by its code.
	 * 
	 * @param trainingModecode The code of the training mode to retrieve
	 * @return ResponseEntity containing the retrieved training mode or an error
	 *         message and HTTP status
	 */
	@GetMapping("/getTrainingModeCodeByid/{trainingModecode}")
	public ResponseEntity<TrainingMode> getMnagementcodebyId(@PathVariable("trainingModecode") long trainingModecode) {
		TrainingMode trainingMode = trainingModeService.findByStatusId(trainingModecode);
		return ResponseEntity.ok(trainingMode);
	}

}
