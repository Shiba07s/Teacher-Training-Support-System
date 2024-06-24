package com.TTSS03.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TrainingMappingBudget;
import com.TTSS03.Repository.TrainingMappingBudgetRepository;

@Service
public class TrainingMappingBudgetServiceImpl implements TrainingMappingBudgetService {
	
	@Autowired
	private TrainingMappingBudgetRepository trainingMappingRepo;

	@Override
	public List<TrainingMappingBudget> getAllMappingData(String trainingid,
            String venueid) {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findApprovedAndDelivered(trainingid, venueid);
	}
	
//	@Override
//	public List<TrainingMappingBudget> getAllMappingDataSecondLevel() {
//		// TODO Auto-generated method stub
//		return trainingMappingRepo.findApprovedAndDelivered();
//	}
//	
	 public List<TrainingMappingBudget> findDistinctTrainingTransactions() {
	        return trainingMappingRepo.findDistinctTrainingTransactions();
	    }

	@Override
	public List<TrainingMappingBudget> getMappingDataOnTrainingidAndVenueid(String trainingid, String venueid) {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findByTrainingIdAndVenueId(trainingid, venueid);
	}
	
	@Override
	 public List<TrainingMappingBudget> findFirstLevelApproval(String trainingid, String venueid) {
	        return trainingMappingRepo.findFirstLevelApproval(trainingid, venueid);
	    }
	
	@Override
	public List<TrainingMappingBudget> findSecondLevelApproval() {
		return trainingMappingRepo.findDistinctSecondLevelApproval();
	}
	

	
	 @Transactional
	    public void approveTraining(String trainingid, String venueid ,String budgetedyear,String trainingname,String tccode,String tcname,String estimatedbudget,
	    		String sanctionedbudget,String additionalbudget,String approvedbudget,String traineerole,
	    		String frequency,String unit,String amount) {
	        try {
	            int rowsUpdated = trainingMappingRepo.updateTrainingMappingBudget(trainingid, venueid, budgetedyear, trainingname, tccode, tcname, estimatedbudget, sanctionedbudget, additionalbudget, approvedbudget, traineerole, frequency, unit, amount);
	            
	            if (rowsUpdated > 0) {
	                System.out.println("Training approved successfully!");
	            } else {
	                System.out.println("No records updated. Training approval failed.");
	            }
	        } catch (Exception e) {
	            System.err.println("Error updating training mapping budget: " + e.getMessage());
	            // Handle the exception as needed
	        }
	    }
	 

	 @Override
	 @Transactional
	 public void updateSingleMapping(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) {
	     try {
	         for (TrainingMappingBudget updatedMapping : updatedMappings) {
	             TrainingMappingBudget existingMapping = trainingMappingRepo.findById(updatedMapping.getSl()).orElse(null);

	             if (existingMapping != null) {
	                 existingMapping.setRecordstatus(updatedMapping.getRecordstatus());
	                 existingMapping.setApprovedbudget(updatedMapping.getApprovedbudget());

	                 // Update the fields you want to update
//	                 existingMapping.setBudgetedyear(updatedMapping.getBudgetedyear());
//	                 existingMapping.setTrainingname(updatedMapping.getTrainingname());
//	                 existingMapping.setTccode(updatedMapping.getTccode());
//	                 existingMapping.setAdditionalbudget(updatedMapping.getAdditionalbudget());
//	                 existingMapping.setAmount(updatedMapping.getAmount());
//	                 existingMapping.setEstimatedbudget(updatedMapping.getEstimatedbudget());
//	                 existingMapping.setFrequency(updatedMapping.getFrequency());
//	                 existingMapping.setSanctionedbudget(updatedMapping.getSanctionedbudget());
//	                 existingMapping.setRecordstatus(updatedMapping.getRecordstatus());
	                 
	                 // Set other fields as needed

	                 // Save the updated entity
	                 trainingMappingRepo.save(existingMapping);
	             } else {
	                 // Handle the case where the entity does not exist
	                 // You might want to log a message or throw an exception
	             }
	         }
	     } catch (Exception e) {
	         // Handle the exception as needed
	         e.printStackTrace(); // You might want to log the exception
	     }
	 }

	@Override
	 @Transactional
	public void updatestatus(String trainingid, String venueid) {
		// TODO Auto-generated method stub
		trainingMappingRepo.updaterecordstatus(trainingid, venueid);
		
	}
	
