package com.ncu.project.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.ncu.project.validation.Password;

public class User {
	
	@Size(min=3,message="Minimum size 3 required")  
	String username;
	
	@Password
	String password;
	
		
	String Name;
	
	@NotNull(message="phone number is required")
	@Pattern(regexp= "[0-9]{10}", message="Enter valid phone number")
	String PhoneNumber;
	
	String BuyerHouseNo;
	String Buyercity;
	String State;
	
	@NotNull(message="Please Select from the AccountType !")
	String AccountType;
	
	String UserEmailID;
	

	public String getAccountType() {
		return AccountType;
	}
	public void setAccountType(String accountType) {
		AccountType = accountType;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getBuyerHouseNo() {
		return BuyerHouseNo;
	}
	public void setBuyerHouseNo(String buyerHouseNo) {
		BuyerHouseNo = buyerHouseNo;
	}
	public String getBuyercity() {
		return Buyercity;
	}
	public void setBuyercity(String buyercity) {
		Buyercity = buyercity;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserEmailID() {
		return UserEmailID;
	}
	public void setUserEmailID(String userEmailID) {
		UserEmailID = userEmailID;
	}

	
	

}
