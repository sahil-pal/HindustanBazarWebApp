package com.ncu.project.DAO;

import java.util.List;

import com.ncu.project.model.Buyer;
import com.ncu.project.model.Cart;
import com.ncu.project.model.Feedback;
import com.ncu.project.model.Orders;
import com.ncu.project.model.Product;
import com.ncu.project.model.Seller;
import com.ncu.project.model.User;

public interface UserDaoInterface {

	public Seller getSellerDetails(int SellerID);
	
	public Buyer getBuyerDetails(String username);
	
	public Seller getSellerDetails(String username);
	
	public List<Cart> getUserCartDetails(String BuyerID);
	
	public int getProductID();
	
	public void deleteFromCart(String BuyerID);
	
	public void insertIntoOrders(String BuyerID,int totalItem,float totalAmount, String date, int track);
	
	public List<Orders> getUserOrdersDetails(String BuyerID);
	
	public void updateTheStocks(String BuyerID);
	
	public List<Feedback> getFeedbacksPosted(String BuyerID);
	
	public List<Feedback> getFeedbacksReceived(String BuyerID);
	
	public void updatetheCart(String BuyerID,String ProductID);
	
	public List<Product> viewProductsOfSeller(String SellerID);
	
	public void updatetheStore(String SellerID,String ProductID);
	
	public void updateProductQtybySeller(int SellerID,int Qty,int ProductID);
	
	public void updateProductPricebySeller(int SellerID,int price,int ProductID);
	
	public void addProductintoSellerStocks(Product product);
	
	public void AddNewUser(User user);
}
