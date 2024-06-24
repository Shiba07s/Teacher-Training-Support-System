package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.RoleToPageMaster;
import com.TTSS03.Repository.RoleToPageMasterRepository;



@Service
public class RoleToPageMasterServiceImpl implements RoleToPageMasterService {

	@Autowired
	private RoleToPageMasterRepository roleToPageMasterRepository;

	@Override
	public List<String> getRoleNames() {
		return roleToPageMasterRepository.getRoleNames();
	}

	@Override
	public Optional<RoleToPageMaster> getRoleDetails(long roleId) {
		// TODO Auto-generated method stub
		return roleToPageMasterRepository.findById(roleId);
	}

	@Override
	public List<String> getDescriptions() {
		// TODO Auto-generated method stub
		return roleToPageMasterRepository.getDescriptions();
	}

	@Override
	public RoleToPageMaster saveOneRole(RoleToPageMaster roleToPageMaster) {
	   // String roleName = roleToPageMaster.getRole();
	    
	    // Check if the role already exists in the database
	       RoleToPageMaster allRoles = roleToPageMasterRepository.getAllRoles(roleToPageMaster.getRole());
	    
	    if (allRoles != null) {
	        // Update the existing role
	    	allRoles.setUrl(roleToPageMaster.getUrl()); // Update other fields if needed
	    	//allRoles.setRole(roleToPageMaster.getRole());
	    	allRoles.setAcademicCalender(roleToPageMaster.getAcademicCalender());
	    	allRoles.setBudget(roleToPageMaster.getBudget());
	    	allRoles.setDashboard(roleToPageMaster.getDashboard());
	    	allRoles.setMasterMapping(roleToPageMaster.getMasterMapping());
	    	allRoles.setMasterSetup(roleToPageMaster.getMasterSetup());
	    	allRoles.setViewTrainings(roleToPageMaster.getViewTrainings());
	    	allRoles.setTrainingToVenueMapping(roleToPageMaster.getTrainingToVenueMapping());
	    	allRoles.setScheduleTraining(roleToPageMaster.getScheduleTraining());
	    	allRoles.setWaitingForApproval(roleToPageMaster.getWaitingForApproval());
	    	allRoles.setApprovedTrainees(roleToPageMaster.getApprovedTrainees());
	    	allRoles.setRejectedTrainees(roleToPageMaster.getRejectedTrainees());
	    	allRoles.setNomination(roleToPageMaster.getNomination());
	    	allRoles.setBudgetApproval(roleToPageMaster.getBudgetApproval());
	    	
	    	
	        return roleToPageMasterRepository.save(allRoles);
	    } else {
	        // Save the new role
	        return roleToPageMasterRepository.save(roleToPageMaster);
	    }
	}


}
