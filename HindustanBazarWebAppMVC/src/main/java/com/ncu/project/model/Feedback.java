package com.ncu.project.model;

public class Feedback {

	String BuyerID;
	String ProductName;
	String SellerName;
	String SellerLocation;
	String Review;
	String dateOfPost;
	
	public String getBuyerID() {
		return BuyerID;
	}
	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}
	
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getSellerName() {
		return SellerName;
	}
	public void setSellerName(String sellerName) {
		SellerName = sellerName;
	}
	public String getSellerLocation() {
		return SellerLocation;
	}
	public void setSellerLocation(String sellerLocation) {
		SellerLocation = sellerLocation;
	}
	public String getReview() {
		return Review;
	}
	public void setReview(String review) {
		Review = review;
	}
	public String getDateOfPost() {
		return dateOfPost;
	}
	public void setDateOfPost(String dateOfPost) {
		this.dateOfPost = dateOfPost;
	}
	@Override
	public String toString() {
		return "Feedback [BuyerID=" + BuyerID + ", ProductName=" + ProductName + ", SellerName=" + SellerName
				+ ", SellerLocation=" + SellerLocation + ", Review=" + Review + ", dateOfPost=" + dateOfPost + "]";
	}
	
	
	
	
}
