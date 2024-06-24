package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TrainingMappingBudget;
import com.TTSS03.Service.TrainingMappingBudgetService;

@RestController
@RequestMapping("/api/mapping")
public class TrainingMappingBudgetController {

	@Autowired
	private TrainingMappingBudgetService trainingMappingBudgetService;

	/**
	 * Retrieves all distinct training and venue mappings.
	 * 
	 * @return ResponseEntity containing a list of TrainingMappingBudget objects and
	 *         HTTP status OK
	 */
	@GetMapping("/training/venue")
	public ResponseEntity<List<TrainingMappingBudget>> getAllDistinctTrainingAndVenue() {
		List<TrainingMappingBudget> findDistinctTrainingAndVenue = trainingMappingBudgetService
				.findDistinctTrainingAndVenue();
		return ResponseEntity.ok(findDistinctTrainingAndVenue);
	}

	/**
	 * Retrieves all mapping data for a specific training and venue.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of TrainingMappingBudget objects and
	 *         HTTP status OK
	 */
	@GetMapping("/budget")
	public ResponseEntity<List<TrainingMappingBudget>> getAllMappingDataList(@RequestParam String trainingid,
			@RequestParam String venueid) {
		List<TrainingMappingBudget> allMappingData = trainingMappingBudgetService.getAllMappingData(trainingid,
				venueid);
		return new ResponseEntity<List<TrainingMappingBudget>>(allMappingData, HttpStatus.OK);
	}

	/**
	 * Retrieves all mapping data for a specific training and venue.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of TrainingMappingBudget objects and
	 *         HTTP status OK
	 */
	@GetMapping("/budget1")
	public ResponseEntity<List<TrainingMappingBudget>> getAllMappingDataList1(@RequestParam String trainingid,
			@RequestParam String venueid) {
		List<TrainingMappingBudget> allMappingData = trainingMappingBudgetService.getAllMappingData1(trainingid,
				venueid);
		return new ResponseEntity<List<TrainingMappingBudget>>(allMappingData, HttpStatus.OK);
	}

	/**
	 * Retrieves all distinct training transactions.
	 * 
	 * @return List of TrainingMappingBudget objects representing distinct training
	 *         transactions
	 */
	@GetMapping("/distinct")
	public List<TrainingMappingBudget> getDistinctTrainingTransactions() {
		return trainingMappingBudgetService.findDistinctTrainingTransactions();
	}

