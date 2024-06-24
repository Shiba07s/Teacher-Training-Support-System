package com.TTSS03.Controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.MasterMappingCC;
import com.TTSS03.Service.MasterMappingCCService;

@RestController
@RequestMapping("/api")
public class MasterMappingCC_Controller {
	
	@Autowired
	MasterMappingCCService masterMappingCCServ;
	
	
	/**
	 * Retrieves master mapping details for a specific training and venue.
	 * 
	 * @param trainingId The ID of the training
	 * @param venueId    The ID of the venue
	 * @return Map containing the master mapping details
	 */
	@GetMapping("/training/mapped")
    public Map<String, List<?>> getMasterMappingDetails(@RequestParam String trainingId, @RequestParam String venueId) {
        return masterMappingCCServ.getMasterMappingDetails(trainingId, venueId);
    }
	
	/**
	 * Creates one or more Course Coordinator (CC) records.
	 * 
	 * @param mastermappingcc The list of CC records to create
	 * @return ResponseEntity indicating the success of the creation operation
	 */
	@PostMapping("/cc/create")
	public ResponseEntity<String>createOneCC(@RequestBody List<MasterMappingCC> mastermappingcc){
		masterMappingCCServ.saveOneCC(mastermappingcc);
		return ResponseEntity.ok("CC Created Successful ! ! !");
		
	}
	
	/**
	 * Retrieves all Course Coordinator (CC) records for a specific training and venue.
	 * 
	 * @param trainingid The ID of the training
	 * @param venueid    The ID of the venue
	 * @return ResponseEntity containing a list of all CC records for the specified training and venue
	 */
	@GetMapping("/getall/cc")
	public ResponseEntity<List<MasterMappingCC>>getAllCC(@RequestParam String trainingid,@RequestParam String venueid){
		List<MasterMappingCC> allCC = masterMappingCCServ.getAllCC(trainingid,venueid);
		
		return ResponseEntity.ok(allCC);
	}

	/**
	 * Retrieves a Course Coordinator (CC) record by treasury ID.
	 * 
	 * @param trainingid   The ID of the training
	 * @param venueid      The ID of the venue
	 * @param cctreasuryid The treasury ID of the CC
	 * @return ResponseEntity containing the CC record
	 */
	@GetMapping("/cc/treasuryId")
	public ResponseEntity<MasterMappingCC>getCCBytreasuryId(@RequestParam String trainingid,@RequestParam String venueid,@RequestParam String cctreasuryid){
		MasterMappingCC byTreasuryId = masterMappingCCServ.getByTreasuryId(trainingid, venueid, cctreasuryid);
		
		return ResponseEntity.ok(byTreasuryId);
	}
	
	
	/**
	 * Deactivates the status of a Course Coordinator (CC) record.
	 * 
	 * @param trainingid   The ID of the training
	 * @param venueid      The ID of the venue
	 * @param cctreasuryid The treasury ID of the CC
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@PutMapping("/cc/deactivate")
	public ResponseEntity<String>deactivateStatus(@RequestParam String trainingid,@RequestParam String venueid,@RequestParam String cctreasuryid){
		masterMappingCCServ.makeStatusInactive(trainingid, venueid, cctreasuryid);
		
		return ResponseEntity.ok("CC De-Activate Successfully ! ! !");
	}
	
}
