package com.ncu.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		
		UserBuilder users = User.withDefaultPasswordEncoder();
		
//		auth.inMemoryAuthentication()
//			.withUser(users.username("sahil").password("sahil").roles("SELLER","BUYER"))
//			.withUser(users.username("pal").password("pal").roles("BUYER"));
//		
		auth.jdbcAuthentication().dataSource(securityDataSource);
		
	}
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		
	
		http
		.authorizeRequests()
		.antMatchers("/resources/**")
        .permitAll()
		.antMatchers("/registeruser").anonymous()
		.antMatchers("/registerthisUser").anonymous()
		.antMatchers("/SellerProducts").hasRole("SELLER")
		.antMatchers("/addproduct").hasRole("SELLER")
		.antMatchers("/addThisProduct").hasRole("SELLER")
		.antMatchers("/receivedFeedbacks").hasRole("SELLER")
		.anyRequest().authenticated()
		.and()
		.formLogin()
		.loginPage("/LoginPage")
		.loginProcessingUrl("/AuthenticationOfUser")
		.defaultSuccessUrl("/")
		.permitAll()
		.and()
        .csrf().disable()
		.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/LoginPage")
		.permitAll()
		.and()
		.exceptionHandling().accessDeniedPage("/Accessdenied");
		
		
	}

	
}
