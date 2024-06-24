package com.TTSS03.Controller;

import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.SessionMaster;
import com.TTSS03.Service.SessionMasterService;

@RestController
@RequestMapping("/api/session")
public class SessionMasterController {

	@Autowired
	private SessionMasterService sessionMasterService;

	/**
	 * Creates a new session.
	 * 
	 * @param sessionMaster The session details to be created
	 * @return ResponseEntity indicating the success of the operation
	 */
	@PostMapping("/create")
	public ResponseEntity<SessionMaster> createNewSession(@RequestBody SessionMaster sessionMaster) {

		if (sessionMaster.getStatus().equals("Current")) {
			Optional<SessionMaster> existingCurrentSession = sessionMasterService.getSessionsWithStatusCurrent();
			if (existingCurrentSession.isPresent()) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
		}

		SessionMaster createSession = sessionMasterService.createSession(sessionMaster);
		return ResponseEntity.ok(createSession);
	}

	/**
	 * Retrieves all sessions.
	 * 
	 * @return ResponseEntity containing the list of all sessions
	 */
	@GetMapping("/get")
	public ResponseEntity<List<SessionMaster>> getAllSessionsList() {
		List<SessionMaster> allSession = sessionMasterService.getAllSession();
		return new ResponseEntity<List<SessionMaster>>(allSession, HttpStatus.OK);

	}
	
	
	/**
	 * Retrieves all sessions.
	 * 
	 * @return ResponseEntity containing the list of all sessions
	 */
	@GetMapping("/getcurrent")
	public ResponseEntity<Optional<SessionMaster>> getCurrent() {
		Optional<SessionMaster> existingCurrentSession = sessionMasterService.getSessionsWithStatusCurrent();
		return new ResponseEntity<Optional<SessionMaster>>(existingCurrentSession, HttpStatus.OK);

	}


	/**
	 * Updates a session.
	 * 
	 * @param id            The ID of the session to be updated
	 * @param sessionMaster The updated session details
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateSession/{id}")
	public ResponseEntity<String> updateSession(@PathVariable("id") long id, @RequestBody SessionMaster sessionMaster) {

		if (sessionMaster.getStatus().equals("Current")) {
			Optional<SessionMaster> existingCurrentSession = sessionMasterService.getSessionsWithStatusCurrent();
			//System.out.println(id +" "+existingCurrentSession.get().getId());
			if (existingCurrentSession.isPresent() && id !=existingCurrentSession.get().getId()) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
		}
		try {
			sessionMasterService.updateSession(id, sessionMaster);
			return ResponseEntity.ok("Session updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Session: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a session.
	 * 
	 * @param id The ID of the session to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteSession/{id}")
	public ResponseEntity<String> deActivateSession(@PathVariable long id) {

		try {
			sessionMasterService.deActivateTrainingSession(id);
			return ResponseEntity.ok("Training Session De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training Session:" + e.getMessage());
		}

	}

	/**
	 * Retrieves a session by its ID.
	 * 
	 * @param id The ID of the session to retrieve
	 * @return ResponseEntity containing the session details
	 */
	@GetMapping("/getbysessionid/{id}")
	public ResponseEntity<SessionMaster> findbysessionid(@PathVariable("id") long id) {

		SessionMaster smaster = sessionMasterService.findByid(id);

		return ResponseEntity.ok(smaster);

	}
}
