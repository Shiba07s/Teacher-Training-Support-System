package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.BudgetMapping;

public interface BudgetMappingService {
	
    public void saveBudgetMappings(List<BudgetMapping>  budgetMappings,String trainingid,String budgetedyear,String trainingname,String venueid,String vname,String schedulebudget, String trainingtype, String accounthead) ;

}
