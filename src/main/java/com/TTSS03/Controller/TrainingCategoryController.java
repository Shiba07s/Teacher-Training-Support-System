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

import com.TTSS03.Entity.TrainingCategoryMaster;
import com.TTSS03.Service.TrainingCategoryMasterService;

@RestController
@RequestMapping("/api")
public class TrainingCategoryController {

	@Autowired
	TrainingCategoryMasterService trainingCategoryMasterService;

	/**
	 * Retrieves all training categories.
	 * 
	 * @return ResponseEntity containing a list of TrainingCategoryMaster objects
	 *         and HTTP status OK
	 */
	@GetMapping("/category")
	public ResponseEntity<List<TrainingCategoryMaster>> findAllCategory() {
		List<TrainingCategoryMaster> allcategory = trainingCategoryMasterService.getAllcategory();
		return ResponseEntity.ok(allcategory);
	}

	/**
	 * Adds a new training category.
	 * 
	 * @param TrainingCategory The TrainingCategoryMaster object to be added
	 * @return ResponseEntity containing the added TrainingCategoryMaster object and
	 *         HTTP status OK
	 */
	@PostMapping("/addCategory")
	public ResponseEntity<TrainingCategoryMaster> addOnecategory(@RequestBody TrainingCategoryMaster TrainingCategory) {
		TrainingCategoryMaster saveOneCategory = trainingCategoryMasterService.saveOneCategory(TrainingCategory);
		return ResponseEntity.ok(saveOneCategory);
	}

	/**
	 * Updates an existing training category.
	 * 
	 * @param uid              The unique identifier of the training category to be
	 *                         updated
	 * @param trainingcategory The updated training category name
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@PutMapping("/updateTrainingCategory/{uid}")
	public ResponseEntity<String> updateTrainingCategory(@PathVariable("uid") long uid,
			@RequestParam("trainingcategory") String trainingcategory) {

		try {
			trainingCategoryMasterService.updateTrainingCategory(uid, trainingcategory);
			return ResponseEntity.ok("Training category updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training category: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a training category.
	 * 
	 * @param uid The unique identifier of the training category to be deactivated
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@DeleteMapping("/delete/{uid}")
	public ResponseEntity<String> deActivateCategory(@PathVariable long uid) {

		try {
			trainingCategoryMasterService.deActivateTrainingCategory(uid);
			return ResponseEntity.ok("Training De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training category:" + e.getMessage());
		}

	}

	/**
	 * Finds a training category by its unique identifier.
	 * 
	 * @param uid The unique identifier of the training category to be found
	 * @return ResponseEntity containing the TrainingCategoryMaster object and HTTP
	 *         status OK
	 */
	@GetMapping("/getbycategoryid/{uid}")
	public ResponseEntity<TrainingCategoryMaster> findCategory(@PathVariable("uid") long uid) {
		TrainingCategoryMaster category = trainingCategoryMasterService.getcategory(uid);
		return ResponseEntity.ok(category);
	}

}
