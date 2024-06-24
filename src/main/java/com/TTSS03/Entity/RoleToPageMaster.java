package com.TTSS03.Entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_user_roles")
public class RoleToPageMaster {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "role_id")
	    private long roleId;
	 
	    @Column(name = "role")
	    private String role;
	 
	    @Column(name = "trainee_flag")
	    private Boolean traineeFlag;
	 
	    @Column(name = "trainer")
	    private Boolean trainer;
	 
	    @Column(name = "t_cordinator")
	    private Boolean coordinator;
	 
	    @Column(name = "t_admin")
	    private Boolean admin;
	 
	    @Column(name = "t_approver")
	    private Boolean approver;
	 
	    @Column(name = "t_reviewer")
	    private Boolean reviewer;
	 
	    @Column(name = "url")
	    private String url;
	    private String description;
	 
	    @Column(name = "created_by")
	    private String createdBy;
	 
	    @Column(name = "created_dt")
	    private LocalDateTime createdDt;
	 
	    @Column(name = "modified_by")
	    private String modifiedBy;
	 
	    @Column(name = "modified_dt")
	    private LocalDateTime modifiedDt;
	 
	    @Column(name = "record_status")
	    private Character recordStatus;

	    
	    
	    
	    @Column(name="dashboard")
	    private String dashboard="No";

	    @Column(name="master_setup")
	    private String masterSetup="No";

	    @Column(name = "academic_calender")
	    private String academicCalender="No";

	    @Column(name="schedule_training")
	    private String scheduleTraining="No";

	    @Column(name="training_to_venue_mapping")
	    private String trainingToVenueMapping="No";

	    @Column(name="budget")
	    private String budget="No";

	    @Column(name="view_trainings")
	    private String viewTrainings="No";

	    @Column(name="master_mapping")
	    private String masterMapping="No";
	    
	    @Column(name = "waiting_for_approval")
	    private String waitingForApproval="NO";

	    @Column(name = "approved_trainees")
	    private String approvedTrainees="NO";

	    @Column(name = "rejected_trainees")
	    private String rejectedTrainees="NO";

	    @Column(name = "nomination")
	    private String nomination="NO";

	    @Column(name = "budget_approval")
	    private String budgetApproval="NO";
	    
	    
		

		public String getWaitingForApproval() {
			return waitingForApproval;
		}

		public void setWaitingForApproval(String waitingForApproval) {
			this.waitingForApproval = waitingForApproval;
		}

		public String getApprovedTrainees() {
			return approvedTrainees;
		}

		public void setApprovedTrainees(String approvedTrainees) {
			this.approvedTrainees = approvedTrainees;
		}

		public String getRejectedTrainees() {
			return rejectedTrainees;
		}

		public void setRejectedTrainees(String rejectedTrainees) {
			this.rejectedTrainees = rejectedTrainees;
		}

		public String getNomination() {
			return nomination;
		}

		public void setNomination(String nomination) {
			this.nomination = nomination;
		}

		public String getBudgetApproval() {
			return budgetApproval;
		}

		public void setBudgetApproval(String budgetApproval) {
			this.budgetApproval = budgetApproval;
		}

		public String getDashboard() {
			return dashboard;
		}

		public void setDashboard(String dashboard) {
			this.dashboard = dashboard;
		}

		public String getMasterSetup() {
			return masterSetup;
		}

		public void setMasterSetup(String masterSetup) {
			this.masterSetup = masterSetup;
		}

		

		public String getAcademicCalender() {
			return academicCalender;
		}

		public void setAcademicCalender(String academicCalender) {
			this.academicCalender = academicCalender;
		}

		public String getScheduleTraining() {
			return scheduleTraining;
		}

		public void setScheduleTraining(String scheduleTraining) {
			this.scheduleTraining = scheduleTraining;
		}

		public String getTrainingToVenueMapping() {
			return trainingToVenueMapping;
		}

		public void setTrainingToVenueMapping(String trainingToVenueMapping) {
			this.trainingToVenueMapping = trainingToVenueMapping;
		}

		public String getBudget() {
			return budget;
		}

		public void setBudget(String budget) {
			this.budget = budget;
		}

		public String getViewTrainings() {
			return viewTrainings;
		}

		public void setViewTrainings(String viewTrainings) {
			this.viewTrainings = viewTrainings;
		}

		public String getMasterMapping() {
			return masterMapping;
		}

		public void setMasterMapping(String masterMapping) {
			this.masterMapping = masterMapping;
		}

		public long getRoleId() {
			return roleId;
		}

		public void setRoleId(long roleId) {
			this.roleId = roleId;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public Boolean getTraineeFlag() {
			return traineeFlag;
		}

		public void setTraineeFlag(Boolean traineeFlag) {
			this.traineeFlag = traineeFlag;
		}

		public Boolean getTrainer() {
			return trainer;
		}

		public void setTrainer(Boolean trainer) {
			this.trainer = trainer;
		}

		public Boolean getCoordinator() {
			return coordinator;
		}

		public void setCoordinator(Boolean coordinator) {
			this.coordinator = coordinator;
		}

		public Boolean getAdmin() {
			return admin;
		}

		public void setAdmin(Boolean admin) {
			this.admin = admin;
		}

		public Boolean getApprover() {
			return approver;
		}

		public void setApprover(Boolean approver) {
			this.approver = approver;
		}

		public Boolean getReviewer() {
			return reviewer;
		}

		public void setReviewer(Boolean reviewer) {
			this.reviewer = reviewer;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getCreatedBy() {
			return createdBy;
		}

		public void setCreatedBy(String createdBy) {
			this.createdBy = createdBy;
		}

		public LocalDateTime getCreatedDt() {
			return createdDt;
		}

		public void setCreatedDt(LocalDateTime createdDt) {
			this.createdDt = createdDt;
		}

		public String getModifiedBy() {
			return modifiedBy;
		}

		public void setModifiedBy(String modifiedBy) {
			this.modifiedBy = modifiedBy;
		}

		public LocalDateTime getModifiedDt() {
			return modifiedDt;
		}

		public void setModifiedDt(LocalDateTime modifiedDt) {
			this.modifiedDt = modifiedDt;
		}

		public Character getRecordStatus() {
			return recordStatus;
		}

		public void setRecordStatus(Character recordStatus) {
			this.recordStatus = recordStatus;
		}

		 
 
	}