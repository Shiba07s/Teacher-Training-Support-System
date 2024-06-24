package com.TTSS03.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.RoleMaster;
import com.TTSS03.Service.RoleMasterService;

@RestController
@RequestMapping("/api")
public class RoleMasterController {
	
	@Autowired
	private RoleMasterService roleMasterService;
	
	@PostMapping("/credential/adminlogin")
	public ResponseEntity<String> adminLogin(@RequestBody RoleMaster roleMaster) {
		Optional<RoleMaster> user = roleMasterService.findByUsernameAndPassword(roleMaster.getUsername(),
																		roleMaster.getRolename(),
																		roleMaster.getPassword()
																		);
 
		if (user.isPresent()) {
			return ResponseEntity.ok("Login successful for " + roleMaster.getUsername());
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Login failed");
		}
	}

	 
	
	@PostMapping("/credential/admin")
	public ResponseEntity<String> login(@RequestBody RoleMaster roleMaster) {
	    if (roleMasterService.checkIfUsernameExists(roleMaster.getUsername())) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Username already exists.");
	    } else {
	        RoleMaster createUserRole = roleMasterService.createUserRole(roleMaster);
	        return ResponseEntity.ok("Data stored successfully.");
	    }
	}


}
