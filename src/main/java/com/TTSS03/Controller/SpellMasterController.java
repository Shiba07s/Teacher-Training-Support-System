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

import com.TTSS03.Entity.SpellMaster;
import com.TTSS03.Service.SpellMasterService;

@RestController
@RequestMapping("/api")
public class SpellMasterController {

	@Autowired
	SpellMasterService spellMasterService;

	/**
	 * Retrieves all SpellMaster records.
	 * 
	 * @return ResponseEntity containing a list of all SpellMaster records
	 */
	@GetMapping("/spell")
	public ResponseEntity<List<SpellMaster>> findAllSpell() {
		List<SpellMaster> allSpell = spellMasterService.getAllSpell();
		return ResponseEntity.ok(allSpell);
	}

	/**
	 * Creates a new SpellMaster record.
	 * 
	 * @param spellMaster The SpellMaster object to be created
	 * @return ResponseEntity containing the created SpellMaster object
	 */
	@PostMapping("/create/spell")
	public ResponseEntity<SpellMaster> createOneSpell(@RequestBody SpellMaster spellMaster) {
		SpellMaster saveOneSpell = spellMasterService.saveOneSpell(spellMaster);
		return ResponseEntity.ok(saveOneSpell);

	}

	/**
	 * Updates the spell of a SpellMaster record.
	 * 
	 * @param spellcode The ID of the SpellMaster record to be updated
	 * @param spell     The new spell value
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateTrainingSpell/{spellcode}")
	public ResponseEntity<String> updateTrainingSpell(@PathVariable("spellcode") long spellcode,
			@RequestParam("spell") String spell) {
		try {
			spellMasterService.updateTrainingSpell(spellcode, spell);
			return ResponseEntity.ok("Training spell updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training spell: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a SpellMaster record.
	 * 
	 * @param spellcode The ID of the SpellMaster record to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteSpell/{spellcode}")
	public ResponseEntity<String> deActivateSpell(@PathVariable long spellcode) {
		try {
			spellMasterService.deActivateTrainingSpell(spellcode);
			return ResponseEntity.ok("Training spell De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training spell:" + e.getMessage());
		}
	}

	/**
	 * Retrieves a SpellMaster record by its ID.
	 * 
	 * @param spellcode The ID of the SpellMaster record to retrieve
	 * @return ResponseEntity containing the retrieved SpellMaster record
	 */
	@GetMapping("/getbyspellid/{spellcode}")
	public ResponseEntity<SpellMaster> findSpell(@PathVariable("spellcode") long spellcode) {
		SpellMaster spell = spellMasterService.getSpell(spellcode);
		return ResponseEntity.ok(spell);
	}
}
