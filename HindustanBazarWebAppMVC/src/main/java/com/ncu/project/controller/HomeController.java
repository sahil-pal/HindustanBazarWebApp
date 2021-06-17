package com.ncu.project.controller;

import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ncu.project.DAO.ProductDaoInterface;
import com.ncu.project.DAO.UserDaoInterface;
import com.ncu.project.model.Offer;
import com.ncu.project.model.Page;
import com.ncu.project.model.Product;
import com.ncu.project.model.User;

@Controller
@SessionAttributes("page")
public class HomeController {
	
	Page pg = new Page();
	
	@Autowired
	private ProductDaoInterface productManager;
	
	@Autowired
	private UserDaoInterface userManager;
	
	@RequestMapping("/Homepage")
	public String showHomepage(Model model) {

		if(pg.getCategoryNames().isEmpty() && pg.getLocationNames().isEmpty()) {
			pg.getCategoryNames().add("fruitsAndvegetables");
			pg.getCategoryNames().add("foodgrainsoilAndmasala");
			pg.getCategoryNames().add("beverages");
			pg.getCategoryNames().add("snacksAndbrandedfood");
			pg.getCategoryNames().add("eggsmeatAndfish");
			pg.getLocationNames().add("Gurugram");
			pg.getLocationNames().add("Delhi");
			pg.getLocationNames().add("Noida");
			pg.getLocationNames().add("Faridabad");
			pg.getLocationNames().add("Sohna");
		}
		else {}
		
		Calendar c = Calendar.getInstance();
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		
        List<Offer> OfferList = productManager.getOfferoftheDay(3);
        List<Product> ProductList = productManager.showProductByFilter("All",pg.getLocation(),"ratinghtl" );
        
        model.addAttribute("ProductList", ProductList);
        model.addAttribute("offerList", OfferList);
        model.addAttribute("page",this.getPg());
		return "Homepage";
	}
	
	
	@RequestMapping("/Homepagebutton")
	public String gotoHomepage(Model model) {

		pg.setLocation("All Over NCR");
		model.addAttribute("page",this.getPg());
		return "redirect:/Homepage";
	}
	
	@GetMapping("/LoginPage")
	public String showLoginpage(Model model) {
		model.addAttribute("user",new User());
		return "Login";
	}
	
	@GetMapping("/Accessdenied")
	public String showAccessDenied() {
		return "accessdenied";
	}
	
	@RequestMapping("/registeruser")
	public String registerUser(Model  model) {
		model.addAttribute("user",new User());
		return "register";
	}
	
	
	@RequestMapping("/registerthisUser")
	public String enterNewRegistration(@Valid @ModelAttribute("user")User user,BindingResult theBindingResult,Model model) {
		
		if (theBindingResult.hasErrors()) {
			List<FieldError> errors = theBindingResult.getFieldErrors();
			model.addAttribute("errors", errors);
			model.addAttribute("user",new User());
			return "register";
		}
		else {
			userManager.AddNewUser(user);
			return "Login";
		}
	}
	
	@RequestMapping("/logout")
	public String logoutUser() {
		return "Login";
	}

	public Page getPg() {
		return pg;
	}

	public void setPg(Page pg) {
		this.pg = pg;
	}
	
	
}
