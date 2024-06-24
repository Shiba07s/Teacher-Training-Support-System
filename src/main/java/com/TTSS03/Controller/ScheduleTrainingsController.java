package com.TTSS03.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Service.ScheduleTrainingsService;

@RestController
@RequestMapping("/api")
public class ScheduleTrainingsController {

	@Autowired
	ScheduleTrainingsService scheduleTrainingsService;

	/**
	 * Saves one or more training schedules.
	 * 
	 * @param scheduleTrainings List of schedule training objects to be saved
	 * @return ResponseEntity indicating the success of the operation
	 */
	@PostMapping("/schedule")
	public ResponseEntity<String> scheduleOneTraining(@RequestBody List<ScheduleTrainings> scheduleTrainings) {
		scheduleTrainingsService.saveOneTraining(scheduleTrainings);
		return ResponseEntity.ok("saved Successfully");
	}

	/**
	 * Retrieves all scheduled trainings.
	 * 
	 * @param scheduleTrainings Object containing parameters for filtering scheduled
	 *                          trainings
	 * @return ResponseEntity containing the list of scheduled trainings
	 */
	@GetMapping("/scheduledTrainings")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainings(ScheduleTrainings scheduleTrainings) {

		List<ScheduleTrainings> trainings = scheduleTrainingsService.getAllScheduledTrainings(scheduleTrainings);
		return ResponseEntity.ok(trainings);

	}

	/**
	 * Retrieves a specific training schedule by its reference planner ID and venue
	 * ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @param venue_id       The venue ID
	 * @return ResponseEntity containing the requested training schedule
	 */
	@GetMapping("/fetchScheduledTrainingById")
	public ResponseEntity<Optional<ScheduleTrainings>> getTraining(
			@RequestParam("ref_planner_id") String ref_planner_id, @RequestParam("venue_id") String venue_id) {
		Optional<ScheduleTrainings> training = scheduleTrainingsService.getScheduledTrainings(ref_planner_id, venue_id);
		return ResponseEntity.ok(training);
	}
	
	/**
	 * Retrieves a specific training schedule by its reference planner ID and venue
	 * ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @param venue_id       The venue ID
	 * @return ResponseEntity containing the requested training schedule
	 */
	@GetMapping("/filterbasedsearch")
	public ResponseEntity<List<ScheduleTrainings>> filterBasedSearch(
			@RequestParam("ref_planner_id") String ref_planner_id, @RequestParam("venue_id") String venue_id) {
		if (ref_planner_id == null || ref_planner_id.isEmpty()) {
			ref_planner_id = "null";
		}
		if (venue_id == null || venue_id.isEmpty()) {
			venue_id = "null";
		}
		List<ScheduleTrainings> training = scheduleTrainingsService.filterBasedSearch(ref_planner_id, venue_id);
		return ResponseEntity.ok(training);
	}

	/**
	 * Retrieves all scheduled trainings within a specified year and month.
	 * 
	 * @param tyear  The year
	 * @param tmonth The month
	 * @return ResponseEntity containing the list of scheduled trainings
	 */
	@GetMapping("/scheduledTraining/year/month")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainingsBetweenYearAndMonth(@RequestParam String tyear,
			@RequestParam String tmonth) {

		List<ScheduleTrainings> training = scheduleTrainingsService.getAllTrainingsBetweenYearAndMonth(tyear, tmonth);
		return ResponseEntity.ok(training);

	}

	@GetMapping("/scheduledTrainings1")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainings1(ScheduleTrainings scheduleTrainings) {

		List<ScheduleTrainings> trainings = scheduleTrainingsService.getAllScheduledTrainings1(scheduleTrainings);
		return ResponseEntity.ok(trainings);

	}

	/**
	 * Retrieves all scheduled trainings by their reference planner ID and venue ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @param venue_id       The venue ID
	 * @return ResponseEntity containing the list of scheduled trainings
	 */
	@GetMapping("/scheduledTrainingsbyid")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainingsbyid(@RequestParam String ref_planner_id,
			@RequestParam String venue_id) {

		List<ScheduleTrainings> allScheduledTrainingsbyid = scheduleTrainingsService
				.getAllScheduledTrainingsbyTidVid(ref_planner_id, venue_id);
		return ResponseEntity.ok(allScheduledTrainingsbyid);

	}

