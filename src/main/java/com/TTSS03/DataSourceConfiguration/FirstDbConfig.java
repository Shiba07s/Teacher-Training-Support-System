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
							entityManagerFactoryRef = "firstentityManagerFactoryBean",
							basePackages = {"com.TTSS03.Repository"},
							transactionManagerRef = "firsttransactionManager"
		)

public class FirstDbConfig {
	
	@Autowired
	private Environment environment;
	
	@Bean
	@Primary
	public DriverManagerDataSource dataSource() {
		System.out.println("first db connection");
		 DriverManagerDataSource dataSource = new DriverManagerDataSource();
		 
		 dataSource.setUrl(environment.getProperty("spring.datasource.url"));
		 dataSource.setUsername(environment.getProperty("spring.datasource.username"));
		 dataSource.setPassword(environment.getProperty("spring.datasource.password"));
		 dataSource.setDriverClassName(environment.getProperty("spring.datasource.driver-class-name"));		
		return dataSource;
				
	}
	
	@Bean(name="firstentityManagerFactoryBean")
	@Primary
	public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean() {	
		LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
		bean.setDataSource(dataSource());	
		JpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
		bean.setJpaVendorAdapter(adapter);
		Map<String,String> props=new HashMap<>();
		props.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		props.put("hibernate.show_sql", "true");
        bean.setJpaPropertyMap(props);		
		bean.setPackagesToScan("com.TTSS03.Entity");
		return bean;
		
	}
	
	@Primary
	@Bean(name="firsttransactionManager")
	public PlatformTransactionManager transactionManager() {	
		JpaTransactionManager manager = new JpaTransactionManager();
		manager.setEntityManagerFactory(entityManagerFactoryBean().getObject());
		return manager;		
	}

}