	/**
	 * Retrieves mapping data for a specific training and venue.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of TrainingMappingBudget objects and
	 *         HTTP status OK
	 */
	@GetMapping("/getdata")
	public ResponseEntity<List<TrainingMappingBudget>> getMappingData(@RequestParam String trainingid,
			@RequestParam String venueid) {
		List<TrainingMappingBudget> result = trainingMappingBudgetService
				.getMappingDataOnTrainingidAndVenueid(trainingid, venueid);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	/**
	 * Updates training mappings for a specific training and venue.
	 * 
	 * @param trainingId      The ID of the training
	 * @param venueId         The ID of the venue
	 * @param updatedMappings The updated mappings
	 * @return ResponseEntity containing a success message and HTTP status OK, or an
	 *         error message and HTTP status INTERNAL_SERVER_ERROR
	 */
	@PostMapping("/updateMapping/{trainingId}/{venueId}")
	public ResponseEntity<String> updateTrainingMapping(@PathVariable String trainingId, @PathVariable String venueId,
			@RequestBody List<TrainingMappingBudget> updatedMappings) {

		try {
			trainingMappingBudgetService.updateSingleMapping(trainingId, venueId, updatedMappings);
			return new ResponseEntity<>("Training mappings updated successfully!", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("Failed to update training mappings: " + e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Updates the status of a training.
	 * 
	 * @param trainingId The ID of the training to update status for
	 * @param venueId    The ID of the venue associated with the training
	 * @return ResponseEntity containing a success message and HTTP status OK if the
	 *         status is updated successfully, or an error message and HTTP status
	 *         INTERNAL_SERVER_ERROR if an error occurs
	 */
	@PostMapping("/status/{trainingId}/{venueId}")
	public ResponseEntity<String> updateTrainingstatus(@PathVariable String trainingId, @PathVariable String venueId) {

		try {
			trainingMappingBudgetService.updatestatus(trainingId, venueId);
			return new ResponseEntity<>("Training status updated successfully!", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("Failed to update training status: " + e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	/**
	 * Finds mapping data by its unique identifier.
	 * 
	 * @param mid The unique identifier of the mapping data
	 * @return ResponseEntity containing a list of TrainingMappingBudget objects and
	 *         HTTP status OK
	 */
	@GetMapping("/search/data")
	public ResponseEntity<List<TrainingMappingBudget>> findMappingData(@RequestParam long mid) {
		List<TrainingMappingBudget> venue = trainingMappingBudgetService.findByMappingId(mid);
		return ResponseEntity.ok(venue);

	}

	/**
	 * Approves a training.
	 * 
	 * @param trainingId       The ID of the training to approve
	 * @param venueId          The ID of the venue associated with the training
	 * @param updatedMappingss The list of updated mapping data
	 * @return ResponseEntity containing a success message if the training record
	 *         status is updated successfully, or an error message and HTTP status
	 *         INTERNAL_SERVER_ERROR if an error occurs
	 */
	@PostMapping("/approve/trainingId/venueId")
	public ResponseEntity<String> approveTraining(@RequestParam String trainingId, @RequestParam String venueId,
			@RequestBody List<TrainingMappingBudget> updatedMappingss) {

		try {
			trainingMappingBudgetService.updaterecordstatusSecondlevel(trainingId, venueId, updatedMappingss);
			return ResponseEntity.ok("Training record status updated successfully!");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Failed to update training record status");
		}
	}

	/**
	 * Updates budget mapping data by its unique identifier.
	 * 
	 * @param mid                   The unique identifier of the mapping data
	 * @param trainingMappingBudget The updated TrainingMappingBudget object
	 * @return ResponseEntity containing a success message if the budget mapping is
	 *         updated successfully, or an error message and HTTP status
	 *         INTERNAL_SERVER_ERROR if an error occurs
	 */
	@PutMapping("/updatebyid/{mid}")
	public ResponseEntity<String> updateBudgetMapping(@PathVariable("mid") long mid,
			@RequestBody TrainingMappingBudget trainingMappingBudget) {
		try {
			trainingMappingBudgetService.updateTrainingMappingBudgetByid(mid, trainingMappingBudget);
			return ResponseEntity.ok("Budget Mapping updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Budget Mapping: " + e.getMessage());
		}
	}

	/**
	 * Retrieves distinct budget transactions based on training ID and venue ID.
	 * 
	 * @param trainingId The ID of the training
	 * @param venueId    The ID of the venue
	 * @return A list of Map containing distinct budget transactions
	 */
	@GetMapping("/budget/trainingid/venueid")
	public List<Map<String, Object>> getDistinctBudgetTransactions(@RequestParam String trainingId,
			@RequestParam String venueId) {
		return trainingMappingBudgetService.findDistinctByTrainingIdAndVenueId(trainingId, venueId);
	}

	/**
	 * Retrieves distinct entries based on training ID and venue ID.
	 * 
	 * @param trainingId The ID of the training
	 * @param venueId    The ID of the venue
	 * @return A list of Map containing distinct entries
	 */
	@GetMapping("/distinctEntries")
	public List<Map<String, Object>> getDistinctEntries(@RequestParam String trainingId, @RequestParam String venueId) {
		return trainingMappingBudgetService.findDistinctEntries(trainingId, venueId);
	}

	/**
	 * Retrieves all distinct entries.
	 * 
	 * @return A list of Map containing distinct entries
	 */
	@GetMapping("/distinctEntriesAll")
	public List<Map<String, Object>> getDistinctEntriesAll() {
		return trainingMappingBudgetService.findDistinctEntriesAll();
	}

	/**
	 * Retrieves first-level approvals with status "to be approved".
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return A list of TrainingMappingBudget objects representing first-level
	 *         approvals
	 */
	@GetMapping("/first-level-approval")
	public List<TrainingMappingBudget> getFirstLevelApproval(@RequestParam String trainingid,
			@RequestParam String venueid) {
		return trainingMappingBudgetService.findFirstLevelApproval(trainingid, venueid);
	}

	/**
	 * Retrieves second-level approvals.
	 * 
	 * @return A list of TrainingMappingBudget objects representing second-level
	 *         approvals
	 */
	@GetMapping("/second-level-approval")
	public List<TrainingMappingBudget> getSecondLevelApproval() {
		return trainingMappingBudgetService.findSecondLevelApproval();
	}

	/**
	 * Retrieves all distinct trainings.
	 * 
	 * @return ResponseEntity containing a list of distinct training names and HTTP
	 *         status OK
	 */
	@GetMapping("/distinct/trainings")
	public ResponseEntity<List<String>> getAllDistinctTrainings() {
		List<String> findDistinctTrinings = trainingMappingBudgetService.findDistinctTrainings();
		return ResponseEntity.ok(findDistinctTrinings);
	}

	/**
	 * Retrieves all distinct venues for a given training ID.
	 * 
	 * @param trainingid The ID of the training
	 */
	@GetMapping("/distinct/venue")
	public ResponseEntity<List<String>> getAllDistinctVenue(@RequestParam String trainingid) {
		List<String> findDistinctvenue = trainingMappingBudgetService.findAllDistinctVenues(trainingid);
		return ResponseEntity.ok(findDistinctvenue);
	}

}
