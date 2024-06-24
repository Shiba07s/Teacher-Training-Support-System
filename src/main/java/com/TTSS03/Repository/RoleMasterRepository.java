package com.TTSS03.Repository;
 
import java.util.Optional;
 
 
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.RoleMaster;
 
 
public interface RoleMasterRepository extends JpaRepository<RoleMaster, Long> {
	@Query("SELECT t FROM RoleMaster t WHERE t.username = :username AND t.password = :password AND t.rolename= :rolename")
	Optional<RoleMaster> findByUsernameAndPassword(@Param("username") String username,
			                              @Param("rolename") String rolename,
			                             @Param("password") String password);
	
    boolean existsByUsername(String username);

//	@Query("SELECT rm FROM RoleMaster rm WHERE rm.role_name = :role_name")
//	RoleMaster findByRoleName(@Param("role_name") String role_name);
 
	}