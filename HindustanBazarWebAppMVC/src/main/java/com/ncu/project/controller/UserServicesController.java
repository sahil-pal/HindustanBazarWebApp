package com.ncu.project.controller;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ncu.project.DAO.ProductDaoInterface;
import com.ncu.project.DAO.UserDaoInterface;
import com.ncu.project.model.Buyer;
import com.ncu.project.model.Cart;
import com.ncu.project.model.Feedback;
import com.ncu.project.model.Orders;
import com.ncu.project.model.Page;
import com.ncu.project.model.Product;
import com.ncu.project.model.Seller;

@Controller
@SessionAttributes("page")
public class UserServicesController {
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@Autowired
	private ProductDaoInterface productManager;
	
	@Autowired
	private UserDaoInterface userManager;
	
	@RequestMapping("/sendFeedback")
	public String sendProductFeedback(@RequestParam("feedback")String feedback,
									  @RequestParam("ProductID")String ProductID,
								   	  @RequestParam("SellerID")String SellerID,Model model) {
		
		productManager.insertProductFeedback(getBuyerID(), ProductID, SellerID, feedback,getTodayDate());
		model.addAttribute("alertMessage", "Your feeback successfully posted!");
		Product productDetails = productManager.getProductDetails(Integer.parseInt(ProductID));
		Seller sellerDetails = userManager.getSellerDetails(Integer.parseInt(SellerID));
		model.addAttribute("product",productDetails);
		model.addAttribute("seller",sellerDetails);
		return "Productdetail";
	}
	
	@RequestMapping("/wishlist")
	public String viewUserWishlist() {
		

		return "wishlist";
	}
	
	@RequestMapping("/Home")
	public String viewUserProfile(Model model) {
		
		String username = getBuyerID();
		if(getUserRole().equals("Buyer")) {
			Buyer buyer = userManager.getBuyerDetails(username);
			model.addAttribute("Role", getUserRole());
			model.addAttribute("buyer", buyer);
			
		}
		else {
			Seller seller = userManager.getSellerDetails(username);
			System.out.println("inside deatils");
			model.addAttribute("Role", getUserRole());
			model.addAttribute("seller", seller);
			
		}
		
		return "UserHome";
	}
	
	@RequestMapping("/Cart")
	public String showCartPage(Model model) {
		
		List<Cart> cartdetails = userManager.getUserCartDetails(getBuyerID());
		model.addAttribute("method","Card Payment");
		model.addAttribute("cartsize", cartdetails.size());
		model.addAttribute("cartProducts",cartdetails);
		model.addAttribute("TotalAmount",getCartTotalAmount(cartdetails));
		return "Cartpage";
	}
	
	@RequestMapping("/applypaymentFilter")
	public String showPaymentOptions(@RequestParam("paymentType")String paymentmethod,Model model) {
		
		List<Cart> cartdetails = userManager.getUserCartDetails(getBuyerID());
		model.addAttribute("method",paymentmethod);
		model.addAttribute("cartsize", cartdetails.size());
		model.addAttribute("cartProducts",cartdetails);
		model.addAttribute("TotalAmount",getCartTotalAmount(cartdetails));
		return "Cartpage";
	}
	
	@RequestMapping("/BuyProducts")
	public String showSuccessPage(@RequestParam("paymentType")String paymentmethod,
			@RequestParam("Subtotal")float Subtotal,
			@RequestParam("totalItems")int cartsize,
			@RequestParam("Total")float Total,Model model) {
		
		String username = getBuyerID();
		if(getUserRole().equals("Buyer")) {
			Buyer buyer = userManager.getBuyerDetails(username);
			model.addAttribute("Role", getUserRole());
			model.addAttribute("buyer", buyer);
			
		}
		else {
			Seller seller = userManager.getSellerDetails(username);
			System.out.println("inside deatils");
			model.addAttribute("Role", getUserRole());
			model.addAttribute("seller", seller);
		}
		
		model.addAttribute("date", getTodayDate());
		userManager.updateTheStocks(getBuyerID());
		userManager.deleteFromCart(getBuyerID());
		userManager.insertIntoOrders(getBuyerID(),cartsize,Total,getTodayDate(),2);
		
		model.addAttribute("paymentMethod",paymentmethod);
		model.addAttribute("Subtotal",Subtotal);
		model.addAttribute("Total",Total);
		
		return "Successpage";
	}
	
