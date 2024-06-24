package com.TTSS03.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Service.StagingCalenderService;

@RestController
@RequestMapping("/api")
public class StagingCalenderController {

	@Autowired
	private StagingCalenderService stagingCalenderService;

	
	/**
	 * Uploads a file and saves its data.
	 * 
	 * @param file The file to be uploaded
	 * @return ResponseEntity indicating the success of the upload and data save operation
	 */
	@PostMapping("/upload")
	public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
		try {
			if (file == null || file.isEmpty()) {
				throw new IllegalArgumentException("Invalid file. Please provide a valid file.");
			}

			stagingCalenderService.uploadAndStoreFile(file);
			return ResponseEntity.ok("File uploaded and data saved successfully.");
		} catch (IllegalArgumentException e) {
			return ResponseEntity.badRequest().body("Bad Request: " + e.getMessage());
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Internal Server Error: " + e.getMessage());
		}
	}

}
