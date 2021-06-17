package com.ncu.project.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ncu.project.model.Buyer;
import com.ncu.project.model.Cart;
import com.ncu.project.model.Feedback;
import com.ncu.project.model.Orders;
import com.ncu.project.model.Product;
import com.ncu.project.model.Seller;
import com.ncu.project.model.User;

@Repository
public class UserDAO implements UserDaoInterface{

	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void ProductDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	
	@Override
	public Seller getSellerDetails(int SellerID) {
		Seller seller = this.jdbcTemplate.queryForObject(
		        "select * from Seller where SellerID = ?",
		        new Object[]{SellerID},
		        new RowMapper<Seller>() {
		            public Seller mapRow(ResultSet rs, int rowNum) throws SQLException {
		                Seller seller = new Seller();
		                
		                seller.setSellerID(rs.getInt(1));
		                seller.setSellerName(rs.getString(2));
		                seller.setSellerContactNumber(rs.getString(3));
		                seller.setSellerAdhaarNumber(rs.getString(4));
		                seller.setSellerGSTIN(rs.getString(5));
		                seller.setSellerEmail(rs.getString(6));
		                seller.setSellerShopName(rs.getString(7));
		                seller.setSellerShopLocation(rs.getString(8));
		           	
						return seller;
		            }
		        });
		return seller;
	}

	@Override
	public Seller getSellerDetails(String username) {
		Seller seller = this.jdbcTemplate.queryForObject(
		        "select * from Seller where SellerEmail = ?",
		        new Object[]{username},
		        new RowMapper<Seller>() {
		            public Seller mapRow(ResultSet rs, int rowNum) throws SQLException {
		                Seller seller = new Seller();
		                
		                seller.setSellerID(rs.getInt(1));
		                seller.setSellerName(rs.getString(2));
		                seller.setSellerContactNumber(rs.getString(3));
		                seller.setSellerAdhaarNumber(rs.getString(4));
		                seller.setSellerGSTIN(rs.getString(5));
		                seller.setSellerEmail(rs.getString(6));
		                seller.setSellerShopName(rs.getString(7));
		                seller.setSellerShopLocation(rs.getString(8));
		           	
						return seller;
		            }
		        });
		return seller;
	}


	@Override
	public Buyer getBuyerDetails(String username) {
		Buyer buyer = this.jdbcTemplate.queryForObject("select * from Buyer where BuyerID = '"+username+"'",
				new Object[] {},
				new RowMapper<Buyer>() {
					public Buyer mapRow(ResultSet rs,int rowNum) throws SQLException{
						
						Buyer buyer = new Buyer();
						
						buyer.setBuyerID(rs.getString(1));
						buyer.setFullName(rs.getString(2));
						buyer.setPhonenumber(rs.getInt(3));
						buyer.setEmail(rs.getString(4));
						buyer.setHousenumber(rs.getString(5));
						buyer.setCity(rs.getString(6));
						buyer.setState(rs.getString(7));
						buyer.setHbcredits(rs.getString(8));
						return buyer;
					}
		});
		return buyer;
	}


	@Override
	public List<Cart> getUserCartDetails(String BuyerID) {
		String query = "select * from Product as p inner join Cart as c on p.productID = c.ProductID where p.ProductSellerID=c.SellerID and c.BuyerID='"+BuyerID+"'";
		
		List<Cart> cart = this.jdbcTemplate.query(query, new RowMapper<Cart>(){
			public Cart mapRow(ResultSet rs,int rowNum) throws SQLException{
				Cart cart = new Cart();
				
				cart.setProductID(rs.getInt(1));
				cart.setProductName(rs.getString(2));
				cart.setProductCategory(rs.getString(3));
				cart.setProductType(rs.getString(4));
				cart.setProductPrice(rs.getFloat(5));
				cart.setProductBrand(rs.getString(6));
				cart.setProductUOM(rs.getString(7));
				cart.setProductperweight(rs.getInt(8));
				cart.setProductDiscount(rs.getInt(9));
				cart.setProductRating(rs.getFloat(10));
				cart.setExpressDeliveryStatus(rs.getString(11));
				cart.setProductImg(rs.getString(12));
				cart.setProductSellerID(rs.getInt(13));
				cart.setBuyerID(rs.getString(14));
				cart.setQtySelected(rs.getInt(17));
				
				float amount = cart.getProductPrice();
				float discount = (float) cart.getProductDiscount()/100;
				float disAmount = amount - (amount*discount);
				
				cart.setProductFinalPrice(Math.round(disAmount* (cart.getQtySelected())));
				
				return cart;
			}
		});
		return cart;
	}

