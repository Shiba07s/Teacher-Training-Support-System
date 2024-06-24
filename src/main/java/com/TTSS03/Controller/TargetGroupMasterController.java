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
import com.TTSS03.Entity.TargetGroupMaster;
import com.TTSS03.Service.TargetGroupMasterService;

@RestController
@RequestMapping("/api")
public class TargetGroupMasterController {

	@Autowired
	TargetGroupMasterService targetGroupMasterService;

	/**
	 * Retrieves all target groups.
	 * 
	 * @return ResponseEntity containing a list of all target groups
	 */
	@GetMapping("/group")
	public ResponseEntity<List<TargetGroupMaster>> findAllgrades() {
		List<TargetGroupMaster> allGroup = targetGroupMasterService.getAllGroup();
		return ResponseEntity.ok(allGroup);
	}

	/**
	 * Creates a new target group.
	 * 
	 * @param targetGroupMaster The target group information to be created
	 * @return ResponseEntity containing the created target group
	 */
	@PostMapping("/group/create")
	public ResponseEntity<TargetGroupMaster> createNewMasterGroup(@RequestBody TargetGroupMaster targetGroupMaster) {
		TargetGroupMaster createNewGrade = targetGroupMasterService.createNewGroup(targetGroupMaster);
		return new ResponseEntity<TargetGroupMaster>(createNewGrade, HttpStatus.OK);

	}

	/**
	 * Updates the target group of a training.
	 * 
	 * @param groupId     The ID of the target group to be updated
	 * @param targetgroup The new target group name
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateTrainingGroup/{groupId}")
	public ResponseEntity<String> updateTrainingSpell(@PathVariable("groupId") long groupId,
			@RequestParam("targetgroup") String targetgroup) {

		try {
			targetGroupMasterService.updateTrainingGroup(groupId, targetgroup);
			return ResponseEntity.ok("Training Group updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training Group: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a target group.
	 * 
	 * @param groupId The ID of the target group to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteGroup/{groupId}")
	public ResponseEntity<String> deActivateSpell(@PathVariable long groupId) {
		try {
			targetGroupMasterService.deActivateTrainingGroup(groupId);
			return ResponseEntity.ok("Training Group De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training Group:" + e.getMessage());
		}
	}

	/**
	 * Retrieves a target group by its ID.
	 * 
	 * @param group_id The ID of the target group to retrieve
	 * @return ResponseEntity containing the target group
	 */
	@GetMapping("/getbygroupid/{group_id}")
	public ResponseEntity<TargetGroupMaster> findgrade(@PathVariable("group_id") long group_id) {
		TargetGroupMaster group = targetGroupMasterService.getGroup(group_id);
		return ResponseEntity.ok(group);
	}

}
