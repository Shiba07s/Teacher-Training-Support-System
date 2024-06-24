package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.Test;
import com.TTSS03.Service.TestService;

@RestController
public class TestController {

	@Autowired
	TestService testService;

	/**
	 * Saves a test record.
	 * 
	 * @param test The test object to be saved
	 * @return A message indicating the success of the operation
	 */
	@PostMapping("/test")
	public String saveRecord(@RequestBody Test test) {
		testService.saveoneRecord(test);
		return "data saved successfully ! ! !";
	}

}
