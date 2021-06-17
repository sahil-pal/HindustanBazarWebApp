package com.ncu.project.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ncu.project.model.Offer;
import com.ncu.project.model.Product;


@Repository
public class ProductDAO implements ProductDaoInterface  {


	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void ProductDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
    }
	

	@Override
	public List<Product> showCatergoryAllProduct(String category, String location) {
		
		String query;
		
		if(location.equals("All Over NCR")) {
			 query = "select * from Product,Stocks where ProductCategory = '"+category+"'"+"and Product.ProductID = Stocks.ProductID";
		}
		else {
			 query = "select * from Product as p,Stocks as st,Seller as s where ProductCategory = '"+category+"' and SellerShopLocation = '"+location+"' and p.ProductSellerID = s.SellerID and p.ProductID = st.ProductID";
		}
		List<Product> products = this.jdbcTemplate.query(query, new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rowNum) throws SQLException{
				Product product = new Product();
				
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductCategory(rs.getString(3));
				product.setProductType(rs.getString(4));
				product.setProductPrice(rs.getFloat(5));
				product.setProductBrand(rs.getString(6));
				product.setProductUOM(rs.getString(7));
				product.setProductperweight(rs.getInt(8));
				product.setProductDiscount(rs.getInt(9));
				product.setProductRating(rs.getFloat(10));
				product.setExpressDeliveryStatus(rs.getString(11));
				product.setProductImg(rs.getString(12));
				product.setProductSellerID(rs.getInt(13));
				product.setProductQtyAvailable(rs.getInt(15));
				
				float amount = product.getProductPrice();
				float discount = (float) product.getProductDiscount()/100;
				float disAmount = amount - (amount*discount);
				
				product.setProductFinalPrice(disAmount);
				
				return product;
			}
		});
		return products;
	}
	
	@Override
	public List<Product> showProductByFilter(String category, String location, String filter) {
		
		String queryLocation="";
		
		switch(filter) {
		
		case "popluarity" : {
			queryLocation = "order by ProductRating asc";
			break;
		}
		case "ratinghtl" : {
			queryLocation = "order by ProductRating desc, ProductCategory asc limit 24";
			break;
		}
		case "pricelth" : {
			queryLocation = "order by ProductPrice asc";
			break;
		}
		case "pricehtl" : {
			queryLocation = "order by ProductRating desc";
			break;
		}
		case "alphabetical" : {
			queryLocation = "order by ProductName asc";
			break;
		}
		case "savinglth" : {
			queryLocation = "order by ProductDiscount asc";
			break;
		}
		case "savinghtl" : {
			queryLocation = "order by ProductDiscount desc";
			break;
		}
		}
		
		String query;
		
		if(location.equals("All Over NCR")) {
			if(category.equals("All")) {
				query = "select * from Product,Stocks where Product.ProductID = Stocks.ProductID "+queryLocation;
			}
			else {
			 query = "select * from Product,Stocks where ProductCategory = '"+category+"' and Product.ProductID = Stocks.ProductID "+queryLocation;
			}
		}
		else {
			if(category.equals("All")) {
				query = "select * from Product as p,Stocks as st,Seller as s where SellerShopLocation = '"+location+"' and p.ProductSellerID = s.SellerID and p.ProductID = st.ProductID "+queryLocation;
			}
			else {
				query = "select * from Product as p,Stocks as st,Seller as s where ProductCategory = '"+category+"' and SellerShopLocation = '"+location+"' and p.ProductSellerID = s.SellerID and p.ProductID = st.ProductID "+queryLocation;
			}
		}
		
		List<Product> products = this.jdbcTemplate.query(query, new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rowNum) throws SQLException{
				Product product = new Product();
				
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductCategory(rs.getString(3));
				product.setProductType(rs.getString(4));
				product.setProductPrice(rs.getFloat(5));
				product.setProductBrand(rs.getString(6));
				product.setProductUOM(rs.getString(7));
				product.setProductperweight(rs.getInt(8));
				product.setProductDiscount(rs.getInt(9));
				product.setProductRating(rs.getFloat(10));
				product.setExpressDeliveryStatus(rs.getString(11));
				product.setProductImg(rs.getString(12));
				product.setProductSellerID(rs.getInt(13));
				product.setProductQtyAvailable(rs.getInt(15));
				
				float amount = product.getProductPrice();
				float discount = (float) product.getProductDiscount()/100;
				float disAmount = amount - (amount*discount);
				
				product.setProductFinalPrice(disAmount);
				
				return product;
			}
		});
		return products;
		
	}

	@Override
	public Product getProductDetails(int ProductID) {
		Product product = this.jdbcTemplate.queryForObject(
		        "select * from Product as p,Stocks as s where p.ProductID = ?"+" and p.ProductID = s.ProductID ",
		        new Object[]{ProductID},
		        new RowMapper<Product>() {
		            public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		                Product product = new Product();
		                
		                product.setProductID(rs.getInt(1));
						product.setProductName(rs.getString(2));
						product.setProductCategory(rs.getString(3));
						product.setProductType(rs.getString(4));
						product.setProductPrice(rs.getFloat(5));
						product.setProductBrand(rs.getString(6));
						product.setProductUOM(rs.getString(7));
						product.setProductperweight(rs.getInt(8));
						product.setProductDiscount(rs.getInt(9));
						product.setProductRating(rs.getFloat(10));
						product.setExpressDeliveryStatus(rs.getString(11));
						product.setProductImg(rs.getString(12));
						product.setProductSellerID(rs.getInt(13));
						product.setProductQtyAvailable(rs.getInt(15));
						
						float amount = product.getProductPrice();
						float discount = (float) product.getProductDiscount()/100;
						float disAmount = amount - (amount*discount);
						
						product.setProductFinalPrice(disAmount);
						
						return product;
		            }
		        });
		return product;
	}

	@Override
	public List<Product> getSearchResults(String keyword) {
		
		String query = "select distinct * from Product inner join Stocks on Product.ProductID = Stocks.ProductID where (ProductName like '%"+
				keyword+"%' or ProductCategory like '%"+keyword+"%' or ProductBrand like '%"+keyword+"%' or ProductType like '"+
				keyword+"')";
		
		List<Product> products = this.jdbcTemplate.query(query, new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int rowNum) throws SQLException{
				Product product = new Product();
				
				product.setProductID(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductCategory(rs.getString(3));
				product.setProductType(rs.getString(4));
				product.setProductPrice(rs.getFloat(5));
				product.setProductBrand(rs.getString(6));
				product.setProductUOM(rs.getString(7));
				product.setProductperweight(rs.getInt(8));
				product.setProductDiscount(rs.getInt(9));
				product.setProductRating(rs.getFloat(10));
				product.setExpressDeliveryStatus(rs.getString(11));
				product.setProductImg(rs.getString(12));
				product.setProductSellerID(rs.getInt(13));
				product.setProductQtyAvailable(rs.getInt(15));
				
				float amount = product.getProductPrice();
				float discount = (float) product.getProductDiscount()/100;
				float disAmount = amount - (amount*discount);
				
				product.setProductFinalPrice(disAmount);
				
				return product;
			}
		});
		return products;
	}
	
	@Override
	public List<Offer> getOfferoftheDay(int day) {
		String query = "select * from Offer where OfferID = '"+day+"'";
		List<Offer> offers = this.jdbcTemplate.query(query, new RowMapper<Offer>(){
			public Offer mapRow(ResultSet rs,int rowNum) throws SQLException{
				Offer offer = new Offer();
				
				offer.setOfferID(rs.getString(1));
				offer.setOfferName(rs.getString(2));
				offer.setOfferImg(rs.getString(3));
				
				return offer ;
			}
		});
		return offers;
	}

	@Override
	public int getProductCount(String keyword) {
		int rowCount = this.jdbcTemplate.queryForObject("select count(distinct Product.ProductID) from Product,Stocks where Product.ProductID = Stocks.ProductID and Product.ProductName like '%"+
				keyword+"%' or Product.ProductCategory like '%"+keyword+"%' or Product.ProductBrand like '%"+keyword+"%' or Product.ProductType like '"+
				keyword+"'",Integer.class);
		return rowCount;
	}


	@Override
	public void insertIntoWishlist(String BuyerID,String ProductID, String SellerID) {
		String insertQuery = "insert into wishlist (BuyerID,ProductID,SellerID,QtySelected) values (?,?,?,1)";
		this.jdbcTemplate.update(insertQuery, BuyerID, ProductID,SellerID);
	}


	@Override
	public int getStockAvailable(String ProductID, String SellerID) {
		int StocksAvailable = this.jdbcTemplate.queryForObject("select ProductQtyAvailable from Stocks where ProductID = '"+ProductID+"' and SellerID = '"+SellerID+"'",Integer.class);
		return StocksAvailable;
	}


	@Override
	public void insertIntoCart(String BuyerID, String ProductID, String SellerID, String Qty) {
		String insertQuery = "insert into Cart (BuyerID,ProductID,SellerID,QtySelected) values (?,?,?,?)";
		this.jdbcTemplate.update(insertQuery, BuyerID, ProductID,SellerID,Qty);
	}


	@Override
	public void insertProductFeedback(String BuyerID, String ProductID, String SellerID, String feedback,String date) {
		String insertQuery = "insert into Feedbacks (BuyerID,ProductID,SellerID,Review,DateOfPost) values (?,?,?,?,?)";
		this.jdbcTemplate.update(insertQuery, BuyerID, ProductID,SellerID,feedback,date);
		
	}




}

	

