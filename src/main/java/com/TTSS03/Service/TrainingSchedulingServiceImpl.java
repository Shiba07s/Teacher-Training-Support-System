package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TrainingScheduling;
import com.TTSS03.Repository.TrainingSchedulingRepository;

@Service
public class TrainingSchedulingServiceImpl implements TrainingSchedulingService {
	@Autowired
	private TrainingSchedulingRepository trainingSchedulingRepository;

	@Override
	public TrainingScheduling createTraining(TrainingScheduling trainingScheduling) {
		// TODO Auto-generated method stub
		return trainingSchedulingRepository.save(trainingScheduling);
	}

	@Override
	public List<TrainingScheduling> findAllScheduleTrainings() {
		// TODO Auto-generated method stub
		return trainingSchedulingRepository.findAll();
	}

	@Override
	public TrainingScheduling findAllScheduleTrainingsById(String ref_planner_id) {
		// TODO Auto-generated method stub
		return trainingSchedulingRepository.getTrainingById(ref_planner_id);
	}

	@Override
	public boolean existOrNot(String ref_planner_id) {
		// TODO Auto-generated method stub
		return trainingSchedulingRepository.getTrainingsById(ref_planner_id);
	}

}