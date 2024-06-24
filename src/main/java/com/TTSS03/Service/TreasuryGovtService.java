package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TreasuryGovt1;

public interface TreasuryGovtService {

	List<TreasuryGovt1> getByTreasuryId(String treasuryid);

	List<String> getDistrictName();

	List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk);

	List<TreasuryGovt1> getTeacherDetails(String district, String mandal, String refPlannerId, String refPlannerId2);

	List<TreasuryGovt1> getTeacherDetailsbyDistrictAndMandal(String districtnamewrk, String mandalnamewrk);

	List<TreasuryGovt1> filterOnInput(String treasuryid, String schcd, String refPlannerId);

	//List<String> getAllDesignations();

}
