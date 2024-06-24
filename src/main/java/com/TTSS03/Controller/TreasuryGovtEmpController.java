package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TreasuryGovt1;
import com.TTSS03.Service.TreasuryGovtService;
@RestController
@RequestMapping("/api")
public class TreasuryGovtEmpController {
	
	@Autowired
	TreasuryGovtService treasuryGovtService;
	
	/**
	 * Retrieves teachers by treasury ID.
	 * 
	 * @param treasuryid The treasury ID of the teachers to retrieve
	 * @return ResponseEntity containing a list of TreasuryGovt objects and HTTP status OK
	 */
	@GetMapping("/findteachers")
	public ResponseEntity<List<TreasuryGovt1>> findteacherByTreasuryId(@RequestParam String treasuryid) {
		List<TreasuryGovt1> byTreasuryId = treasuryGovtService.getByTreasuryId(treasuryid);

		return ResponseEntity.ok(byTreasuryId);
	}

	/**
	 * Retrieves all district names.
	 * 
	 * @return ResponseEntity containing a list of district names and HTTP status OK
	 */
	@GetMapping("/districtss")
	public ResponseEntity<List<String>> getAllDistrictName() {
		List<String> districtName = treasuryGovtService.getDistrictName();
		return new ResponseEntity<List<String>>(districtName, HttpStatus.OK);
	}

	/**
	 * Retrieves distinct mandal names by district.
	 * 
	 * @param district The name of the district
	 * @return A list of Object arrays containing distinct mandal names
	 */
	@GetMapping("/mandalss")
	public List<Object[]> getDistinctMandalNames(@RequestParam String district) {
		return treasuryGovtService.getDistinctMandalNamesByDistrict(district);
	}

	
	/**
	 * Retrieves teachers by district, mandal, and reference planner ID.
	 * 
	 * @param district     The name of the district
	 * @param mandal       The name of the mandal
	 * @param refPlannerId The reference planner ID
	 * @return ResponseEntity containing a list of TreasuryGovt objects and HTTP status OK
	 */
	@GetMapping("/details")
	public ResponseEntity<List<TreasuryGovt1>> getTeachers(@RequestParam("district") String district,
			@RequestParam("mandal") String mandal,@RequestParam("designation") String designation, @RequestParam("refPlannerId") String refPlannerId) {

		if (district == null || district.isEmpty()) {
			district = "null";
		}
		if (mandal == null || mandal.isEmpty()) {
			mandal = "null";
		}
		if (designation == null || designation.isEmpty()) {
			designation = "null";
		}
		List<TreasuryGovt1> teachers = treasuryGovtService.getTeacherDetails(district, mandal,designation, refPlannerId);
		return new ResponseEntity<>(teachers, HttpStatus.OK);
	}
	
	@GetMapping("/filteroninput")
	public ResponseEntity<List<TreasuryGovt1>> filterOnInput(@RequestParam("treasuryid") String treasuryid,
			@RequestParam("schcd") String schcd,@RequestParam("refPlannerId") String refPlannerId) {

		if (treasuryid == null || treasuryid.isEmpty()) {
			treasuryid = "null";
		}
		if (schcd == null || schcd.isEmpty()) {
			schcd = "null";
		}
		List<TreasuryGovt1> teachers = treasuryGovtService.filterOnInput(treasuryid, schcd, refPlannerId);
		return new ResponseEntity<>(teachers, HttpStatus.OK);
	}

	/**
	 * Retrieves teachers by district name and mandal name.
	 * 
	 * @param districtnamewrk The name of the district
	 * @param mandalnamewrk   The name of the mandal
	 * @return ResponseEntity containing a list of TreasuryGovt objects and HTTP status OK
	 */
	@GetMapping("/district/mandal/teachers")
	public ResponseEntity<List<TreasuryGovt1>> getTeachersByDistrictAndMandal(
			@RequestParam("districtnamewrk") String districtnamewrk,
			@RequestParam("mandalnamewrk") String mandalnamewrk) {

		List<TreasuryGovt1> teacherDetailsbyDistrictAndMandal = treasuryGovtService
				.getTeacherDetailsbyDistrictAndMandal(mandalnamewrk, districtnamewrk);
		return ResponseEntity.ok(teacherDetailsbyDistrictAndMandal);
	}

}
