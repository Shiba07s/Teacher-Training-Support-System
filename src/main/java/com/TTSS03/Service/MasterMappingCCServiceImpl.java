package com.TTSS03.Service;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.MasterMappingCC;
import com.TTSS03.Repository.MasterMappingACCRepository;
import com.TTSS03.Repository.MasterMappingCCRepository;
import com.TTSS03.Repository.MasterMappingOSRepository;
import com.TTSS03.Repository.MasterMappingPPRepository;
import com.TTSS03.Repository.MasterMappingRPRepository;


@Service
public class MasterMappingCCServiceImpl implements MasterMappingCCService {
	
	
	@Autowired
	private MasterMappingCCRepository masterMappingCCRepo;
	
	  
	    @Autowired
	    private MasterMappingACCRepository accRepository;

	    @Autowired
	    private MasterMappingRPRepository rpRepository;

	    @Autowired
	    private MasterMappingOSRepository osRepository;

	    @Autowired
	    private MasterMappingPPRepository ppRepository;

	    @Override
	    public Map<String, List<?>> getMasterMappingDetails(String trainingId, String venueId) {
	        Map<String, List<?>> resultMap = new HashMap<>();

	        resultMap.put("Co-ordinator Details", masterMappingCCRepo.findBystatus(trainingId, venueId));
	        resultMap.put("Asst. Co-ordinator Details", accRepository.findBystatus(trainingId, venueId));
	        resultMap.put("Trainer Details", rpRepository.findBystatus(trainingId, venueId));
	        resultMap.put("Office Staff Details", osRepository.findBystatus(trainingId, venueId));
	        resultMap.put("Participants Details", ppRepository.findBystatus(trainingId, venueId));

	        return resultMap;
	    }

	@Override
	public void saveOneCC(List<MasterMappingCC> mastermappingcc) {
		// TODO Auto-generated method stub
		masterMappingCCRepo.saveAll(mastermappingcc);
		
	}

	@Override
	public List<MasterMappingCC> getAllCC(String trainingid,String venueid) { 
		// TODO Auto-generated method stub
		return masterMappingCCRepo.findBystatus(trainingid, venueid);
	}

	@Override
	public MasterMappingCC getByTreasuryId(String trainngid, String venueid, String treasuryid) {
		// TODO Auto-generated method stub
		return masterMappingCCRepo.findByTrainingIdAndVenueIdAndCCTreasuryId(trainngid, venueid, treasuryid);
	}

	@Override
	@Transactional
	public void makeStatusInactive(String trainngid, String venueid, String treasuryid) {
		// TODO Auto-generated method stub
		masterMappingCCRepo.deactivateStatus(trainngid, venueid, treasuryid);
		
	}

}
