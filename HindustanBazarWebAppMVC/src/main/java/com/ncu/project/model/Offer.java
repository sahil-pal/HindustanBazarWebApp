package com.ncu.project.model;

public class Offer {

	String OfferID;
	String OfferName;
	String OfferImg;
	
	public String getOfferID() {
		return OfferID;
	}
	public void setOfferID(String offerID) {
		OfferID = offerID;
	}
	public String getOfferName() {
		return OfferName;
	}
	public void setOfferName(String offerName) {
		OfferName = offerName;
	}
	public String getOfferImg() {
		return OfferImg;
	}
	public void setOfferImg(String offerImg) {
		OfferImg = offerImg;
	}
	@Override
	public String toString() {
		return "Offer [OfferID=" + OfferID + ", OfferName=" + OfferName + ", OfferImg=" + OfferImg + "]";
	}
	
	
}