	/**
	 * Retrieves all scheduled trainings by their reference planner ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @return ResponseEntity containing the list of scheduled trainings
	 */
	@GetMapping("/scheduledTrainingsbytid")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainingsbyid(@RequestParam String ref_planner_id) {

		List<ScheduleTrainings> allScheduledTrainingsbyid = scheduleTrainingsService
				.getAllScheduledTrainingsbyTid(ref_planner_id);
		return ResponseEntity.ok(allScheduledTrainingsbyid);

	}

	/**
	 * Updates a scheduled training by its reference planner ID and venue ID.
	 * 
	 * @param ref_planner_id    The reference planner ID
	 * @param venue_id          The venue ID
	 * @param scheduleTrainings The updated schedule training object
	 * @return ResponseEntity indicating the success of the update operation
	 */
	@PutMapping("/updateScheduledTraining")
	public ResponseEntity<String> updateTraining(@RequestParam("ref_planner_id") String ref_planner_id,
			@RequestParam("venue_id") String venue_id, @RequestBody ScheduleTrainings scheduleTrainings) {

		try {
			scheduleTrainingsService.updateScheduledTraining(ref_planner_id, venue_id, scheduleTrainings);
			return ResponseEntity.ok("Training updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Venue: " + e.getMessage());
		}
	}

	/**
	 * Deletes a scheduled training by its reference planner ID and venue ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @param venue_id       The venue ID
	 * @return ResponseEntity indicating the success of the delete operation
	 */
	@DeleteMapping("/deleteScheduledTraining")
	public ResponseEntity<String> deleteTraining(@RequestParam("ref_planner_id") String ref_planner_id,
			@RequestParam("venue_id") String venue_id) {
		try {
			scheduleTrainingsService.deleteScheduledTraining(ref_planner_id, venue_id);
			return ResponseEntity.ok("Training deleted successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deleting Venue: " + e.getMessage());
		}
	}

	/**
	 * Retrieves all scheduled trainings between a specified apply start date and
	 * training end date.
	 * 
	 * @param apply_start_dt  The apply start date
	 * @param training_end_dt The training end date
	 * @return ResponseEntity containing the list of scheduled trainings
	 */
	@GetMapping("/scheduledTraining/apply_start_dt/training_end_dt")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainingsBetweenYearAndMonthIn(
			@RequestParam String apply_start_dt, @RequestParam String training_end_dt) {

		List<ScheduleTrainings> training = scheduleTrainingsService.getAllTrainingsBetweenYearAndMonthIn(apply_start_dt,
				training_end_dt);
		return ResponseEntity.ok(training);

	}

	/**
	 * Retrieves all distinct training names.
	 * 
	 * @return ResponseEntity containing the list of distinct training names
	 */
	@GetMapping("/distinct/trainings")
	public ResponseEntity<List<String>> getAllDistinctTrainings() {
		List<String> findDistinctTrinings = scheduleTrainingsService.findDistinctTrinings();
		return ResponseEntity.ok(findDistinctTrinings);

	}

	/**
	 * Retrieves all distinct venues for a specific reference planner ID.
	 * 
	 * @param ref_planner_id The reference planner ID
	 * @return ResponseEntity containing the list of distinct venues
	 */
	@GetMapping("/distinct/venue")
	public ResponseEntity<List<String>> getAllDistinctVenue(@RequestParam String ref_planner_id) {
		List<String> findDistinctvenue = scheduleTrainingsService.findDistinctvenue(ref_planner_id);
		return ResponseEntity.ok(findDistinctvenue);
	}

	/**
	 * Retrieves all scheduled training data by status Active.
	 * 
	 * @return ResponseEntity containing the list of distinct venues
	 */
	@GetMapping("/get/schedule")
	public ResponseEntity<List<ScheduleTrainings>> getAllTrainingsData() {
		List<ScheduleTrainings> alltrainingsData = scheduleTrainingsService.getAlltrainingsData();
		return ResponseEntity.ok(alltrainingsData);
	}
}
