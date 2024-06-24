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

import com.TTSS03.Entity.AttendGradeMaster;
import com.TTSS03.Service.AttendGradeService;

@RestController
@RequestMapping("/api")
public class AttendGradeMasterController {

	@Autowired
	AttendGradeService attendGradeService;

	/**
	 * Retrieves all grades.
	 * 
	 * @return ResponseEntity containing a list of all grades
	 */
	@GetMapping("/attendGrade")
	public ResponseEntity<List<AttendGradeMaster>> findAllGrade() {
		List<AttendGradeMaster> allGrade = attendGradeService.getAllGrade();
		return ResponseEntity.ok(allGrade);

	}

	/**
	 * Creates a new grade.
	 * 
	 * @param attendGradeMaster The details of the grade to create
	 * @return ResponseEntity containing the newly created grade
	 */
	@PostMapping("/grade/create")
	public ResponseEntity<AttendGradeMaster> createNewMasterGrade(@RequestBody AttendGradeMaster attendGradeMaster) {
		AttendGradeMaster createNewGrade = attendGradeService.createNewGrade(attendGradeMaster);
		return new ResponseEntity<AttendGradeMaster>(createNewGrade, HttpStatus.OK);

	}

	/**
	 * Updates the grade of a training.
	 * 
	 * @param gradeId     The ID of the grade to update
	 * @param attendgrade The new grade
	 * @return ResponseEntity indicating the success or failure of the update
	 *         operation
	 */
	@PutMapping("/updateTrainingGrade/{gradeId}")
	public ResponseEntity<String> updateTrainingSpell(@PathVariable("gradeId") long gradeId,
			@RequestParam("attendgrade") String attendgrade) {

		try {
			attendGradeService.updateTrainingGrade(gradeId, attendgrade);
			return ResponseEntity.ok("Training Grade updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training Grade: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a grade.
	 * 
	 * @param gradeId The ID of the grade to deactivate
	 * @return ResponseEntity indicating the success or failure of the deactivation
	 *         operation
	 */
	@DeleteMapping("/deleteGrade/{gradeId}")
	public ResponseEntity<String> deActivateSpell(@PathVariable long gradeId) {

		try {
			attendGradeService.deActivateTrainingGrade(gradeId);
			return ResponseEntity.ok("Training Grade De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training Grade:" + e.getMessage());
		}

	}

	/**
	 * Retrieves a grade by its ID.
	 * 
	 * @param slno The ID of the grade to retrieve
	 * @return ResponseEntity containing the requested grade
	 */
	@GetMapping("/getbygradeid/{slno}")
	public ResponseEntity<AttendGradeMaster> findGrade(@PathVariable("slno") long slno) {
		AttendGradeMaster grade = attendGradeService.getGrade(slno);
		return ResponseEntity.ok(grade);

	}

}
