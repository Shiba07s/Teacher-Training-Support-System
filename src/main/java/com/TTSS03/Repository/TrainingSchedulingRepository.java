package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.TrainingScheduling;

public interface TrainingSchedulingRepository extends JpaRepository<TrainingScheduling, Integer> {

	@Query("SELECT ts FROM TrainingScheduling ts WHERE ts.ref_planner_id = :ref_planner_id")
	TrainingScheduling getTrainingById(@Param("ref_planner_id") String ref_planner_id);

	@Query("SELECT CASE WHEN COUNT(ts) > 0 THEN true ELSE false END FROM TrainingScheduling ts WHERE ts.ref_planner_id = :ref_planner_id")
	Boolean getTrainingsById(@Param("ref_planner_id") String ref_planner_id);

	@Modifying
    @Query("UPDATE TrainingScheduling e SET e.record_status = 'Inactive' WHERE e.ref_planner_id = :ref_planner_id")
    void deactivateTraining(@Param("ref_planner_id") String ref_planner_id);

}
