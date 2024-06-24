package com.TTSS03.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Repository.ScheduleTrainingsRepository;

@Service
public class ScheduleTrainingsServiceImpl implements ScheduleTrainingsService {
	
	@Autowired
	private ScheduleTrainingsRepository ScheduleTrainingsRepo;
	
	private static final Logger logger = LogManager.getLogger(ScheduleTrainingsServiceImpl.class);
	
    @PersistenceContext(unitName = "firstentityManagerFactoryBean")
	private EntityManager entityManager;

	@Override
	public List<ScheduleTrainings> saveOneTraining(List<ScheduleTrainings> scheduleTrainings) {
		// TODO Auto-generated method stub
		return ScheduleTrainingsRepo.saveAll(scheduleTrainings);
		
	}

	@Override
	public List<ScheduleTrainings> getAllScheduledTrainings(ScheduleTrainings scheduleTrainings) {
		// TODO Auto-generated method stub
		
		List<ScheduleTrainings> findTrainingBetweenApplyDates = ScheduleTrainingsRepo.findTrainingBetweenApplyDates();
		return findTrainingBetweenApplyDates;
	}
	
	 public List<ScheduleTrainings> getAllTrainingsBetweenYearAndMonth(String tmonth,String tyear){
			List<ScheduleTrainings> findTrainingBetweenMonthYear = ScheduleTrainingsRepo.findTrainingBetweenMonthYear(tmonth, tyear);
			
			return findTrainingBetweenMonthYear;
			
		}
	 
	 @Override
		public List<ScheduleTrainings> getAllScheduledTrainings1(ScheduleTrainings scheduleTrainings) {
			List<ScheduleTrainings> findAll = ScheduleTrainingsRepo.findTrainingBetweenApplyStartDateToTrainingStartdate();
			return findAll;
		}

		@Override
		public List<ScheduleTrainings> getAllScheduledTrainingsbyTidVid(String ref_planner_id,String venue_id) {
			// TODO Auto-generated method stub
			return ScheduleTrainingsRepo.findByTidVid(ref_planner_id,venue_id);
		}
		
		@Override
		public List<ScheduleTrainings> getAllScheduledTrainingsbyTid(String ref_planner_id) {
			// TODO Auto-generated method stub
			return ScheduleTrainingsRepo.findByTid(ref_planner_id);
		}
		
		@Override
		public Optional<ScheduleTrainings> getScheduledTrainings(String ref_planner_id, String venue_id) {
			try {
				// Call the repository method to fetch scheduled trainings
				Optional<ScheduleTrainings> scheduledTrainings = ScheduleTrainingsRepo
						.findByRefPlannerIdAndVenueId(ref_planner_id, venue_id);
	 
				// Return the fetched data
				return scheduledTrainings;
			} catch (Exception ex) {
				// Log the exception
				logger.error("An error occurred while fetching scheduled trainings: {}", ex.getMessage());
	 
				// Handle the exception (e.g., throw custom exception, return empty optional,
				// etc.)
				// Here, returning empty optional as an example
				return Optional.empty();
			}
		}
	 
		@Override
		@Transactional
		public void updateScheduledTraining(String ref_planner_id, String venue_id, ScheduleTrainings scheduleTrainings) {
			// TODO Auto-generated method stub
			System.out.println(ref_planner_id + "" + venue_id + "" + scheduleTrainings);
			ScheduleTrainingsRepo.updateTraining(ref_planner_id, venue_id, scheduleTrainings);
		}
	 
		@Override
		@Transactional
		public void deleteScheduledTraining(String ref_planner_id, String venue_id) {
			// TODO Auto-generated method stub
			ScheduleTrainingsRepo.deactivateTraining(ref_planner_id, venue_id);
	 
		}
		
		public List<ScheduleTrainings> getAllTrainingsBetweenYearAndMonthIn(String training_end_dt,String apply_start_dt){
			List<ScheduleTrainings> findTrainingBetweenMonthYear = ScheduleTrainingsRepo.findByDateRange(apply_start_dt, training_end_dt);
			
			return findTrainingBetweenMonthYear;
			
		}
		
		@Override
		public List<String> findDistinctvenue(String ref_planner_id) {
			// TODO Auto-generated method stub
			return ScheduleTrainingsRepo.findAllDistinctScheduledVenue(ref_planner_id);
		}
 
		@Override
		public List<String> findDistinctTrinings() {
			// TODO Auto-generated method stub
			return ScheduleTrainingsRepo.findAllActiveTrainings();
		}
		
		@Override
		public List<ScheduleTrainings> getAlltrainingsData() {
		    return ScheduleTrainingsRepo.findByRecordStatus("Active");
//			return ScheduleTrainingsRepo.findAll();
		}

		@Override
		public List<ScheduleTrainings> filterBasedSearch(String ref_planner_id, String venue_id) {
			// TODO Auto-generated method stub
			System.out.println("ref_planner_id: " + ref_planner_id + ", venue_id: " + venue_id );

			
			// Check if both ref_planner_id and venue_id are null or empty
		    if ((ref_planner_id == null || ref_planner_id.isEmpty() || "null".equalsIgnoreCase(ref_planner_id)) &&
		        (venue_id == null || venue_id.isEmpty() || "null".equalsIgnoreCase(venue_id))) {
		        // Both parameters are null or empty, so create and execute another query without WHERE clause
		        String jpqlAllEntities = "SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.apply_end_dt AND t.record_status = 'Active'";
		        TypedQuery<ScheduleTrainings> queryAllEntities = entityManager.createQuery(jpqlAllEntities, ScheduleTrainings.class);
		        List<ScheduleTrainings> allEntities = queryAllEntities.getResultList();
		        for (ScheduleTrainings training : allEntities) {
		            System.out.println(training.toString());
		        }
		        return allEntities;
		    }
		    
		    
			// Create JPQL query string
			StringBuilder sqlBuilder = new StringBuilder("SELECT t FROM ScheduleTrainings t  WHERE ");

			// List to store conditions
			List<String> conditions = new ArrayList<>();

			// Append conditions for non-null parameters
			if (ref_planner_id != null && !ref_planner_id.isEmpty() && !"null".equals(ref_planner_id.toLowerCase())) {
				conditions.add("ref_planner_id = :ref_planner_id");
			}
			if (venue_id != null && !venue_id.isEmpty() && !"null".equals(venue_id.toLowerCase())) {
				conditions.add("venue_id = :venue_id");
			}
			
			conditions.add("CURDATE() BETWEEN t.apply_start_dt AND t.apply_end_dt");
		    conditions.add("t.record_status = 'Active'");

			System.out.println(conditions);
			// Append the conditions to the JPQL query builder
			sqlBuilder.append(String.join(" AND ", conditions));
			System.out.println("SQL Query: " + sqlBuilder.toString());

			// Create the JPQL query
			Query query = entityManager.createQuery(sqlBuilder.toString());
			// Set parameter values for non-null parameters
			if (ref_planner_id != null && !ref_planner_id.isEmpty() && !"null".equals(ref_planner_id.toLowerCase())) {
				query.setParameter("ref_planner_id", ref_planner_id);
			}
			if (venue_id != null && !venue_id.isEmpty() && !"null".equals(venue_id.toLowerCase())) {
				query.setParameter("venue_id", venue_id);
			}

			// Execute the query
			@SuppressWarnings("unchecked")
			List<ScheduleTrainings> results = query.getResultList();
	
			return results;
		}
		

}
