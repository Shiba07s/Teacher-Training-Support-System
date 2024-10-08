package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mytrainings")
public class ViewMyTrainings {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slno;
	private String treasuryid;	
	private String tname;
	private String tdescription;
	private String tmode;
	private String startdate;
	private String enddate;
	private String tagency;
	private String trainername;
	private String vname;
	private String vaddress;
	private String maplocation;
	private String vcontact;
	private String status="waiting for approval";
	private String resourcetype;
	private String remarks;
	private String secondlevelapproval;
	private String appliedtype="self";
	@Column(name="ref_planner_id")
	private String ref_planner_id;
	private String vid;
	private String designation;
	private String mobilenumberteacher;
	private String teacher_name;
	private String dob;
	private String district_name;
	private String school_code;
	private String school_name;

	private String tstarttime;
	private String tendtime;
	//private String applydateandtime;
	
	
	
	
	
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
 
	public String getMobilenumberteacher() {
		return mobilenumberteacher;
	}
	public void setMobilenumberteacher(String mobilenumberteacher) {
		this.mobilenumberteacher = mobilenumberteacher;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}
	public String getSchool_code() {
		return school_code;
	}
	public void setSchool_code(String school_code) {
		this.school_code = school_code;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getTagency() {
		return tagency;
	}
	public void setTagency(String tagency) {
		this.tagency = tagency;
	}
	public String getTrainername() {
		return trainername;
	}
	public void setTrainername(String trainername) {
		this.trainername = trainername;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getMaplocation() {
		return maplocation;
	}
	public void setMaplocation(String maplocation) {
		this.maplocation = maplocation;
	}
	public String getVcontact() {
		return vcontact;
	}
	public void setVcontact(String vcontact) {
		this.vcontact = vcontact;
	}
	public String getResourcetype() {
		return resourcetype;
	}
	public void setResourcetype(String resourcetype) {
		this.resourcetype = resourcetype;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSecondlevelapproval() {
		return secondlevelapproval;
	}
	public void setSecondlevelapproval(String secondlevelapproval) {
		this.secondlevelapproval = secondlevelapproval;
	}
	public String getAppliedtype() {
		return appliedtype;
	}
	public void setAppliedtype(String appliedtype) {
		this.appliedtype = appliedtype;
	}
	public String getRef_planner_id() {
		return ref_planner_id;
	}
	public void setRef_planner_id(String ref_planner_id) {
		this.ref_planner_id = ref_planner_id;
	}
 
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTstarttime() {
		return tstarttime;
	}
	public void setTstarttime(String tstarttime) {
		this.tstarttime = tstarttime;
	}
	public String getTendtime() {
		return tendtime;
	}
	public void setTendtime(String tendtime) {
		this.tendtime = tendtime;
	}
	
	
	
	
}
