package com.ncu.project.model;

import javax.validation.constraints.NotNull;

public class Product {

	int ProductID;
	
	@NotNull(message="This field cannot be null !")
	String ProductName;
	@NotNull(message="This field cannot be null !")
	String ProductCategory;
	@NotNull(message="This field cannot be null !")
	String ProductType;
	@NotNull(message="This field cannot be null !")
	float ProductPrice;
	String ProductBrand;
	String ProductUOM;
	int Productperweight;
	int ProductDiscount;
	float ProductRating;
	String ExpressDeliveryStatus;
	String ProductImg;
	
	@NotNull(message="This field cannot be null !")
	int ProductSellerID;
	
	float ProductFinalPrice;
	
	@NotNull(message="This field cannot be null !")
	int ProductQtyAvailable;
	
	
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getProductCategory() {
		return ProductCategory;
	}
	public void setProductCategory(String productCategory) {
		ProductCategory = productCategory;
	}
	public String getProductType() {
		return ProductType;
	}
	public void setProductType(String productType) {
		ProductType = productType;
	}
	public float getProductPrice() {
		return ProductPrice;
	}
	public void setProductPrice(float productPrice) {
		ProductPrice = productPrice;
	}
	public String getProductBrand() {
		return ProductBrand;
	}
	public void setProductBrand(String productBrand) {
		ProductBrand = productBrand;
	}
	public String getProductUOM() {
		return ProductUOM;
	}
	public void setProductUOM(String productUOM) {
		ProductUOM = productUOM;
	}
	public int getProductDiscount() {
		return ProductDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		ProductDiscount = productDiscount;
	}
	public float getProductRating() {
		return ProductRating;
	}
	public void setProductRating(float productRating) {
		ProductRating = productRating;
	}
	public String getExpressDeliveryStatus() {
		return ExpressDeliveryStatus;
	}
	public void setExpressDeliveryStatus(String expressDeliveryStatus) {
		ExpressDeliveryStatus = expressDeliveryStatus;
	}
	public String getProductImg() {
		return ProductImg;
	}
	public void setProductImg(String productImg) {
		ProductImg = productImg;
	}
	public int getProductSellerID() {
		return ProductSellerID;
	}
	public void setProductSellerID(int productSellerID) {
		ProductSellerID = productSellerID;
	}
	public float getProductFinalPrice() {
		return ProductFinalPrice;
	}
	public void setProductFinalPrice(float productFinalPrice) {
		ProductFinalPrice = productFinalPrice;
	}
	public int getProductperweight() {
		return Productperweight;
	}
	public void setProductperweight(int productperweight) {
		Productperweight = productperweight;
	}
	public int getProductQtyAvailable() {
		return ProductQtyAvailable;
	}
	public void setProductQtyAvailable(int productQtyAvailable) {
		ProductQtyAvailable = productQtyAvailable;
	}
	@Override
	public String toString() {
		return "Product [ProductID=" + ProductID + ", ProductName=" + ProductName + ", ProductCategory="
				+ ProductCategory + ", ProductType=" + ProductType + ", ProductPrice=" + ProductPrice
				+ ", ProductBrand=" + ProductBrand + ", ProductUOM=" + ProductUOM + ", Productperweight="
				+ Productperweight + ", ProductDiscount=" + ProductDiscount + ", ProductRating=" + ProductRating
				+ ", ExpressDeliveryStatus=" + ExpressDeliveryStatus + ", ProductImg=" + ProductImg
				+ ", ProductSellerID=" + ProductSellerID + ", ProductFinalPrice=" + ProductFinalPrice
				+ ", ProductQtyAvailable=" + ProductQtyAvailable + "]";
	}
	
	
	
	
	
	
}
