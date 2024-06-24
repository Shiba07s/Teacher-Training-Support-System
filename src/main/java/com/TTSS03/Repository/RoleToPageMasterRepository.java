package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.RoleToPageMaster;


public interface RoleToPageMasterRepository extends JpaRepository<RoleToPageMaster, Long> {

	@Query(value = "SELECT role, role_id FROM t_user_roles", nativeQuery = true)
	List<String> getRoleNames();
	
	@Query(value = "SELECT * FROM t_user_roles WHERE role_id = :roleId", nativeQuery = true)
    Optional<RoleToPageMaster> findById(@Param("roleId") long roleId);
	
	
	@Query("SELECT distinct t.description , t.url FROM RoleToPageMaster t" )
	List<String> getDescriptions();
	
	@Query("SELECT t FROM RoleToPageMaster t where t.role=:role" )
	RoleToPageMaster getAllRoles(@Param("role") String role);
	
	
}
