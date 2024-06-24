package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TeacherMaster;
import com.TTSS03.Service.TeacherMasterService;

@RestController
@RequestMapping("/api")
public class TeacherMasterController {

	@Autowired
	private TeacherMasterService teacherMasterService;

	/**
	 * Retrieves the list of all district names.
	 * 
	 * @return ResponseEntity containing the list of district names
	 */
	@GetMapping("/search/districts")
	public ResponseEntity<List<String>> getAllDistrictNameList() {
		List<String> districtName = teacherMasterService.getDistrictNameList();
		return new ResponseEntity<List<String>>(districtName, HttpStatus.OK);
	}

	/**
	 * Retrieves all designations names.
	 * 
	 * @return ResponseEntity containing a list of designations names and HTTP status OK
	 */
	@GetMapping("/designations")
	public ResponseEntity<List<String>> getAllDesignations() {
		List<String> districtName = teacherMasterService.getAllDesignations();
		return new ResponseEntity<List<String>>(districtName, HttpStatus.OK);
	}
	
	
	/**
	 * Retrieves the list of mandal names for a given district.
	 * 
	 * @param district The name of the district
	 * @return List of mandal names
	 */

	@GetMapping("/mandalsa")
	public List<String> getMandalNamesByDistrict(@RequestParam String district) {
		return teacherMasterService.getMandalNamesByDistrict(district);
	}

	/**
	 * Retrieves the list of teachers for a given district and mandal.
	 * 
	 * @param district The name of the district
	 * @param mandal   The name of the mandal
	 * @return ResponseEntity containing the list of teachers
	 */
	@GetMapping("/search/nominations")
	public ResponseEntity<List<Map<String, Object>>> getDistrictMandalteacherList(@RequestParam String district,
			@RequestParam String mandal) {
		List<Map<String, Object>> mandalDistrictTeacher = teacherMasterService.getDistrictMandalTeacher(district,
				mandal);
		return ResponseEntity.ok(mandalDistrictTeacher);
	}

	/**
	 * Finds teachers by their treasury ID.
	 * 
	 * @param treasuryid The treasury ID of the teacher
	 * @return ResponseEntity containing the list of teachers found
	 */
	@GetMapping("/findteacher")
	public ResponseEntity<List<TeacherMaster>> findteacherByTreasuryId(@RequestParam String treasuryid) {
		List<TeacherMaster> byTreasuryId = teacherMasterService.getByTreasuryId(treasuryid);
		return ResponseEntity.ok(byTreasuryId);
	}

	/**
	 * Retrieves the list of all district names.
	 * 
	 * @return ResponseEntity containing the list of district names
	 */
	@GetMapping("/district")
	public ResponseEntity<List<String>> getAllDistrictName() {
		List<String> districtName = teacherMasterService.getDistrictName();
		return new ResponseEntity<List<String>>(districtName, HttpStatus.OK);
	}

	/**
	 * Retrieves the distinct mandal names for a given district.
	 * 
	 * @param district The name of the district
	 * @return List of distinct mandal names
	 */
	@GetMapping("/mandals")
	public List<Object[]> getDistinctMandalNames(@RequestParam String district) {
		return teacherMasterService.getDistinctMandalNamesByDistrict(district);
	}

}
