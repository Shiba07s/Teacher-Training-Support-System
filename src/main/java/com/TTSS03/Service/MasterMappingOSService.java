package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.MasterMappingOS;

public interface MasterMappingOSService {
	
	
	void saveOneOS(List<MasterMappingOS> mastermappingos);

List<MasterMappingOS>getAllOs(String venueid,String trainingid);
	
	
	void makeStatusInactive(String trainngid,String venueid,String treasuryid);



}
