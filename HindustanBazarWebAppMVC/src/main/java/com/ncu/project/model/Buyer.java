package com.ncu.project.model;

public class Buyer {

	String BuyerID;
	String FullName;
	int Phonenumber;
	String Email;
	String Housenumber;
	String City;
	String State;
	String Hbcredits;
	
	public String getBuyerID() {
		return BuyerID;
	}
	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	public int getPhonenumber() {
		return Phonenumber;
	}
	public void setPhonenumber(int phonenumber) {
		Phonenumber = phonenumber;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getHousenumber() {
		return Housenumber;
	}
	public void setHousenumber(String housenumber) {
		Housenumber = housenumber;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getHbcredits() {
		return Hbcredits;
	}
	public void setHbcredits(String hbcredits) {
		Hbcredits = hbcredits;
	}
	@Override
	public String toString() {
		return "Buyer [BuyerID=" + BuyerID + ", FullName=" + FullName + ", Phonenumber=" + Phonenumber + ", Email="
				+ Email + ", Housenumber=" + Housenumber + ", City=" + City + ", State=" + State + ", Hbcredits="
				+ Hbcredits + "]";
	}
	
	
	
	
}
