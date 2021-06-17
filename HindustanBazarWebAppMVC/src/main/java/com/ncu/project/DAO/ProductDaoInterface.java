package com.ncu.project.DAO;

import java.util.List;

import com.ncu.project.model.Offer;
import com.ncu.project.model.Product;


public interface ProductDaoInterface {
	
	public List<Product> showCatergoryAllProduct(String category,String location);
	
	public List<Product> showProductByFilter(String category,String location,String filter);
	
	public Product getProductDetails(int ProductID);

	public List<Product> getSearchResults(String keyword);
	
	public int getProductCount(String keyword);
	
	public List<Offer> getOfferoftheDay(int day);
	
	public void insertIntoWishlist(String BuyerID,String ProductID, String SellerID);
	
	public int getStockAvailable(String ProductID,String SellerID);
	
	public void insertIntoCart(String BuyerID,String ProductID, String SellerID,String Qty);
	
	public void insertProductFeedback(String BuyerID,String ProductID,String SellerID,String feedback,String date);
}
