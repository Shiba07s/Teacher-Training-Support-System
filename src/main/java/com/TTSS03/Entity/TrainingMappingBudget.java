package com.TTSS03.Entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_component_budgettransaction")
public class TrainingMappingBudget {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long sl;
    private String budgetedyear;
    private String trainingid;
    private String venueid;
    private String vname;
    private String trainingname;
    private String tccode;
    private String tcname;
    private String estimatedbudget;
    private String sanctionedbudget;
    private String additionalbudget;
    private String approvedbudget;
    private String traineerole;
    private String frequency;
    private String unit;
    private String amount;
    private String schedulebudget;
    private String recordstatus;
    private String accounthead;
    private String trainingtype;
    
    ////////////////////////////////////////
    
	public String getAccounthead() {
		return accounthead;
	}
	public void setAccounthead(String accounthead) {
		this.accounthead = accounthead;
	}
	public String getTrainingtype() {
		return trainingtype;
	}
	public void setTrainingtype(String trainingtype) {
		this.trainingtype = trainingtype;
	}
	public String getSchedulebudget() {
		return schedulebudget;
	}
	public void setSchedulebudget(String schedulebudget) {
		this.schedulebudget = schedulebudget;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVenueid() {
		return venueid;
	}
	public void setVenueid(String venueid) {
		this.venueid = venueid;
	}
	public long getSl() {
		return sl;
	}
	public void setSl(long sl) {
		this.sl = sl;
	}
	public String getBudgetedyear() {
		return budgetedyear;
	}
	public void setBudgetedyear(String budgetedyear) {
		this.budgetedyear = budgetedyear;
	}
	public String getTrainingid() {
		return trainingid;
	}
	public void setTrainingid(String trainingid) {
		this.trainingid = trainingid;
	}
	public String getTrainingname() {
		return trainingname;
	}
	public void setTrainingname(String trainingname) {
		this.trainingname = trainingname;
	}
	public String getTccode() {
		return tccode;
	}
	public void setTccode(String tccode) {
		this.tccode = tccode;
	}
	public String getTcname() {
		return tcname;
	}
	public void setTcname(String tcname) {
		this.tcname = tcname;
	}
	public String getEstimatedbudget() {
		return estimatedbudget;
	}
	public void setEstimatedbudget(String estimatedbudget) {
		this.estimatedbudget = estimatedbudget;
	}
	public String getSanctionedbudget() {
		return sanctionedbudget;
	}
	public void setSanctionedbudget(String sanctionedbudget) {
		this.sanctionedbudget = sanctionedbudget;
	}
	public String getAdditionalbudget() {
		return additionalbudget;
	}
	public void setAdditionalbudget(String additionalbudget) {
		this.additionalbudget = additionalbudget;
	}
	public String getApprovedbudget() {
		return approvedbudget;
	}
	public void setApprovedbudget(String approvedbudget) {
		this.approvedbudget = approvedbudget;
	}
	public String getTraineerole() {
		return traineerole;
	}
	public void setTraineerole(String traineerole) {
		this.traineerole = traineerole;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getRecordstatus() {
		return recordstatus;
	}
	public void setRecordstatus(String recordstatus) {
		this.recordstatus = recordstatus;
	}

     


}