	@Override
	@Transactional
	public void updaterecordstatusSecondlevel(String trainingid, String venueid,TrainingMappingBudget trainingMappingBudget) {
		// TODO Auto-generated method stub
		trainingMappingRepo.updaterecordstatusSecondlevel(trainingid, venueid, trainingMappingBudget.getAdditionalbudget(), trainingMappingBudget.getApprovedbudget());
		
	}
	
	
	//second level approval proceess
	 @Override
	 @Transactional
	 public void updaterecordstatusSecondlevel(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappingss) {
	     try {
	         for (TrainingMappingBudget updatedMappingg : updatedMappingss) {
	             TrainingMappingBudget existingMappingg = trainingMappingRepo.findById(updatedMappingg.getSl()).orElse(null);

	             if (existingMappingg != null) {
	                 // Update the fields you want to update
	                 existingMappingg.setAdditionalbudget(updatedMappingg.getAdditionalbudget());
	                 existingMappingg.setApprovedbudget(updatedMappingg.getApprovedbudget());
	                 existingMappingg.setRecordstatus(updatedMappingg.getRecordstatus());

	                 // Save the updated entity
	                 trainingMappingRepo.save(existingMappingg);
	             } else {
	                 // Handle the case where the entity does not exist
	                 // You might want to log a message or throw an exception
	             }
	         }
	     } catch (Exception e) {
	         // Handle the exception as needed
	         e.printStackTrace(); // You might want to log the exception
	     }
	 }

	
	
	
	
	@Override
	public List<TrainingMappingBudget> findByMappingId(long mid) {
		  List<TrainingMappingBudget> findByMId = trainingMappingRepo.findByMId(mid);
		return findByMId;	
		}
	

	
	@Override
	@Transactional
	public void updateTrainingMappingBudgetByid(long mid, TrainingMappingBudget trainingMappingBudget) {
	    trainingMappingRepo.updateTrainingMappingBudgetById(
	            trainingMappingBudget.getSl(),
	            trainingMappingBudget.getBudgetedyear(),
	            trainingMappingBudget.getTrainingname(),
	            trainingMappingBudget.getTccode(),
	            trainingMappingBudget.getTcname(),
	            trainingMappingBudget.getEstimatedbudget(),
	            trainingMappingBudget.getSanctionedbudget(),
	            trainingMappingBudget.getAdditionalbudget(),
	            trainingMappingBudget.getApprovedbudget(),
	            trainingMappingBudget.getTraineerole(),
	            trainingMappingBudget.getFrequency(),
	            trainingMappingBudget.getUnit(),
	            trainingMappingBudget.getAmount(),
	            trainingMappingBudget.getRecordstatus(),
	            mid);
	}

	@Override
	public void updateAllMappings(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) {
		// TODO Auto-generated method stub
		
	}

	@Override
	 public List<Map<String, Object>> findDistinctByTrainingIdAndVenueId(String trainingId, String venueId) {
	        return trainingMappingRepo.findDistinctByTrainingIdAndVenueId(trainingId, venueId);
	    }
	
	@Override
	public List<Map<String, Object>> findDistinctEntries(String trainingId, String venueId) {
		List<Object[]> result = trainingMappingRepo.findDistinctEntries(trainingId, venueId);
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingId", row[1]);
			rowData.put("VenueId", row[2]);
			rowData.put("VenueName", row[3]);
			 
			return rowData;
		}).collect(Collectors.toList());
		
	}
	@Override
	public List<Map<String, Object>> findDistinctEntriesAll( ) {
		List<Object[]> result = trainingMappingRepo.findDistinctEntriesAll();
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingId", row[0]);
			rowData.put("TrainingName", row[1]);

			rowData.put("VenueId", row[2]);
			rowData.put("VenueName", row[3]);

			
			return rowData;
		}).collect(Collectors.toList());
		
	}

	@Override
	public List<TrainingMappingBudget> getAllMappingData1(String trainingid, String venueid) {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findApprovedAndDelivered1(trainingid,  venueid);	
	}

	@Override
	public List<TrainingMappingBudget> findDistinctTrainingAndVenue() {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findAll();
	}
	
	@Override
	public List<String> findAllDistinctVenues(String trainingid) {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findAllDistinctScheduledVenue(trainingid);
	}
 
	@Override
	public List<String> findDistinctTrainings() {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findDistinctTraining();
	}

	
}