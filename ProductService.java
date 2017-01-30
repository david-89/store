
package app.service;

import app.domain.Product;
import app.model.ProductModel;
import java.util.List;


public interface ProductService {
    public void registerProduct(ProductModel productModel);
    public ProductModel getProductById(Integer id);
    public List<ProductModel> getProductsByName(String name);
    public List<ProductModel> getAllProducts();
    public void deleteProduct(ProductModel productModel);
    public void updateProduct(ProductModel productModel);
}