	@Override
	public int getProductID() {
		int key = this.jdbcTemplate.queryForObject("select MAX(ProductID) from Product order by ProductID",Integer.class);
		return (key+1);
	}
	
	
	@Override
	public void deleteFromCart(String BuyerID) {
		this.jdbcTemplate.update("delete from Cart where BuyerID = ?", BuyerID);	
	}


	@Override
	public void insertIntoOrders(String BuyerID, int totalItem, float totalAmount, String date, int track) {
		String insertQuery = "insert into Orders (BuyerID,TotalItems,DateOfPurchase,TotalAmount,Trackstatus) values (?,?,?,?,?)";
		this.jdbcTemplate.update(insertQuery, BuyerID, totalItem,date,totalAmount,track);
		
	}


	@Override
	public List<Orders> getUserOrdersDetails(String BuyerID) {
		String query = "select * from Orders where BuyerID = '"+BuyerID+"' order by DateOfPurchase desc";
		
		List<Orders> orders = this.jdbcTemplate.query(query, new RowMapper<Orders>(){
			public Orders mapRow(ResultSet rs,int rowNum) throws SQLException{
				Orders order = new Orders();
				
				order.setBuyerID(rs.getString(1));
				order.setTotalItems(rs.getInt(2));
				order.setDateOfPurchase(rs.getString(3));
				order.setTotalAmount(rs.getFloat(4));
				order.setTrackstatus(rs.getInt(5));
				
				return order;
			}
		});
		return orders;
	}


	@Override
	public void updateTheStocks(String BuyerID) {
		String updateQuery = "update Stocks as s inner join Cart as c on s.SellerID=c.SellerID "
				+ "set ProductQtyAvailable = s.ProductQtyAvailable - c.QtySelected "
				+ "where s.ProductID=c.ProductID and c.BuyerID='"+BuyerID+"'";
		this.jdbcTemplate.update(updateQuery);
		
	}


	@Override
	public List<Feedback> getFeedbacksPosted(String BuyerID) {
		String query = "select distinct * from (Product inner join Feedbacks on Product.ProductID = Feedbacks.ProductID) "
				+ "join Seller where BuyerID = '"+BuyerID+"' and Feedbacks.SellerID = Seller.SellerID order by DateOfPost desc";
		
		List<Feedback> feedbacks = this.jdbcTemplate.query(query, new RowMapper<Feedback>(){
			public Feedback mapRow(ResultSet rs,int rowNum) throws SQLException{
				Feedback feedback = new Feedback();
				
				feedback.setBuyerID(rs.getString(14));
				feedback.setProductName(rs.getString(2));
				feedback.setSellerName(rs.getString(25));
				feedback.setSellerLocation(rs.getString(26));
				feedback.setReview(rs.getString(17));
				feedback.setDateOfPost(rs.getString(18));
				
				
				return feedback;
			}
		});
		return feedbacks;
	}


	@Override
	public void updatetheCart(String BuyerID, String ProductID) {
		String query = "delete from Cart where BuyerID = '"+BuyerID+"' and ProductID = '"+ProductID+"'";
		this.jdbcTemplate.update(query);	
	}


