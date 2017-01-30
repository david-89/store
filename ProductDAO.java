
package app.dao;

import app.domain.Product;
import java.util.List;

public interface ProductDAO {    
    public void registerProduct(Product product);
    public Product getProductById(Integer id);
    public List<Product> getProductsByName(String name);
    public List<Product> getAllProducts();
    public void deleteProduct(Product product);
    public void updateProduct(Product product);
}
