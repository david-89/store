
package app.controller;

import app.model.AdminModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import app.service.AdminService;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/registerAdmin")
    public String getRegisterAdmin(Model model) {
        model.addAttribute("adminModel", new AdminModel());
        return "registerAdmin";
    }

    @RequestMapping(value = "/registerAdmin", method = RequestMethod.POST) //passes adminModel service layer to register him/her
    public String postRegisterAdmin(@ModelAttribute("adminModel") AdminModel adminModel) {
        adminService.registerAdmin(adminModel);
        return "homePageAdmin";
    }

    @RequestMapping(value = "/adminAccountLogin")
    public String getLoginAdmin(Model model) {
        model.addAttribute("adminModel", new AdminModel());
        return "adminAccountLogin";
    }

    @RequestMapping(value = "/LoginAdmin", method = RequestMethod.POST) //Admin login method
    public String postLoginAdmin(HttpServletRequest request, @ModelAttribute("adminModel") AdminModel adminModel) {
        if (adminService.checkAdmin(adminModel)) {  //checks if the entered credentials exist  in DB
            request.getSession(true).setAttribute("logged", true); //activates the session
            return "homePageAdmin";
        }
        return "unauthorised";
    }

    @RequestMapping(value = "homePageAdmin")
    public String getHomePageAdmin() {
        return "homePageAdmin";
    }

    @RequestMapping(value = "logoutAdmin") //logs out the  admin
    public String getLogoutAdmin(HttpServletRequest request, @ModelAttribute("adminModel") AdminModel adminModel) {
        request.getSession(true).invalidate(); //terminates the session
        return "adminAccountLogin";
    }
}
