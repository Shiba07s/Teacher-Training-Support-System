package com.TTSS03.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.RoleToPageMaster;
import com.TTSS03.Service.RoleToPageMasterService;


@RestController
@RequestMapping("/api")
public class RoleToPageMasterController {

	@Autowired
	private RoleToPageMasterService roleToPageMasterService;

	@GetMapping("/names")
	public List<String> getRoleNames() {
		return roleToPageMasterService.getRoleNames();
	}
	
	
	@GetMapping("/descriptions")
	public List<String> getDescriptionsforAll() {
		return roleToPageMasterService.getDescriptions();
	}
	
	
	@GetMapping("/getroledetails")
	public Optional<RoleToPageMaster> getRoleDetails(@RequestParam long roleId) {
		//System.out.println(roleToPageMasterService.getRoleDetails(roleId));
		return roleToPageMasterService.getRoleDetails(roleId);
	}
	@PostMapping("/createrole")
	public ResponseEntity<RoleToPageMaster>createNewRole(@RequestBody RoleToPageMaster roleToPageMaster){
		RoleToPageMaster saveOneRole = roleToPageMasterService.saveOneRole(roleToPageMaster);
		return ResponseEntity.ok(saveOneRole);
	}

}
