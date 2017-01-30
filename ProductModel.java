
package app.model;

import app.domain.Product;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class ProductModel {
    
    private Integer productId;  
    
    @Size(max = 100, message = "Product name must not contain more than 100 characters.")
    private String productName;   
    
    @Size(max = 30, message = "Must not contain more than 30 characters.")
    private String brand;
    
    private String category;  
    
    @Size(max = 20, message = "Must not contain more than 20 characters.")
    private String bullet1;    
    
    @Size(max = 20, message = "Must not contain more than 20 characters.")
    private String bullet2;    
    
    @Size(max = 20, message = "Must not contain more than 20 characters.")
    private String bullet3;    
    
    @NotNull(message = "The address must be provided")
    @Size(max = 1000, message = "Must not contain more than 1000 characters and must not be null.")
    private String description; 
    
    private String image1;  
    private String image2;  
    private String image3;    
    
    @Pattern(regexp = "[0-9]{13}", message = "EAN must contain 13 digits.")
    private String ean;    
    
    private Boolean active = true;
    
    @Min(0) 
    private Integer qty;
    
    @Digits(integer = 1000000000, fraction = 2)//@Pattern(regexp = "[0-9]+", message = "Must be a number.")
    private Double price;
   
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBullet1() {
        return bullet1;
    }

    public void setBullet1(String bullet1) {
        this.bullet1 = bullet1;
    }

    public String getBullet2() {
        return bullet2;
    }

    public void setBullet2(String bullet2) {
        this.bullet2 = bullet2;
    }

    public String getBullet3() {
        return bullet3;
    }

    public void setBullet3(String bullet3) {
        this.bullet3 = bullet3;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getEan() {
        return ean;
    }

    public void setEan(String ean) {
        this.ean = ean;
    }

    public void repack(Product product) {
        this.setBrand(product.getBrand()); 
        this.setBullet1(product.getBullet1());
        this.setBullet2(product.getBullet2());
        this.setBullet3(product.getBullet3());
        this.setCategory(product.getCategory());
        this.setDescription(product.getDescription());
        this.setEan(product.getEan());
        this.setImage1(product.getImage1());
        this.setImage2(product.getImage2());
        this.setImage3(product.getImage3());
        this.setActive(product.getActive()); 
        this.setProductId(product.getProductId());
        this.setProductName(product.getProductName());
        this.setQty(product.getQty());
        this.setPrice(product.getPrice());         
    }
    
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }
    
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    } 
}
