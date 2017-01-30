
package app.domain;

import app.model.ProductModel;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "product")
public class Product implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productId;
    
    @Column(name = "brand")
    private String brand;
    
    @Column(name = "product_name")
    private String productName;
    
    @Column(name = "category")
    private String category;
    
    @Column(name = "bullet1")
    private String bullet1;
    
    @Column(name = "bullet2")
    private String bullet2;
    
    @Column(name = "bullet3")
    private String bullet3;
    
    @Column(name = "description", columnDefinition = "text")  //enables a large  amount of text to be stored
    private String description;
    
    @Column(name = "image1")
    private String image1;
    
    @Column(name = "image2")
    private String image2;
    
    @Column(name = "image3")
    private String image3;
    
    @Column(name = "ean")
    private String ean;
    
    @Column(name = "is_active")
    private Boolean active = true;
    
    @Column(name = "qty")
    private Integer qty;
    
    @Column(name = "price")
    private Double price;
    
    public Product() {
        
    }
    
    public Product(String name) {
        this.productName = name;
    }

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
      
    public void repack(ProductModel productModel) {
        this.setBrand(productModel.getBrand()); 
        this.setBullet1(productModel.getBullet1());
        this.setBullet2(productModel.getBullet2());
        this.setBullet3(productModel.getBullet3());
        this.setCategory(productModel.getCategory());
        this.setDescription(productModel.getDescription());
        this.setEan(productModel.getEan());
        this.setImage1(productModel.getImage1());
        this.setImage2(productModel.getImage2());
        this.setImage3(productModel.getImage3());
        this.setActive(productModel.getActive()); 
        this.setProductId(productModel.getProductId());
        this.setProductName(productModel.getProductName());        
        this.setQty(productModel.getQty());
        this.setPrice(productModel.getPrice());
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
