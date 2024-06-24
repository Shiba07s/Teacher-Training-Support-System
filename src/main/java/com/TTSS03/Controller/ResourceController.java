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

import com.TTSS03.Entity.Resource;
import com.TTSS03.Service.ResourceService;

@RestController
@RequestMapping("/api")
public class ResourceController {
	@Autowired
	private ResourceService resourceService;

	
	/**
	 * Retrieves resources based on the provided criteria.
	 * 
	 * @param resource The criteria for searching resources
	 * @return ResponseEntity containing the list of matching resources
	 */
	@GetMapping("/search/resource")
	public ResponseEntity<List<Resource>> getResource(Resource resource) {
		List<Resource> allResouceData = resourceService.getAllResouceData(resource);
		return new ResponseEntity<List<Resource>>(allResouceData, HttpStatus.OK);
	}

	
	/**
	 * Creates a new resource type.
	 * 
	 * @param resource The resource type to be created
	 * @return ResponseEntity indicating the success of the operation
	 */
	@PostMapping("/create/resourceType")
	public ResponseEntity<Resource> createOneresourceType(@RequestBody Resource resource) {
		Resource saveresource = resourceService.saveOneSpell(resource);
		return ResponseEntity.ok(saveresource);

	}

	/**
	 * Updates the resource type.
	 * 
	 * @param resourcecode The code of the resource type to be updated
	 * @param resourcetype The updated resource type
	 * @return ResponseEntity indicating the success of the operation
	 */
	@PutMapping("/updateResourceType/{resourcecode}")
	public ResponseEntity<String> updateResourceType(@PathVariable("resourcecode") long resourcecode,
			@RequestParam("resourcetype") String resourcetype) {

		try {
			resourceService.updateResourceType(resourcecode, resourcetype);
			return ResponseEntity.ok("Training Resource Type updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Resource Type: " + e.getMessage());
		}
	}

	
	/**
	 * Deactivates a resource type.
	 * 
	 * @param resourcecode The code of the resource type to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteResourceType/{resourcecode}")
	public ResponseEntity<String> deActivateResourcrType(@PathVariable long resourcecode) {

		try {
			resourceService.deActivateResourceType(resourcecode);
			return ResponseEntity.ok("Training Resource Type De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating Resource type:" + e.getMessage());
		}

	}

	
	/**
	 * Retrieves a resource by its code.
	 * 
	 * @param resourcecode The code of the resource to retrieve
	 * @return ResponseEntity containing the retrieved resource
	 */
	@GetMapping("/getReesourceCodeByid/{resourcecode}")
	public ResponseEntity<Resource> getMnagementcodebyId(@PathVariable("resourcecode") long resourcecode) {
		Resource resource = resourceService.findByResourceId(resourcecode);
		return ResponseEntity.ok(resource);
	}

}