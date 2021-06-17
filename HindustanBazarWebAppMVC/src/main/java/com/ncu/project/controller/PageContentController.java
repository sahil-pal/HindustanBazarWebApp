package com.ncu.project.controller;
import java.util.List;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
public class PageContentController {
	
	@Autowired
	private ProductDaoInterface productManager;
	
	@Autowired
	private UserDaoInterface userManager;

	
	@RequestMapping("/category/{type}")
	public String processCategoryType(@PathVariable("type")String type,@ModelAttribute("page") Page pg) {
		
		if(type.equals("fruitsAndvegetables")) {
			pg.setCategory("Fruits and Vegetables");
		}
		else if(type.equals("foodgrainsoilAndmasala")) {
			pg.setCategory("Food grains, Oil and Masala");
		}
		else if(type.equals("beverages")) {
			pg.setCategory("Beverages");
		}
		else if(type.equals("snacksAndbrandedfood")){
			pg.setCategory("Snacks and Branded food");
		}
		else {
			pg.setCategory("Eggs, Meat and Fish");
		}
		return "redirect:/CategoryPage";
	}
	
	@RequestMapping("/location/{type}")
	public String processLocationType(@PathVariable("type")String type,@ModelAttribute("page") Page pg) {
		
		if(type.equals("Gurugram")) {
			pg.setLocation("Gurugram");
		}
		else if(type.equals("Delhi")) {
			pg.setLocation("Delhi");
		}
		else if(type.equals("Noida")) {
			pg.setLocation("Noida");
		}
		else if(type.equals("Faridabad")){
			pg.setLocation("Faridabad");
		}
		else {
			pg.setLocation("Sohna");
		}
		return "redirect:/Homepage";
	}
	
	@RequestMapping("/CategoryPage")
	public String showCategoryPage(@SessionAttribute("page") Page page,Model model) {
		List<Product> ProductList = productManager.showCatergoryAllProduct(page.getCategory(), page.getLocation());
		model.addAttribute("ProductList", ProductList);
		return "Categorypage";
	}
	
	@RequestMapping("/applyfilter")
	public String showfilteredCategoryPage(@SessionAttribute("page") Page page,@RequestParam("filteredsearch")String filter,Model model) {
		List<Product> ProductList = productManager.showProductByFilter(page.getCategory(), page.getLocation(),filter);
		model.addAttribute("ProductList", ProductList);
		return "Categorypage";
	}
	
	@RequestMapping("/view/{product}/{seller}")
	public String showProductProcessing(@PathVariable("product")String product,@PathVariable("seller")String seller,@ModelAttribute("page") Page pg) {
		
		pg.setProductID(Integer.parseInt(product));
		pg.setSellerID(Integer.parseInt(seller));
	
		return "redirect:/Productdetail";
	}
	
	@RequestMapping("/Productdetail")
	public String showProductDetailPage(@SessionAttribute("page") Page page,Model model) {
		
		Product productDetails = productManager.getProductDetails(page.getProductID());
		Seller sellerDetails = userManager.getSellerDetails(page.getSellerID());
		
		model.addAttribute("product",productDetails);
		model.addAttribute("seller",sellerDetails);
		return "Productdetail";
	}
	
	@RequestMapping("/searchKeyword")
	public String showResultforSearch(@RequestParam("keyword")String key,Model model) {
		
		List<Product> ProductList = productManager.getSearchResults(key);
		String searchResultCount = Integer.toString(productManager.getProductCount(key));
		model.addAttribute("ProductList",ProductList);
		model.addAttribute("keyword",key);
		model.addAttribute("count",searchResultCount);
		return "Searchpage";
	}
	
	@RequestMapping("/searchOffer")
	public String showResultforOffer(@RequestParam("keyword")String key,Model model) {
		
		List<Product> ProductList = productManager.getSearchResults(key);
		model.addAttribute("offerName",key);
		model.addAttribute("ProductList",ProductList);
		return "Offerpage";
	}
	
	
}
