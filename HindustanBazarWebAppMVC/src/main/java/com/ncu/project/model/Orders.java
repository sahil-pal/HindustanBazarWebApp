package com.ncu.project.model;

public class Orders {

	String BuyerID;
	int totalItems;
	String DateOfPurchase;
	float TotalAmount;
	int Trackstatus;
	
	public String getBuyerID() {
		return BuyerID;
	}
	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}
	public String getDateOfPurchase() {
		return DateOfPurchase;
	}
	public void setDateOfPurchase(String dateOfPurchase) {
		DateOfPurchase = dateOfPurchase;
	}
	public float getTotalAmount() {
		return TotalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		TotalAmount = totalAmount;
	}
	public int getTrackstatus() {
		return Trackstatus;
	}
	public void setTrackstatus(int trackstatus) {
		Trackstatus = trackstatus;
	}
	@Override
	public String toString() {
		return "Orders [BuyerID=" + BuyerID + ", totalItems=" + totalItems + ", DateOfPurchase=" + DateOfPurchase
				+ ", TotalAmount=" + TotalAmount + ", Trackstatus=" + Trackstatus + "]";
	}
	
	
	
	
	
}
