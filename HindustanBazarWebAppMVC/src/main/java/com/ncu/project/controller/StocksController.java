package com.ncu.project.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ncu.project.DAO.ProductDaoInterface;
import com.ncu.project.DAO.UserDaoInterface;
import com.ncu.project.model.Page;
import com.ncu.project.model.Product;
import com.ncu.project.model.Seller;

@Controller
@SessionAttributes("page")
public class StocksController {
	
	@Autowired
	private ProductDaoInterface productManager;
	
	@Autowired
	private UserDaoInterface userManager;

	@RequestMapping("/quantityCheckCategory")
	public String checkProductStockFromCategory(@RequestParam("message")String message,
			@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,@SessionAttribute("page") Page page,Model model) {
		
		String messagetoSend = "";
		if(message.equals("Product Availability alert will be sent to your registered email-id !")) {
			messagetoSend = message;
		}
		else {
			if(productManager.getStockAvailable(ProductID, SellerID) >= Integer.parseInt(message)) {
				messagetoSend="Product successfully added with "+message+" qty in the cart !";
				productManager.insertIntoCart(getBuyerID(), ProductID, SellerID, message);
			}
			else {
				messagetoSend="Not enough Qty in Stocks! Please scale the quantity";
			}
			
		}
		
		model.addAttribute("alertMessage",messagetoSend);
		List<Product> ProductList = productManager.showCatergoryAllProduct(page.getCategory(), page.getLocation());
		model.addAttribute("ProductList", ProductList);
		return "Categorypage";
	}
	
	@RequestMapping("/addtowishlistCategory")
	public String addToWishlistFromCategory(@RequestParam("ProductID")String ProductID,@RequestParam("SellerID")String SellerID,@SessionAttribute("page") Page page,Model model) {
		
		productManager.insertIntoWishlist(getBuyerID(), ProductID, SellerID);
		List<Product> ProductList = productManager.showCatergoryAllProduct(page.getCategory(), page.getLocation());
		model.addAttribute("ProductList", ProductList);
		model.addAttribute("alertMessage","successfully added to the wishlist !");
		return "Categorypage";
	}
	
	
	@RequestMapping("/quantityCheckSearch")
	public String checkProductStockFromSearch(@RequestParam("message")String message,
			@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,
			@RequestParam("keyword")String keyword,@SessionAttribute("page") Page page,Model model) {
		
		String messagetoSend = "";
		if(message.equals("Product Availability alert will be sent to your registered email-id !")) {
			messagetoSend = message;
		}
		else {
			if(productManager.getStockAvailable(ProductID, SellerID) >= Integer.parseInt(message)) {
				messagetoSend="Product successfully added with "+message+" qty in the cart !";
				productManager.insertIntoCart(getBuyerID(), ProductID, SellerID, message);
			}
			else {
				messagetoSend="Not enough Qty in Stocks! Please scale the quantity";
			}
			
		}
		
		List<Product> ProductList = productManager.getSearchResults(keyword);
		String searchResultCount = Integer.toString(productManager.getProductCount(keyword));
		model.addAttribute("ProductList",ProductList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("count",searchResultCount);
		model.addAttribute("alertMessage",messagetoSend);
		return "Searchpage";
	}
	
	@RequestMapping("/addtowishlistSearch")
	public String addToWishlistFromSearch(@RequestParam("ProductID")String ProductID,@RequestParam("SellerID")String SellerID,@RequestParam("keyword")String keyword,@SessionAttribute("page") Page page,Model model) {
		
		productManager.insertIntoWishlist(getBuyerID(), ProductID, SellerID);
		List<Product> ProductList = productManager.getSearchResults(keyword);
		String searchResultCount = Integer.toString(productManager.getProductCount(keyword));
		model.addAttribute("ProductList",ProductList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("count",searchResultCount);
		model.addAttribute("alertMessage","successfully added to the wishlist !");
		return "Searchpage";
	}
	
	@RequestMapping("/quantityCheckOffer")
	public String checkProductStockFromOffers(@RequestParam("message")String message,
			@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,
			@RequestParam("keyword")String keyword,@SessionAttribute("page") Page page,Model model) {
		
		String messagetoSend = "";
		if(message.equals("Product Availability alert will be sent to your registered email-id !")) {
			messagetoSend = message;
		}
		else {
			if(productManager.getStockAvailable(ProductID, SellerID) >= Integer.parseInt(message)) {
				messagetoSend="Product successfully added with "+message+" qty in the cart !";
				productManager.insertIntoCart(getBuyerID(), ProductID, SellerID, message);
			}
			else {
				messagetoSend="Not enough Qty in Stocks! Please scale the quantity";
			}
			
		}
		
		List<Product> ProductList = productManager.getSearchResults(keyword);
		String searchResultCount = Integer.toString(productManager.getProductCount(keyword));
		model.addAttribute("ProductList",ProductList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("count",searchResultCount);
		model.addAttribute("alertMessage",messagetoSend);
		return "Offerpage";
	}
	
	@RequestMapping("/addtowishlistOffer")
	public String addToWishlistFromOffers(@RequestParam("ProductID")String ProductID,@RequestParam("SellerID")String SellerID,@RequestParam("keyword")String keyword,@SessionAttribute("page") Page page,Model model) {
		
		productManager.insertIntoWishlist(getBuyerID(), ProductID, SellerID);
		List<Product> ProductList = productManager.getSearchResults(keyword);
		String searchResultCount = Integer.toString(productManager.getProductCount(keyword));
		model.addAttribute("ProductList",ProductList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("count",searchResultCount);
		model.addAttribute("alertMessage","successfully added to the wishlist !");
		return "Offerpage";
	}
	
	@RequestMapping("/checkQuantity")
	public String addtoCartfromProductDetail(@RequestParam("enteredQuantity")String enteredQuantity,
			@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,Model model) {
		
		String messagetoSend="";
		
		if(productManager.getStockAvailable(ProductID, SellerID) >= Integer.parseInt(enteredQuantity)) {
	 		messagetoSend="Product successfully added with "+enteredQuantity+" qty in the cart !";
	 		productManager.insertIntoCart(getBuyerID(), ProductID, SellerID, enteredQuantity);
		}
		else {
			messagetoSend="Not enough Qty in Stocks! Please scale the quantity";
		}
		
		Product productDetails = productManager.getProductDetails(Integer.parseInt(ProductID));
		Seller sellerDetails = userManager.getSellerDetails(Integer.parseInt(SellerID));
		model.addAttribute("product",productDetails);
		model.addAttribute("seller",sellerDetails);
		model.addAttribute("alertMessage",messagetoSend);
		return "Productdetail";
	}
	
	public String getBuyerID() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username="";
		if (principal instanceof UserDetails) {
		   username = ((UserDetails)principal).getUsername();
		 } else {
		   username = principal.toString();
		  
		 }
		return username;
	}

}
