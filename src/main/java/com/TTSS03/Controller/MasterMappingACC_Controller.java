package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.MasterMappingACC;
import com.TTSS03.Service.MasterMappingACCService;

@RestController
@RequestMapping("/api")
public class MasterMappingACC_Controller {

	@Autowired
	MasterMappingACCService masterMappingACCServ;

	
	/**
	 * Creates one or more Assistant Course Co-Ordinator records.
	 * 
	 * @param mastermappingacc The list of ACC records to create
	 * @return ResponseEntity indicating the success of the creation operation
	 */
	@PostMapping("/acc/create")
	public ResponseEntity<String> createOneACC(@RequestBody List<MasterMappingACC> mastermappingacc) {
		masterMappingACCServ.saveOneACC(mastermappingacc);
		return ResponseEntity.ok("ACC Created Successful ! ! !");

	}

	
	/**
	 * Retrieves all Assistant Course Co-Ordinator records for a specific training and venue.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of all ACC records for the specified training and venue
	 */
	@GetMapping("/getall/acc")
	public ResponseEntity<List<MasterMappingACC>> getAllAcc(@RequestParam String trainingid,
			@RequestParam String venueid) {
		List<MasterMappingACC> allACC = masterMappingACCServ.getAllACC(trainingid, venueid);

		return ResponseEntity.ok(allACC);
	}

	
	/**
	 * Deactivates the status of an Assistant Course Co-Ordinator record.
	 * 
	 * @param trainingid    The ID of the training
	 * @param venueid       The ID of the venue
	 * @param cctreasuryid  The treasury ID
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@PutMapping("/acc/deactivate")
	public ResponseEntity<String> deactivateStatus(@RequestParam String trainingid, @RequestParam String venueid,
			@RequestParam String cctreasuryid) {
		masterMappingACCServ.makeStatusInactive(trainingid, venueid, cctreasuryid);

		return ResponseEntity.ok("ACC De-Activate Successfully ! ! !");
	}

}
