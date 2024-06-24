package com.TTSS03.Service;


import java.util.List;
import java.util.Map;

import com.TTSS03.Entity.MasterMappingCC;

public interface MasterMappingCCService {
	
	Map<String, List<?>> getMasterMappingDetails(String trainingId, String venueId);
	
	void saveOneCC(List<MasterMappingCC> mastermappingcc);
	
	List<MasterMappingCC>getAllCC(String venueid,String trainingid);
	
	MasterMappingCC getByTreasuryId(String trainngid,String venueid,String treasuryid);
	
	void makeStatusInactive(String trainngid,String venueid,String treasuryid);


}
