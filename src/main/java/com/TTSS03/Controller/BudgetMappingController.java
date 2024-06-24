package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.BudgetMapping;
import com.TTSS03.Service.BudgetMappingService;

@RestController
@RequestMapping("/api")
public class BudgetMappingController {

	@Autowired
	BudgetMappingService BudgetMappingServ;

	/**
	 * Saves budget mappings for a training.
	 * 
	 * @param budgetMappingList The list of budget mappings to save
	 * @param trainingid        The ID of the training
	 * @param budgetedyear      The budgeted year
	 * @param trainingname      The name of the training
	 * @param vname             The name of the venue
	 * @param venueid           The ID of the venue
	 * @param schedulebudget    The budget for the schedule
	 * @param trainingtype      The type of training
	 * @param accounthead       The account head
	 * @return ResponseEntity indicating the success or failure of the save
	 *         operation
	 */
	@PostMapping("/save/bdgtmapping")
	public ResponseEntity<String> saveBudgetMappings(@RequestBody List<BudgetMapping> budgetMappingList,
			@RequestParam String trainingid, @RequestParam String budgetedyear, @RequestParam String trainingname,
			@RequestParam String vname, @RequestParam String venueid, @RequestParam String schedulebudget,
			@RequestParam String trainingtype, @RequestParam String accounthead) {
		BudgetMappingServ.saveBudgetMappings(budgetMappingList, trainingid, budgetedyear, trainingname, vname, venueid,
				schedulebudget, trainingtype, accounthead);
		return new ResponseEntity<>("Budget mappings saved successfully", HttpStatus.OK);
	}

}
