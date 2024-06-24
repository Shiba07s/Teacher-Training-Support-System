package com.TTSS03.Entity;
 
 
 
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name ="t_credential_master")
public class RoleMaster {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long slno;
    @Column(name="role_name")
    private String rolename;
    @Column(name="user_name")
    private String username;
    private String password;
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
    
     
	
}