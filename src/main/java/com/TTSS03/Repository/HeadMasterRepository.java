package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.HeadMaster;

public interface HeadMasterRepository extends JpaRepository<HeadMaster, Integer> {
	
	@Query(value="SELECT * FROM tbudget_head  WHERE record_status = 'Active'",nativeQuery = true)
    List<HeadMaster> findAllByStatus();

	@Modifying
	@Query("UPDATE HeadMaster c SET c.tccode = :#{#headMaster.tccode}, " +
	       "c.tcnames = :#{#headMaster.tcnames} " +  // Removed comma here
	       "WHERE c.sl = :sl")
	int update(@Param("sl") int sl, @Param("headMaster") HeadMaster headMaster);
	
	@Query("SELECT e FROM HeadMaster e WHERE e.tccode = (SELECT MAX(e2.tccode) FROM HeadMaster e2)")
    Optional<HeadMaster> findEntityByHighestTcCode();

}
