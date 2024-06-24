package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.RoleToPageMaster;


public interface RoleToPageMasterService {

	List<String> getRoleNames();
	List<String> getDescriptions();

	Optional<RoleToPageMaster> getRoleDetails(long roleId);
	
	RoleToPageMaster saveOneRole(RoleToPageMaster roleToPageMaster);
}
