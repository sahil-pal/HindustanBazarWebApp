package com.ncu.project.config;

import java.util.logging.Logger;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages="com.ncu.project")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig implements WebMvcConfigurer{
	
	@Autowired
	private Environment env;
	
	@Bean
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;
	}
	
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}


//	@Bean
//	public DataSource dataSource() {
//		
//		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
//		
//		driverManagerDataSource.setDriverClassName(env.getProperty("jdbc.driver"));
//		driverManagerDataSource.setUrl(env.getProperty("jdbc.url"));
//		driverManagerDataSource.setUsername(env.getProperty("jdbc.user"));
//		driverManagerDataSource.setPassword(env.getProperty("jdbc.password"));
//
//		return driverManagerDataSource;
//	}
	
	@Bean
	public DataSource securityDataSource() {
		
		DriverManagerDataSource securityDataSource = new DriverManagerDataSource();
		
		securityDataSource.setDriverClassName(env.getProperty("jdbc.driver"));
		securityDataSource.setUrl(env.getProperty("jdbc.url"));
		securityDataSource.setUsername(env.getProperty("jdbc.user"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));

		return securityDataSource;
	}
}
