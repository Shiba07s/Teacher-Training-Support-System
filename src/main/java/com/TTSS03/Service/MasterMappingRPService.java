package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.MasterMappingRP;

public interface MasterMappingRPService {
	
	void saveOneRP(List<MasterMappingRP> mastermappingrp);


List<MasterMappingRP>getAllRp(String trainngid,String venueid);
	
	
	void makeStatusInactive(String trainngid,String venueid,String treasuryid);

}
