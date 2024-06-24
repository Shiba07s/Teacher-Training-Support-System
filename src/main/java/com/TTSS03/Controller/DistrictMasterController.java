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

import com.TTSS03.Service.DistrictMasterService;

@RestController
@RequestMapping("/api")
public class DistrictMasterController {

	@Autowired
	private DistrictMasterService districtMasterService;

	/**
	 * Retrieves all district names.
	 * 
	 * @return ResponseEntity containing a list of all district names
	 */
	@GetMapping("/search/district")
	public ResponseEntity<List<String>> getAllDistrictName() {
		List<String> districtName = districtMasterService.getDistrictNameList();
		return new ResponseEntity<List<String>>(districtName, HttpStatus.OK);
	}

	/**
	 * Retrieves all Mandal names by district.
	 * 
	 * @param district The name of the district
	 * @return List of Mandal names
	 */
	@GetMapping("/mandal")
	public List<String> getMandalNamesByDistrict(@RequestParam String district) {
		return districtMasterService.getMandalNamesByDistrict(district);
	}

	/**
	 * Retrieves district and Mandal teacher list.
	 * 
	 * @param district The name of the district
	 * @param mandal   The name of the Mandal
	 * @return ResponseEntity containing the district and Mandal teacher list
	 */
	@GetMapping("/search/nomination")
	public ResponseEntity<List<Map<String, Object>>> getDistrictMandalteacherList(@RequestParam String district,
			@RequestParam String mandal) {
		List<Map<String, Object>> mandalDistrictTeacher = districtMasterService.getDistrictMandalTeacher(district,
				mandal);
		return ResponseEntity.ok(mandalDistrictTeacher);
	}
}
