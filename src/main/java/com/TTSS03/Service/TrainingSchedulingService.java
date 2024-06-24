package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TrainingScheduling;
 
public interface TrainingSchedulingService {
 
	TrainingScheduling createTraining(TrainingScheduling trainingScheduling);
	List<TrainingScheduling>findAllScheduleTrainings();
	TrainingScheduling findAllScheduleTrainingsById(String ref_planner_id);
 
	boolean existOrNot(String ref_planner_id);
}