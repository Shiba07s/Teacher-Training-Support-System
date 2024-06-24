package com.TTSS03.Login.Service;

import java.util.Optional;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Login.Entity.AdminLogin;
import com.TTSS03.Login.Entity.TreasuryGovt;
import com.TTSS03.Entity.TreasuryGovt1;


import com.TTSS03.Login.Repository.LoginRepository;
import com.TTSS03.Repository.TreasuryGovtEmpRepository;

@Service
public class AuthenticationServiceImpl implements AuthenticationService { 
	@Autowired
	private LoginRepository treasuryGovtRepo;

	@Autowired
	private TreasuryGovtEmpRepository treasuryGovtEmpRepository;

	public Optional<TreasuryGovt> findByTreasuryIdAndMobileNumber(String treasuryid, String mobilenumberteacher) {
	    Optional<TreasuryGovt> optionalTreasuryGovt = treasuryGovtRepo.findByTreasuryIdAndMobileNumber(treasuryid, mobilenumberteacher);
	    System.out.println("Login successful from the second database");

	    // Check if record exists in TreasuryGovtEmpRepository
	    TreasuryGovt1 existingTreasuryIdAndMobileNumber1 = treasuryGovtEmpRepository.findByTreasuryIdAndMobileNumber(treasuryid, mobilenumberteacher);

	    System.out.println(existingTreasuryIdAndMobileNumber1);
	    if (existingTreasuryIdAndMobileNumber1 == null ) {
	        // If no record found in the second database, create a new record
	        TreasuryGovt treasuryGovt = optionalTreasuryGovt.get();

	        TreasuryGovt1 newTreasuryGovt1 = new TreasuryGovt1();
	        newTreasuryGovt1.setAadhar(treasuryGovt.getAadhar());
	        newTreasuryGovt1.setTreasuryid(treasuryGovt.getTreasuryid());
	        newTreasuryGovt1.setMobilenumberteacher(treasuryGovt.getMobilenumberteacher());
	        newTreasuryGovt1.setCmfs_id(treasuryGovt.getCmfs_id());
	        newTreasuryGovt1.setDesignation(treasuryGovt.getDesignation());
	        newTreasuryGovt1.setDisability(treasuryGovt.getDisability());
	        newTreasuryGovt1.setDistrictnamewrk(treasuryGovt.getDistrictnamewrk());
	        newTreasuryGovt1.setDob(treasuryGovt.getDob());
	        newTreasuryGovt1.setEmail(treasuryGovt.getEmail());
	        newTreasuryGovt1.setFathername(treasuryGovt.getFathername());
	        newTreasuryGovt1.setGender(treasuryGovt.getGender());
	        newTreasuryGovt1.setMandalnamewrk(treasuryGovt.getMandalnamewrk());
	        newTreasuryGovt1.setMaritalstatus(treasuryGovt.getMaritalstatus());
	        newTreasuryGovt1.setNature_of_appt(treasuryGovt.getNature_of_appt());
	        newTreasuryGovt1.setSchcd(treasuryGovt.getSchcd());
	        newTreasuryGovt1.setSchool_name(treasuryGovt.getSchool_name());
	        
	        treasuryGovtEmpRepository.save(newTreasuryGovt1);
	    } else {
	    	 // If a record exists in the second database, update it
	        TreasuryGovt treasuryGovt = optionalTreasuryGovt.get();

	        existingTreasuryIdAndMobileNumber1.setAadhar(treasuryGovt.getAadhar());
	        existingTreasuryIdAndMobileNumber1.setTreasuryid(treasuryGovt.getTreasuryid());
	        existingTreasuryIdAndMobileNumber1.setMobilenumberteacher(treasuryGovt.getMobilenumberteacher());
	        existingTreasuryIdAndMobileNumber1.setDistrictnamewrk(treasuryGovt.getDistrictnamewrk());
	        treasuryGovtEmpRepository.save(existingTreasuryIdAndMobileNumber1);
	    }

	    

	    return optionalTreasuryGovt;
	}

	  private static final AdminLogin USER_1 = new AdminLogin("1234561", "1234567891");
	    private static final AdminLogin USER_2 = new AdminLogin("admin02", "admin02");
	    private static final AdminLogin USER_3 = new AdminLogin("1234562", "1234567892");
	    public boolean isValidUser(String username, String password) {
	        return USER_1.getUsername().equals(username) && USER_1.getPassword().equals(password) ||
	               USER_2.getUsername().equals(username) && USER_2.getPassword().equals(password) ||
	               USER_3.getUsername().equals(username) && USER_3.getPassword().equals(password);
	    }
}