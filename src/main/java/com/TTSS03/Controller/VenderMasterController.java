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

import com.TTSS03.Entity.VenderMaster;
import com.TTSS03.Service.VenderMasterService;

@RestController
@RequestMapping("/api/vender")
public class VenderMasterController {

	@Autowired
	private VenderMasterService vmService;

	
	/**
	 * Creates a new vendor.
	 * 
	 * @param venderMaster The vendor object to be created
	 * @return ResponseEntity containing the created vendor object and HTTP status CREATED if successful,
	 *         otherwise HTTP status INTERNAL_SERVER_ERROR
	 */
	@PostMapping("/save")
	public ResponseEntity<VenderMaster> create(@RequestBody VenderMaster venderMaster) {
		try {
			VenderMaster savedVenderMaster = vmService.saveOne(venderMaster);
			return new ResponseEntity<>(savedVenderMaster, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Retrieves a vendor by its ID.
	 * 
	 * @param sl The ID of the vendor to retrieve
	 * @return ResponseEntity containing the vendor object and HTTP status OK if found,
	 *         otherwise HTTP status NOT_FOUND if not found, or HTTP status INTERNAL_SERVER_ERROR if an error occurs
	 */
	@GetMapping("/getbyid/{sl}")
	public ResponseEntity<VenderMaster> getById(@PathVariable("sl") int sl) {
		try {
			Optional<VenderMaster> venderMasterOptional = vmService.getById(sl);
			return venderMasterOptional.map(venderMaster -> ResponseEntity.ok().body(venderMaster))
					.orElse(ResponseEntity.notFound().build());
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves all vendors.
	 * 
	 * @return ResponseEntity containing a list of vendor objects and HTTP status OK if successful,
	 *         otherwise HTTP status INTERNAL_SERVER_ERROR
	 */
	@GetMapping("/getall")
	public ResponseEntity<List<VenderMaster>> getAll() {
		try {
			List<VenderMaster> venderMasters = vmService.getAll();
			return new ResponseEntity<>(venderMasters, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Updates a vendor by its ID.
	 * 
	 * @param sl           The ID of the vendor to update
	 * @param venderMaster The updated vendor object
	 * @return ResponseEntity containing the updated vendor object and HTTP status OK if successful,
	 *         otherwise HTTP status INTERNAL_SERVER_ERROR
	 */
	@PutMapping("/updatebyid/{sl}")
	public ResponseEntity<VenderMaster> update(@PathVariable("sl") int sl, @RequestBody VenderMaster venderMaster) {
		try {
			VenderMaster updatedVenderMaster = vmService.update(sl, venderMaster);
			return new ResponseEntity<>(updatedVenderMaster, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Deletes a vendor by its ID.
	 * 
	 * @param sl The ID of the vendor to delete
	 * @return ResponseEntity with HTTP status NO_CONTENT if successful,
	 *         otherwise HTTP status INTERNAL_SERVER_ERROR
	 */
	@DeleteMapping("/delete/{sl}")
	public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
		try {
			vmService.delete(sl);
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
