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

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Service.SearchVenueService;

@RestController
@RequestMapping("/api")
public class SearchVenueController {

	@Autowired
	private SearchVenueService searchVenueService;

	/**
	 * Retrieves all venues based on search criteria.
	 * 
	 * @param searchVenue The search criteria for venues
	 * @return ResponseEntity containing the list of venues
	 */
	@GetMapping("/search/venue")
	public ResponseEntity<List<SearchVenue>> findAllVenue(SearchVenue searchVenue) {

		List<SearchVenue> venue = searchVenueService.findAllVenue(searchVenue);

		return ResponseEntity.ok(venue);

	}

	/**
	 * Finds a venue by venue ID.
	 * 
	 * @param vid The ID of the venue to find
	 * @return ResponseEntity containing the list of venues matching the ID
	 */
	@GetMapping("/search/venueId")
	public ResponseEntity<List<SearchVenue>> findVenue(@RequestParam String vid) {

		List<SearchVenue> venue = searchVenueService.findByVenueid(vid);

		return ResponseEntity.ok(venue);

	}

	/**
	 * Creates a new venue.
	 * 
	 * @param searchVenue The venue to be created
	 * @return ResponseEntity containing the saved venue
	 */
	@PostMapping("/create/venue")
	public ResponseEntity<SearchVenue> createOneVenue(@RequestBody SearchVenue Searchvenue) {
		SearchVenue saveOnevenue = searchVenueService.saveOnevenue(Searchvenue);
		return ResponseEntity.ok(saveOnevenue);

	}

	/**
	 * Updates a venue by venue ID.
	 * 
	 * @param vid         The ID of the venue to be updated
	 * @param searchVenue The updated venue information
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateVenue/{vid}")
	public ResponseEntity<String> updatevenue(@PathVariable("vid") String vid, @RequestBody SearchVenue Searchvenue) {

		try {
			searchVenueService.updatevenue(vid, Searchvenue);
			return ResponseEntity.ok("Venue updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Venue: " + e.getMessage());
		}
	}

	/**
	 * Deactivates a venue by venue ID.
	 * 
	 * @param vid The ID of the venue to be deactivated
	 * @return ResponseEntity indicating the success of the deactivation operation
	 */
	@DeleteMapping("/deleteVenue/{vid}")
	public ResponseEntity<String> deActivateVenue(@PathVariable String vid) {

		try {
			searchVenueService.deActivatevenue(vid);
			return ResponseEntity.ok("Venue De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating Venue:" + e.getMessage());
		}
	}

	/**
	 * Fetches a venue by venue ID.
	 * 
	 * @param vid The ID of the venue to fetch
	 * @return The venue object
	 */
	@GetMapping("/fetchVenueById/{vid}")
	public SearchVenue fetchVenueById(@PathVariable String vid) {
		// Assume VenueService is a service class that provides methods to fetch venue
		// data
		SearchVenue svenue = searchVenueService.getVenueById(vid);
		return svenue;
	}
}
