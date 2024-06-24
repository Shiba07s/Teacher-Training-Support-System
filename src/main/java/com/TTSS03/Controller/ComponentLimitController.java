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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.ComponentLimit;
import com.TTSS03.Entity.ComponentMaster;
import com.TTSS03.Entity.HeadMaster;
import com.TTSS03.Service.ComponentLimitService;

@RestController
@RequestMapping("/api")
public class ComponentLimitController {

	@Autowired
	ComponentLimitService ComponentLimitServ;

	/**
	 * Retrieves resources and rates based on the given resource names.
	 * 
	 * @param resourceNames The list of resource names
	 * @return List of Object arrays containing resources and rates
	 */
	@GetMapping("/resources-and-rates")
	public List<Object[]> getResourcesAndRates(@RequestParam List<String> resourceNames) {
		return ComponentLimitServ.getResourcesAndRatesByNames(resourceNames);
	}

	/**
	 * Creates a new component limit.
	 * 
	 * @param componentLimit The component limit to create
	 * @return ResponseEntity containing the created component limit
	 */
	@PostMapping("/savecomponentlimit")
	public ResponseEntity<ComponentLimit> create(@RequestBody ComponentLimit componentLimit) {
		try {
			ComponentLimit saveComponentLimit = ComponentLimitServ.saveOne(componentLimit);
			return ResponseEntity.ok(saveComponentLimit);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves a component limit by its ID.
	 * 
	 * @param sl The ID of the component limit to retrieve
	 * @return ResponseEntity containing the requested component limit
	 */
	@GetMapping("/getbycomponentid/{sl}")
	public ResponseEntity<ComponentLimit> getById(@PathVariable("sl") long sl) {
		try {
			Optional<ComponentLimit> componentLimitOptional = ComponentLimitServ.getById(sl);
			return componentLimitOptional.map(componentLimit -> ResponseEntity.ok().body(componentLimit))
					.orElse(ResponseEntity.notFound().build());
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves all component limits by their status.
	 * 
	 * @return ResponseEntity containing a list of component limits
	 */
	@GetMapping("/getallcomponentsbystatus")
	public ResponseEntity<List<ComponentLimit>> getAllByStatus() {
		try {
			List<ComponentLimit> componentLimits = ComponentLimitServ.getAllByStatus();
			return ResponseEntity.ok(componentLimits);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Retrieves all component limits.
	 * 
	 * @return ResponseEntity containing a list of component limits
	 */
	@GetMapping("/getallcomponents")
	public ResponseEntity<List<ComponentLimit>> getAll() {
		try {
			List<ComponentLimit> componentLimits = ComponentLimitServ.getAll();
			return ResponseEntity.ok(componentLimits);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Updates a component limit.
	 * 
	 * @param sl             The ID of the component limit to update
	 * @param componentLimit The updated component limit
	 * @return ResponseEntity indicating the success or failure of the update
	 *         operation
	 */
	@PutMapping("/updatecomponent/{sl}")
	public ResponseEntity<String> update(@PathVariable("sl") long sl, @RequestBody ComponentLimit componentLimit) {
		try {
			ComponentLimit updatedComponentLimit = ComponentLimitServ.update(sl, componentLimit);
			return ResponseEntity.ok("ok");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/**
	 * Deletes a component limit.
	 * 
	 * @param sl The ID of the component limit to delete
	 * @return ResponseEntity indicating the success or failure of the deletion
	 *         operation
	 */
	@DeleteMapping("/deletecomponent/{sl}")
	public ResponseEntity<Void> delete(@PathVariable("sl") long sl) {
		try {
			ComponentLimitServ.delete(sl);
			return ResponseEntity.noContent().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

}
