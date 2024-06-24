package com.TTSS03.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.RoleMaster;
import com.TTSS03.Repository.RoleMasterRepository;

@Service
public class RoleMasterServiceImpl implements RoleMasterService {
	

	@Autowired
	 private RoleMasterRepository roleMasterRepo;

	@Override
	public RoleMaster createUserRole(RoleMaster roleMaster) {
		// TODO Auto-generated method stub
		return roleMasterRepo.save(roleMaster);
	}
	
	@Override
	public Optional<RoleMaster> findByUsernameAndPassword(String username, String password,String rolename) {
       return roleMasterRepo.findByUsernameAndPassword(username, password,rolename);
   }
	 
	
	@Override
	public boolean checkIfUsernameExists(String username) {
        return roleMasterRepo.existsByUsername(username);
    }
 

	 
}
