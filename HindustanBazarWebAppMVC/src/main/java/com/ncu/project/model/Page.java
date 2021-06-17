package com.ncu.project.model;

import java.util.ArrayList;
import java.util.List;

public class Page {

	String category;
	String location = "All Over NCR";
	List<String> categoryNames = new ArrayList<String>();
	List<String> locationNames = new ArrayList<String>();
	int ProductID;
	int SellerID;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public List<String> getCategoryNames() {
		return categoryNames;
	}
	public void setCategoryNames(List<String> categoryNames) {
		this.categoryNames = categoryNames;
	}
	public List<String> getLocationNames() {
		return locationNames;
	}
	public void setLocationNames(List<String> locationNames) {
		this.locationNames = locationNames;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public int getSellerID() {
		return SellerID;
	}
	public void setSellerID(int sellerID) {
		SellerID = sellerID;
	}
	
	@Override
	public String toString() {
		return "Page [category=" + category + ", location=" + location + ", categoryNames=" + categoryNames
				+ ", locationNames=" + locationNames + ", ProductID=" + ProductID + ", SellerID=" + SellerID + "]";
	}
	
	
	
	
	
}
