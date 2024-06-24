package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.ActualData;
import com.TTSS03.Service.ActualDataService;

@RestController
@RequestMapping("/api")
public class ActuaDataController {

	@Autowired
	ActualDataService actualDataService;

	@GetMapping("/getdata")
	// Retrieve all actual data.
	// Returns: ResponseEntity<List<ActualData>> - Response containing a list of all actual data.
	public ResponseEntity<List<ActualData>> getallplanedtrainings() {
		List<ActualData> all = actualDataService.getAll();
		return ResponseEntity.ok(all);
	}

	@PutMapping("/edit")
	// Update a single record identified by refplannerid.
	// Parameters:
	// refplannerid: String - Identifier for the record to be updated.
	// actualData: ActualData - Updated data to be saved.
	// Returns: ResponseEntity<ActualData> - Response containing the updated record.
	public ResponseEntity<ActualData> updateOneRecord(@RequestParam String refplannerid,
			@RequestBody ActualData actualData) {

		ActualData updateOne = actualDataService.updateOne(refplannerid, actualData);

		return ResponseEntity.ok(updateOne);
	}

	@PostMapping("/deactivate")
	// Deactivate a training record identified by refplannerid.
	// Parameters:
	// refplannerid: String - Identifier for the record to be deactivated.
	public void deactivateTraining(@RequestParam String refplannerid) {
		actualDataService.deactivateTraining(refplannerid);
	}

	@GetMapping("/getdatabyid")
	// Retrieve training data by identifier.
	// Parameters:
	// refplannerid: String - Identifier for the record to be retrieved.
	// Returns: List<ActualData> - List of actual data matching the provided
	// identifier.
	public List<ActualData> getTrainingById(@RequestParam(name = "refplannerid") String refplannerid) {
		System.out.println(refplannerid); // Log the provided identifier
		return actualDataService.getDataById(refplannerid);
	}
	
	@GetMapping("/getunconfirmeddata")
	// Retrieve training data by identifier.
	// Parameters:
	// refplannerid: String - Identifier for the record to be retrieved.
	// Returns: List<ActualData> - List of actual data matching the provided
	// identifier.
	public List<ActualData> getUnconfirmedData() {
		return actualDataService.getUnconfirmedData();
	}

	@PostMapping("/savedata")
	// Create a new record with provided actual data.
	// Parameters:
	// actualData: ActualData - Data to be saved as a new record.
	// Returns: ResponseEntity<ActualData> - Response containing the saved record.
	public ResponseEntity<ActualData> createNewRecord(@RequestBody ActualData actualData) {
		ActualData saveOneData = actualDataService.saveOneData(actualData);

		return ResponseEntity.ok(saveOneData);
	}

	@GetMapping("/getdata/year/month")
	// Retrieve all planned trainings for a specific year and month.
	// Parameters:
	// tyear: String - Year for filtering planned trainings.
	// tmonth: String - Month for filtering planned trainings.
	// Returns: ResponseEntity<List<ActualData>> - Response containing a list of
	// planned trainings filtered by year and month.
	public ResponseEntity<List<ActualData>> getallplanedtrainingsByYearAndMonth(@RequestParam String tyear,
			@RequestParam String tmonth) {
		List<ActualData> findByYearAndMonth = actualDataService.findByYearAndMonth(tyear, tmonth);
		return ResponseEntity.ok(findByYearAndMonth);
	}
	
	/**
	 * Updates the status of a training to 'approved'.
	 * 
	 * @param treasuryId   The treasury ID
	 * @param refPlannerId The reference planner ID
	 * @param vid          The venue ID
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/updatetrainingstatus")
	public ResponseEntity<String> updateTrainingStatus(@RequestParam String refplannerid, @RequestParam String preferdlocation) {
		actualDataService.updateTrainingStatus(refplannerid, preferdlocation);
		return new ResponseEntity<>(
				"Status updated to 'approved' for treasuryId: " + refplannerid + ',' + preferdlocation, HttpStatus.OK);
	}
	
	/**
	 * Updates the status and remarks for second level approval of a training.
	 * 
	 * @param treasuryId          The treasury ID
	 * @param refPlannerIds       The reference planner IDs
	 * @param vid                 The venue ID
	 * @param secondlevelapproval The second level approval status
	 * @return ResponseEntity indicating the success of the operation and HTTP
	 *         status OK
	 */
	@PutMapping("/remarksupdate")
	public ResponseEntity<String> updateStatusAndRemarks(@RequestParam String refplannerid, @RequestParam String preferdlocation, @RequestParam String remarks) {
		try {
			actualDataService.updateStatusAndRemarks(refplannerid, preferdlocation, remarks);
			return ResponseEntity.ok("Status and remarks updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating status and remarks: " + e.getMessage());
		}
	}

}
