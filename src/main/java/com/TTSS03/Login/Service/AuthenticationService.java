 package com.TTSS03.Login.Service;

import java.util.Optional;

import com.TTSS03.Login.Entity.TreasuryGovt;



public interface AuthenticationService {
	
	Optional<TreasuryGovt> findByTreasuryIdAndMobileNumber(String treasuryid, String mobilenumberteacher);
	 
	boolean isValidUser(String username, String password);

}