	@RequestMapping("/Orders")
	public String showOrderPage(Model model) {
		
		List<Orders> orderSummary = userManager.getUserOrdersDetails(getBuyerID());
		model.addAttribute("order", orderSummary);
		return "Orderpage";
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
	
	
	@RequestMapping("/Feedbacks")
	public String showPostedFeedbacks(Model model) {
		List<Feedback> feedbacks = userManager.getFeedbacksPosted(getBuyerID());
		model.addAttribute("feedback", feedbacks);
		return "FeedbackPostedpage";
	}
	
	@RequestMapping("/removeSingleProductfromCart")
	public String removethisProductFromCart(@RequestParam("ProductID")String ProductID) {
		
		userManager.updatetheCart(getBuyerID(),ProductID);
		return "redirect:/Cart";
	}
	
	@RequestMapping("/removeProductfromSeller")
	public String removethisProductFromSellerStore(@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID) {
		
		userManager.updatetheStore(SellerID,ProductID);
		return "redirect:/SellerProducts";
	}

	@RequestMapping("/SellerProducts")
	public String showSellerProducts(Model model) {
		
		List<Product> Sellerproducts= userManager.viewProductsOfSeller(getBuyerID());
		model.addAttribute("SellerProducts", Sellerproducts);
		model.addAttribute("storesize", Sellerproducts.size());
		model.addAttribute("show", "false");
		return "ProductSeller";
	}
	
	@RequestMapping("/quantityUpdateSeller")
	public String updateProductQtySeller(@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,@RequestParam("qty")String qty) {
		
		userManager.updateProductQtybySeller(Integer.parseInt(SellerID),Integer.parseInt(qty),Integer.parseInt(ProductID));
		return "redirect:/SellerProducts";
	}
	
	@RequestMapping("/priceUpdateSeller")
	public String updateProductPriceSeller(@RequestParam("ProductID")String ProductID,
			@RequestParam("SellerID")String SellerID,@RequestParam("price")String price) {
		
		userManager.updateProductPricebySeller(Integer.parseInt(SellerID),Integer.parseInt(price),Integer.parseInt(ProductID));
		return "redirect:/SellerProducts";
	}
	
	@RequestMapping("/addproduct")
	public String showAddProductForm(@RequestParam("add")String add,Model model) {
		
		List<Product> Sellerproducts= userManager.viewProductsOfSeller(getBuyerID());
		model.addAttribute("product", new Product());
		model.addAttribute("show", add);
		model.addAttribute("SellerProducts", Sellerproducts);
		model.addAttribute("UOM", getUOM());
		model.addAttribute("Category", getCategory());
		model.addAttribute("storesize", Sellerproducts.size());
		return "ProductSeller";
	}
	
	@RequestMapping("/addThisProduct")
	public String addNewProduct(@Valid @ModelAttribute("product") Product product,
			BindingResult theBindingResult, Model model) {
		
		if (theBindingResult.hasErrors()) {
			model.addAttribute("product", new Product());
			model.addAttribute("UOM", getUOM());
			model.addAttribute("Category", getCategory());
			model.addAttribute("alertMessage","Fields with * marked cannot be null !");
			model.addAttribute("show","yes");
		}
		else {
			model.addAttribute("alertMessage","Product successfully added !");
			product.setProductID(userManager.getProductID());
			userManager.addProductintoSellerStocks(product);
			model.addAttribute("show","False");
		}
		
		List<Product> Sellerproducts= userManager.viewProductsOfSeller(getBuyerID());
		model.addAttribute("SellerProducts", Sellerproducts);
		model.addAttribute("storesize", Sellerproducts.size());
		
		return "ProductSeller";
	}
	
	@RequestMapping("/receivedFeedbacks")
	public String showSellerReceivedFeedbacks(Model model) {
		List<Feedback> feedbacks = userManager.getFeedbacksReceived(getBuyerID());
		model.addAttribute("feedback", feedbacks);
		return "receivedFeedbacks";
	}
	
	public String getUserRole() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Collection<? extends GrantedAuthority> granted = ((UserDetails)principal).getAuthorities();
		String role = "";
		
		for(int i=0;i<granted.size();i++){
	        role = granted.toArray()[i] + "";
	        if(role.equals("ROLE_BUYER")){
	            role="Buyer";
	        }
	        else {
	        	role="Seller";
	        }
	    }   
		return role;
	}
	
	public float getCartTotalAmount(List<Cart> product) {
		float total = 0;
		
		for(Cart c : product) {
			total = total + c.getProductFinalPrice();
		}
		
		return total;
	}
	
	public String getTodayDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    return formatter.format(date);
	}
	
	public Map<String,String> getUOM(){
		
		Map<String,String> UOM = new LinkedHashMap<String,String>();
		UOM.put("kg","kilograms");
		UOM.put("g","grams");
		UOM.put("dozen","dozen");
		UOM.put("pcs","pieces");
		return UOM;
	}
	
	public Map<String,String> getCategory(){
		
		Map<String,String> category = new LinkedHashMap<String,String>();
		category.put("Fruits and Vegetables","Fruits and Vegetables");
		category.put("Beverages","Beverages");
		category.put("Snacks and Branded food","Snacks and Branded food");
		category.put("Food grains, Oil and Masala","Food grains, Oil and Masala");
		category.put("Eggs, Meat and Fish","Eggs, Meat and Fish");
		return category;
	}
	
}
