package com.TTSS03.Service;

import java.util.Optional;

import com.TTSS03.Entity.RoleMaster;

public interface RoleMasterService {
	 
	
    RoleMaster createUserRole(RoleMaster roleMaster);
	
	Optional<RoleMaster> findByUsernameAndPassword(String username, String password,String rolename);
	
	boolean checkIfUsernameExists(String username);

}
