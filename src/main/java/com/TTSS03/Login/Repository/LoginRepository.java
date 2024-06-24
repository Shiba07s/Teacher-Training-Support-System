package com.TTSS03.Login.Repository;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Login.Entity.TreasuryGovt;


public interface LoginRepository extends JpaRepository<TreasuryGovt, Long> {
	
	@Query("SELECT t FROM TreasuryGovt t WHERE t.treasuryid = :treasuryid AND t.mobilenumberteacher = :mobilenumberteacher")
	Optional<TreasuryGovt> findByTreasuryIdAndMobileNumber(@Param("treasuryid") String treasuryid,
			@Param("mobilenumberteacher") String mobilenumberteacher);

}
