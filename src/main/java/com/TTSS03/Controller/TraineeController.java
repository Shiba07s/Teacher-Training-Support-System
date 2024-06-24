package com.TTSS03.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TraineeController {

	/**
	 * Displays the main menu for trainees.
	 * 
	 * @return The view name for the main menu page
	 */
	@RequestMapping("/trainee")
	public String traineeMenu() {
		return "mainFrameTrainee";
	}

	/**
	 * Displays the trainee side notification page.
	 * 
	 * @return The view name for the trainee notification page
	 */
	@RequestMapping("/apply")
	public String traineeSide() {
		return "TraineeNotification";
	}

	/**
	 * Displays the trainee application form page.
	 * 
	 * @return The view name for the trainee application form page
	 */
	@RequestMapping("/application-form")
	public String getApplicationForm() {
		return "TraineeApply";
	}

}
