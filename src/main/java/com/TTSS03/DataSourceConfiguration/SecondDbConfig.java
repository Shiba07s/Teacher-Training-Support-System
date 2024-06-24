package com.TTSS03.DataSourceConfiguration;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
							entityManagerFactoryRef = "secondEntityManagerFactoryBean",
							basePackages = {"com.TTSS03.Login.Repository"},
							transactionManagerRef = "secondTransactionManager"
		)
public class SecondDbConfig {

	
	@Autowired
	private Environment environment;
	
	@Bean
	@Primary
	public DriverManagerDataSource dataSource1() {
		
		 System.out.println("second db connection");
		
		 DriverManagerDataSource dataSource = new DriverManagerDataSource();
		 
		 dataSource.setUrl(environment.getProperty("second.datasource.url"));
		 dataSource.setUsername(environment.getProperty("second.datasource.username"));
		 dataSource.setPassword(environment.getProperty("second.datasource.password"));
		 dataSource.setDriverClassName(environment.getProperty("second.datasource.driver-class-name"));		
		return dataSource;
				
	}
	
	@Bean(name="secondEntityManagerFactoryBean")
	@Primary
	public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean() {	
		LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
		bean.setDataSource(dataSource1());	
		JpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		bean.setJpaVendorAdapter(adapter);
		Map<String,String> props=new HashMap<>();
		//props.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		props.put("hibernate.show_sql", "true");
        bean.setJpaPropertyMap(props);		
		bean.setPackagesToScan("com.TTSS03.Login.Entity");
		return bean;
		
	}
	
	@Primary
	@Bean(name="secondTransactionManager")
	public PlatformTransactionManager transactionManager() {	
		JpaTransactionManager manager = new JpaTransactionManager();
		manager.setEntityManagerFactory(entityManagerFactoryBean().getObject());
		return manager;		
	}


}
