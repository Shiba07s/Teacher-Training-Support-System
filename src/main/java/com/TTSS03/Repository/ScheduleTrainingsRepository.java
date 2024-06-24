package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Entity.ViewMyTrainings;

public interface ScheduleTrainingsRepository extends JpaRepository<ScheduleTrainings, Integer> {

	@Query("SELECT ss FROM ScheduleTrainings ss WHERE ss.ref_planner_id = :ref_planner_id and ss.venue_id=:venue_id")
	List<ScheduleTrainings> findByTidVid(@Param("ref_planner_id") String ref_planner_id,
			@Param("venue_id") String venue_id);

	@Query("SELECT sv FROM ScheduleTrainings sv WHERE sv.ref_planner_id = :ref_planner_id")
	List<ScheduleTrainings> findByTid(@Param("ref_planner_id") String ref_planner_id);

//	 @Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.apply_end_dt")
//	    List<ScheduleTrainings> findTrainingBetweenApplyDates();

	@Query("SELECT t FROM ScheduleTrainings t WHERE t.tyear= :tyear and t.tmonth=:tmonth")
	List<ScheduleTrainings> findTrainingBetweenMonthYear(@Param("tyear") String year, @Param("tmonth") String tmonth);

	@Query("SELECT t FROM ScheduleTrainings t WHERE t.ref_planner_id = ?1 AND t.venue_id = ?2")
	Optional<ScheduleTrainings> findByRefPlannerIdAndVenueId(String ref_planner_id, String venue_id);

	@Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.training_start_dt AND t.record_status = 'Active'")
	List<ScheduleTrainings> findTrainingBetweenApplyStartDateToTrainingStartdate();

	@Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.apply_end_dt AND t.record_status = 'Active'")
	List<ScheduleTrainings> findTrainingBetweenApplyDates();

	@Modifying
	@Transactional
	@Query("UPDATE ScheduleTrainings s SET " + "s.tmonth = :#{#scheduleTrainings.tmonth}, "
			+ "s.tyear = :#{#scheduleTrainings.tyear}, " + "s.tname = :#{#scheduleTrainings.tname}, "
			+ "s.tdescription = :#{#scheduleTrainings.tdescription}, "
			+ "s.venue_name = :#{#scheduleTrainings.venue_name}, "
			+ "s.training_start_dt = :#{#scheduleTrainings.training_start_dt}, "
			+ "s.training_end_dt = :#{#scheduleTrainings.training_end_dt}, "
			+ "s.apply_start_dt = :#{#scheduleTrainings.apply_start_dt}, "
			+ "s.apply_end_dt = :#{#scheduleTrainings.apply_end_dt}, "
			+ "s.maplocation = :#{#scheduleTrainings.maplocation}, " + "s.vaddress = :#{#scheduleTrainings.vaddress}, "
			+ "s.tmode = :#{#scheduleTrainings.tmode}, " + "s.tgrade = :#{#scheduleTrainings.tgrade}, "
			+ "s.state = :#{#scheduleTrainings.state}, " + "s.district = :#{#scheduleTrainings.district}, "
			+ "s.mandal = :#{#scheduleTrainings.mandal}, "
			+ "s.coordinatorname = :#{#scheduleTrainings.coordinatorname}, "
			+ "s.coordinatoremailid = :#{#scheduleTrainings.coordinatoremailid}, "
			+ "s.coordinatormobileno = :#{#scheduleTrainings.coordinatormobileno}, "
			+ "s.tagency = :#{#scheduleTrainings.tagency}, " + "s.tmodule = :#{#scheduleTrainings.tmodule}, "
			+ "s.resourcetype = :#{#scheduleTrainings.resourcetype}, "
			+ "s.schedulebudget = :#{#scheduleTrainings.schedulebudget}, "
			+ "s.bankname = :#{#scheduleTrainings.bankname}, "
			+ "s.accountholdername = :#{#scheduleTrainings.accountholdername}, "
			+ "s.ifsccode = :#{#scheduleTrainings.ifsccode} "
			+ "WHERE s.ref_planner_id = :ref_planner_id AND s.venue_id = :venue_id")
	void updateTraining(@Param("ref_planner_id") String ref_planner_id, @Param("venue_id") String venue_id,
			@Param("scheduleTrainings") ScheduleTrainings scheduleTrainings);

	@Modifying
	@Query("UPDATE ScheduleTrainings t SET t.record_status = 'Inactive' WHERE t.ref_planner_id = :ref_planner_id AND t.venue_id = :venue_id")
	void deactivateTraining(@Param("ref_planner_id") String ref_planner_id, @Param("venue_id") String venue_id);

	@Query("SELECT tt FROM ScheduleTrainings tt "
			+ "WHERE (:apply_start_dt BETWEEN FUNCTION('DATE_FORMAT', tt.apply_start_dt, '%Y-%m-01') AND LAST_DAY(tt.apply_start_dt)) "
			+ "OR (:training_end_dt BETWEEN FUNCTION('DATE_FORMAT', tt.training_end_dt, '%Y-%m-01') AND LAST_DAY(tt.training_end_dt))")
	List<ScheduleTrainings> findByDateRange(@Param("apply_start_dt") String apply_start_dt,
			@Param("training_end_dt") String training_end_dt);

	@Query("SELECT distinct t.venue_id,t.venue_name FROM ScheduleTrainings t where t.ref_planner_id = :ref_planner_id ")
	List<String> findAllDistinctScheduledVenue(@Param("ref_planner_id") String ref_planner_id);

	@Query("SELECT distinct t.ref_planner_id,t.tname FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.training_start_dt")
	List<String> findDistinctTrainingBetweenApplyStartDatesToTrainingStartdates();

	@Query("SELECT distinct t.ref_planner_id,t.tname FROM ScheduleTrainings t WHERE t.record_status = 'Active'")
	List<String> findAllActiveTrainings();

	@Query("SELECT sv FROM ScheduleTrainings sv WHERE sv.record_status = 'Active'")
	List<ScheduleTrainings> findByRecordStatus(@Param("record_status") String record_status);

	@Modifying
	@Query("UPDATE ScheduleTrainings t SET t.record_status = 'Inactive' WHERE t.ref_planner_id = :ref_planner_id")
	void deactivateTrainingByRedPlannerId(@Param("ref_planner_id") String ref_planner_id);

}
