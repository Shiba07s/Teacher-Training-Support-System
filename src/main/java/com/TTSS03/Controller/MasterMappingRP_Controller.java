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

import com.TTSS03.Entity.MasterMappingRP;
import com.TTSS03.Service.MasterMappingRPService;

@RestController
@RequestMapping("/api")
public class MasterMappingRP_Controller {

	@Autowired
	MasterMappingRPService masterMappingRpServ;

	/**
	 * Creates a new Resource Partner (RP) mapping.
	 * 
	 * @param mastermappingrp List of MasterMappingRP objects representing RP
	 *                        mappings
	 * @return ResponseEntity indicating the success of the creation operation
	 */
	@PostMapping("/rp/create")
	public ResponseEntity<String> createOneCC(@RequestBody List<MasterMappingRP> mastermappingrp) {
		masterMappingRpServ.saveOneRP(mastermappingrp);
		return ResponseEntity.ok("RP Created Successful ! ! !");
	}

	/**
	 * Retrieves all Resource Partner (RP) mappings based on training ID and venue
	 * ID.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of all RP mappings
	 */
	@GetMapping("/getall/rp")
	public ResponseEntity<List<MasterMappingRP>> getAllRp(@RequestParam String trainingid,
			@RequestParam String venueid) {
		List<MasterMappingRP> allRp = masterMappingRpServ.getAllRp(trainingid, venueid);
		return ResponseEntity.ok(allRp);
	}

	/**
	 * Deactivates the status of a Resource Partner (RP) mapping.
	 * 
	 * @param trainingid   The ID of the training
	 * @param venueid      The ID of the venue
	 * @param cctreasuryid The treasury ID associated with the RP
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@PutMapping("/rp/deactivate")
	public ResponseEntity<String> deactivateStatus(@RequestParam String trainingid, @RequestParam String venueid,
			@RequestParam String cctreasuryid) {
		masterMappingRpServ.makeStatusInactive(trainingid, venueid, cctreasuryid);
		return ResponseEntity.ok("RP De-Activated Successfully ! ! !");
	}

}
