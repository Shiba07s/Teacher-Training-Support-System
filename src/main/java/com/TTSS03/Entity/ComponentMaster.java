package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bdg_component_master ")
public class ComponentMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private long sl;
	    private String resources;
	    
	    @Column(name="resource_type")
	    private String resourceType;
	    private String description;
	    
	    @Column(name="created_by")
	    private String createdBy;
	    
	    @Column(name="modified_by")
	    private String modifiedBy;
	    
	    @Column(name="resource_code")
	    private String resourceCode;
	   
	    @Column(name="record_status")
	    private String recordStatus="Active";

		public long getSl() {
			return sl;
		}

		public void setSl(long sl) {
			this.sl = sl;
		}

		public String getResources() {
			return resources;
		}

		public void setResources(String resources) {
			this.resources = resources;
		}

		public String getResourceType() {
			return resourceType;
		}

		public void setResourceType(String resourceType) {
			this.resourceType = resourceType;
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

		public String getModifiedBy() {
			return modifiedBy;
		}

		public void setModifiedBy(String modifiedBy) {
			this.modifiedBy = modifiedBy;
		}

		public String getRecordStatus() {
			return recordStatus;
		}

		public void setRecordStatus(String recordStatus) {
			this.recordStatus = recordStatus;
		}

		public String getResourceCode() {
			return resourceCode;
		}

		public void setResourceCode(String resourceCode) {
			this.resourceCode = resourceCode;
		}
	    

}
