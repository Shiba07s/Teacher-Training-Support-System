package com.TTSS03.Service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TreasuryGovt1;
import com.TTSS03.Repository.TreasuryGovtEmpRepository;

@Service
public class TreasuryGovtServiceimpl implements TreasuryGovtService {

	@Autowired
	TreasuryGovtEmpRepository treasuryGovtEmpRepository;

    @PersistenceContext(unitName = "firstentityManagerFactoryBean")
	private EntityManager entityManager;

	@Override
	public List<TreasuryGovt1> getByTreasuryId(String treasuryid) {
		// TODO Auto-generated method stub
		return treasuryGovtEmpRepository.findByTreasuryId(treasuryid);
	}

	@Override
	public List<String> getDistrictName() {
		return treasuryGovtEmpRepository.findDistinctDistrictnamewrk();
	}

	public List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk) {
		return treasuryGovtEmpRepository.findDistinctMandalNamesByDistrict(districtnamewrk);
	}

	public List<TreasuryGovt1> getTeacherDetails(String district, String mandal, String designation,
			String refPlannerId) {

		// Create JPQL query string
		StringBuilder sqlBuilder = new StringBuilder(
				"SELECT tm.treasuryid, tm.mobileno_teacher, tm.teacher_name, tm.design, tm.dob, tm.district_name, tm.school_name, tm.school_code FROM tteacher_master_update tm WHERE ");

		// List to store conditions
		List<String> conditions = new ArrayList<>();

		if (district != null && !district.isEmpty() && !"null".equals(district.toLowerCase())) {
			conditions.add("tm.district_name = :district");
		}
		if (mandal != null && !mandal.isEmpty() && !"null".equals(mandal.toLowerCase())) {
			conditions.add("tm.mandal_name = :mandal");
		}
		if (designation != null && !designation.isEmpty() && !"null".equals(designation.toLowerCase())) {
			conditions.add("tm.design = :designation");
		}

		sqlBuilder.append(String.join(" AND ", conditions));

		sqlBuilder.append(
				" AND NOT EXISTS ( SELECT 1 FROM mytrainings my WHERE tm.treasuryid = my.treasuryid AND my.ref_planner_id = :refPlannerId)");

		System.out.println(conditions);
		// Append the conditions to the JPQL query builder
		// sqlBuilder.append(String.join(" AND ", conditions));
		System.out.println("SQL Query: " + sqlBuilder.toString());

		Query query = entityManager.createNativeQuery(sqlBuilder.toString());

		if (refPlannerId != null && !refPlannerId.isEmpty() && !"null".equals(refPlannerId.toLowerCase())) {
			query.setParameter("refPlannerId", refPlannerId);
		}

		if (district != null && !district.isEmpty() && !"null".equals(district.toLowerCase())) {
			query.setParameter("district", district);
		}
		if (mandal != null && !mandal.isEmpty() && !"null".equals(mandal.toLowerCase())) {
			query.setParameter("mandal", mandal);
		}
		if (designation != null && !designation.isEmpty() && !"null".equals(designation.toLowerCase())) {
			query.setParameter("designation", designation);
		}

		@SuppressWarnings("unchecked")
		List<Object[]> results = query.getResultList();

		// List<Object[]> result =
		// treasuryGovtEmpRepository.findTeacherDetails(district, mandal, refPlannerId);
		return mapToObject(results);
	}

	private List<TreasuryGovt1> mapToObject(List<Object[]> result) {
		List<TreasuryGovt1> teacherDetailsList = new ArrayList<>();

		for (Object[] row : result) {
			TreasuryGovt1 teacherMaster = new TreasuryGovt1();
			teacherMaster.setTreasuryid((String) row[0]);
			teacherMaster.setMobilenumberteacher((String) row[1]);
			teacherMaster.setTeacher_name((String) row[2]);
			teacherMaster.setDesignation((String) row[3]);
			teacherMaster.setDob((String) row[4]);
			teacherMaster.setDistrictnamewrk((String) row[5]);
			teacherMaster.setSchool_name((String) row[6]);
			teacherMaster.setSchcd((String) row[7]);
			teacherDetailsList.add(teacherMaster);
		}

		return teacherDetailsList;
	}

	@Override
	public List<TreasuryGovt1> getTeacherDetailsbyDistrictAndMandal(String districtnamewrk, String mandalnamewrk) {
		// TODO Auto-generated method stub
		return treasuryGovtEmpRepository.findByDistrictMandal(districtnamewrk, mandalnamewrk);
	}

	@Override
	public List<TreasuryGovt1> filterOnInput(String treasuryid, String schcd, String refPlannerId) {
		// Create JPQL query string
		StringBuilder sqlBuilder = new StringBuilder(
				"SELECT tm.treasuryid, tm.mobileno_teacher, tm.teacher_name, tm.design, tm.dob, tm.district_name, tm.school_name, tm.school_code FROM tteacher_master_update tm WHERE ");

		// List to store conditions
		List<String> conditions = new ArrayList<>();

		if (treasuryid != null && !treasuryid.isEmpty() && !"null".equals(treasuryid.toLowerCase())) {
			conditions.add("tm.treasuryid = :treasuryid");
		}
		if (schcd != null && !schcd.isEmpty() && !"null".equals(schcd.toLowerCase())) {
			conditions.add("tm.school_code = :schcd");
		}

		sqlBuilder.append(String.join(" AND ", conditions));

		sqlBuilder.append(
				" AND NOT EXISTS ( SELECT 1 FROM mytrainings my WHERE tm.treasuryid = my.treasuryid AND my.ref_planner_id = :refPlannerId)");

		System.out.println(conditions);
		// Append the conditions to the JPQL query builder
		// sqlBuilder.append(String.join(" AND ", conditions));
		System.out.println("SQL Query: " + sqlBuilder.toString());

		Query query = entityManager.createNativeQuery(sqlBuilder.toString());

		if (refPlannerId != null && !refPlannerId.isEmpty() && !"null".equals(refPlannerId.toLowerCase())) {
			query.setParameter("refPlannerId", refPlannerId);
		}

		if (treasuryid != null && !treasuryid.isEmpty() && !"null".equals(treasuryid.toLowerCase())) {
			query.setParameter("treasuryid", treasuryid);
		}
		if (schcd != null && !schcd.isEmpty() && !"null".equals(schcd.toLowerCase())) {
			query.setParameter("schcd", schcd);
		}

		@SuppressWarnings("unchecked")
		List<Object[]> results = query.getResultList();

		// List<Object[]> result =
		// treasuryGovtEmpRepository.findTeacherDetails(district, mandal, refPlannerId);
		return mapToObject(results);
	}

}
