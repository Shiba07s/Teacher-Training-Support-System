package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.SearchSchedule;


public interface SearchScheduleRepository extends JpaRepository<SearchSchedule, String> {
	
	@Query("SELECT ss FROM SearchSchedule ss WHERE ss.ref_planner_id = :ref_planner_id")
	List<SearchSchedule> findByRefId(@Param("ref_planner_id") String ref_planner_id);
	
//	@Query("SELECT ss FROM SearchSchedule ss WHERE ss.ref_planner_id = :ref_planner_id")
//	List<SearchSchedule> findByRefId(@Param("ref_planner_id") int ref_planner_id);


}
