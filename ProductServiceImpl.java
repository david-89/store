
package app.service;

import app.dao.ProductDAO;

import app.domain.Product;

import app.model.ProductModel;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    private ProductDAO productDAO;
    
    @Override
    public void registerProduct(ProductModel productModel) { //transforms buyerModel into buyer and saves it in DB
        Product product = new Product();
        product.repack(productModel); 
        getProductDAO().registerProduct(product); 
    }
    
    @Override
    public ProductModel getProductById(Integer id) {
        Product product = productDAO.getProductById(id);
        if (product == null) {
            return new ProductModel();
        }
        return repack(product);
    }
    
    public ProductModel repack(Product product) {
        ProductModel productModel = new ProductModel();
        productModel.setBrand(product.getBrand());
        productModel.setActive(product.getActive());
        productModel.setBullet1(product.getBullet1());
        productModel.setBullet2(product.getBullet2());
        productModel.setBullet3(product.getBullet3());
        productModel.setCategory(product.getCategory());
        productModel.setDescription(product.getDescription());
        productModel.setEan(product.getEan());
        productModel.setImage1(product.getImage1());
        productModel.setImage2(product.getImage2());
        productModel.setImage3(product.getImage3());
        productModel.setProductId(product.getProductId());
        productModel.setProductName(product.getProductName());
        productModel.setQty(product.getQty());
        productModel.setPrice(product.getPrice());         
        return productModel;
    }
    
    @Override
    public List<ProductModel> getProductsByName(String name) {
        List<Product> products = productDAO.getProductsByName(name); 
        List<ProductModel> productModels = new ArrayList<>();
        
        for (Product product : products) {
            ProductModel productModel = new ProductModel();
            productModel.repack(product);
            productModels.add(productModel);
        }        
        return productModels;
    }
    
    @Override
    public List<ProductModel> getAllProducts() {
        List<Product> products = productDAO.getAllProducts(); 
        List<ProductModel> productModels = new ArrayList<>();
        
        for (Product product : products) {
            ProductModel productModel = new ProductModel();
            productModel.repack(product);
            productModels.add(productModel);
        }
        
        return productModels;
    }
    
    @Override 
    public void deleteProduct(ProductModel productModel) {
        Product product = new Product();
        product.repack(productModel);
        getProductDAO().deleteProduct(product);  
    }
    
    @Override
    public void updateProduct(ProductModel productModel){        
        Product product = new Product();
        product.repack(productModel);
        getProductDAO().updateProduct(product);
    }

    public ProductDAO getProductDAO() {
        return productDAO;
    }

    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
}
