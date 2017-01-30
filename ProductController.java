
package app.controller;

import app.model.ProductModel;
import app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/uploadProduct")
    public String getUploadProduct(Model model) {
        model.addAttribute("productModel", new ProductModel());
        return "uploadProduct";
    }

    @RequestMapping(value = "uploadProduct", method = RequestMethod.POST) //performs server validation and passes adminModel to the service layer
    public String postUploadProduct(@Valid @ModelAttribute("productModel") ProductModel productModel, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "uploadProduct";
        }
        getProductService().registerProduct(productModel);
        return "uploadImagesForm";
    }

    @RequestMapping(value = "/uploadImagesForm")
    public String getUploadImages(Model model) {
        model.addAttribute("productModel", new ProductModel());
        return "uploadImagesForm";
    }

    @RequestMapping(value = {"/search"})
    public String getSearchProducts(Model model) {
        model.addAttribute("productModel", new ProductModel());
        return "OnlineStoreHomepage";
    }
    
    @RequestMapping(value = {"/searchResults"})
    public String getSearchResults(Model model) {
        model.addAttribute("productModel", new ProductModel());
        return "searchResults";
    }
    
    //changes made might impact the app
    @RequestMapping(value = {"/searchResults"}, method = RequestMethod.POST) //retrieves all products that have the product name like the inserted param
    public String postSearchProducts(@RequestParam String productName, Model model) {
        List<ProductModel> productModels = getProductService().getProductsByName(productName);
        model.addAttribute("productModels", productModels);
        return "searchResults";
    }

    @RequestMapping(value = "/") //sets the default page for the entire application 
    public String getWelcomePage() {
        return "welcomePage";
    }

    @RequestMapping(value = {"/productPage"})
    public String getProductPage(@RequestParam Integer id, Model model) {
        model.addAttribute("productModel", getProductService().getProductById(id));
        return "productPage";
    }

    @RequestMapping(value = "/productPage", method = RequestMethod.POST) //retrieves all information about the product with the passed productId
    public String postProductPage(@RequestParam Integer id, @ModelAttribute("productModel") ProductModel productModel) {
        getProductService().getProductById(id);
        return "productPage";
    }

    @RequestMapping(value = "/inventory") //retrieves all products from DB
    public String getInventory(Model model) {
        List<ProductModel> productModels = getProductService().getAllProducts();
        model.addAttribute("productModels", productModels);
        return "inventory";
    }

    @RequestMapping(value = "/deleteProduct") //retrieves the particular product under passed id
    public String getDeleteProduct(@RequestParam Integer id, Model model) {
        model.addAttribute("productModel", getProductService().getProductById(id));
        return "delete";
    }

    @RequestMapping(value = {"deleteProduct"}, method = RequestMethod.POST) //passes the productModel to the service layer to delete the product
    public String postDeleteProduct(@ModelAttribute("productModel") ProductModel productModel) {
        getProductService().deleteProduct(productModel);
        return "deletionSuccessful"; 
    }

    @RequestMapping("/edit")
    public String getEditProduct(@RequestParam Integer id, Model model) {
        model.addAttribute("productModel", getProductService().getProductById(id));
        return "edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST) //performs server validation and passes the productModel to the service layer for update
    public String postEditProduct(@Valid @ModelAttribute("productModel") ProductModel productModel, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "edit";
        }
        getProductService().updateProduct(productModel);
        return "uploadSuccessful";
    }

    public ProductService getProductService() {
        return productService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

}