	@Override
	public List<Product> viewProductsOfSeller(String SellerID) {
		String query = "select distinct * from Seller,(Product inner join Stocks on Product.ProductID = Stocks.ProductID)"
				+ " where Seller.SellerEmail = '"+SellerID+"' and Product.ProductSellerID = Seller.SellerID";
		List<Product> products = this.jdbcTemplate.query(query, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs,int rowNum) throws SQLException{
				Product product = new Product();
				
				product.setProductID(rs.getInt(9));
				product.setProductName(rs.getString(10));
				product.setProductCategory(rs.getString(11));
				product.setProductType(rs.getString(12));
				product.setProductPrice(rs.getFloat(13));
				product.setProductBrand(rs.getString(14));
				product.setProductUOM(rs.getString(15));
				product.setProductperweight(rs.getInt(16));
				product.setProductDiscount(rs.getInt(17));
				product.setProductRating(rs.getFloat(18));
				product.setExpressDeliveryStatus(rs.getString(19));
				product.setProductImg(rs.getString(20));
				product.setProductSellerID(rs.getInt(21));
				product.setProductQtyAvailable(rs.getInt(23));
			
				return product;
			}
		});
		return products;
	}


	@Override
	public void updatetheStore(String SellerID, String ProductID) {
		String query = "delete from Product where ProductID = '"+ProductID+"' and ProductSellerID = '"+SellerID+"'";
		this.jdbcTemplate.update(query);
		query = "delete from Stocks where ProductID = '"+ProductID+"' and SellerID = '"+SellerID+"'";
		this.jdbcTemplate.update(query);
	}


	@Override
	public void updateProductQtybySeller(int SellerID, int Qty, int ProductID) {
		String query = "update Stocks "
				+ "set ProductQtyAvailable = "+Qty
				+" where ProductID = '"+ProductID+"' and SellerID='"+SellerID+"'";
		this.jdbcTemplate.update(query);
	}


	@Override
	public void updateProductPricebySeller(int SellerID, int price, int ProductID) {
		String query = "update Product "
				+ "set ProductPrice = "+price
				+" where ProductID = '"+ProductID+"' and ProductSellerID='"+SellerID+"'";
		this.jdbcTemplate.update(query);
		
	}


	@Override
	public void addProductintoSellerStocks(Product product) {
		
		String insertQuery = "insert into Product(ProductID,ProductName,ProductCategory,"
				+ "ProductType,ProductPrice,ProductBrand,ProductUOM ,Productperweight,ProductDiscount,"
				+ "ProductRating,ExpressDeliveryStatus,ProductImg,ProductSellerID)"
				+ " values (?,?,?,?,?,?,?,?,?,2.2,?,'NotAvailable',?)";
		this.jdbcTemplate.update(insertQuery,
				product.getProductID(),
				product.getProductName(),
				product.getProductCategory(),
				product.getProductType(),
				product.getProductPrice(),
				product.getProductBrand(),
				product.getProductUOM(),
				product.getProductperweight(),
				product.getProductDiscount(),
				product.getExpressDeliveryStatus(),
				product.getProductSellerID());
		
		insertQuery = "insert into Stocks(ProductID,ProductQtyAvailable,SellerID) values(?,?,?)";
		this.jdbcTemplate.update(insertQuery,product.getProductID(),product.getProductQtyAvailable(),
				product.getProductSellerID());
	}


	@Override
	public List<Feedback> getFeedbacksReceived(String BuyerID) {
		String query = "select distinct * from (Product inner join Feedbacks on Product.ProductID = Feedbacks.ProductID) "
				+ "join Seller where Seller.SellerEmail = '"+BuyerID+"' and Feedbacks.SellerID = Seller.SellerID order by DateOfPost desc";
		
		List<Feedback> feedbacks = this.jdbcTemplate.query(query, new RowMapper<Feedback>(){
			public Feedback mapRow(ResultSet rs,int rowNum) throws SQLException{
				Feedback feedback = new Feedback();
				
				feedback.setBuyerID(rs.getString(14));
				feedback.setProductName(rs.getString(2));
				feedback.setSellerName(rs.getString(25));
				feedback.setSellerLocation(rs.getString(26));
				feedback.setReview(rs.getString(17));
				feedback.setDateOfPost(rs.getString(18));
				
				
				return feedback;
			}
		});
		return feedbacks;
	}


	@Override
	public void AddNewUser(User user) {
		
		String insertQuery = "";
		
		System.out.println(user.getUsername()+"{noop}"+user.getPassword());
		insertQuery = "INSERT INTO users VALUES (?,?,1)";
		this.jdbcTemplate.update(insertQuery,user.getUsername(),"{noop}"+user.getPassword());
		
		insertQuery = "INSERT INTO authorities VALUES (?,'ROLE_BUYER')";
		this.jdbcTemplate.update(insertQuery,user.getUsername());
		
		insertQuery = "insert into Buyer values(?,?,?,?,?,?,?,100)";
		this.jdbcTemplate.update(insertQuery,user.getUsername(),user.getName(),user.getPhoneNumber()
				,user.getUserEmailID(),user.getBuyerHouseNo(),user.getBuyercity(),user.getState());
		
	}
	

	

}
