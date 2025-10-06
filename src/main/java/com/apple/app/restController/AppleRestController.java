package com.apple.app.restController;

import com.apple.app.dto.AppleDto;
import com.apple.app.service.AppleService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class AppleRestController {
    @Autowired
    AppleService service ;

    @GetMapping("useRegister")
    public String userInfo() {
        return "register";
    }

    @GetMapping("registerUser")
    public String index() {
        return "register";
    }

    @GetMapping("index")
    public String indexPage() {
        return "index";
    }

    @GetMapping("contact")
    public String contactPage() {
        return "contact";
    }

    @GetMapping("mac")
    public String macPage() {
        return "mac";
    }

    @GetMapping("iphone")
    public String iphonePage() {
        return "iphone";
    }

    @GetMapping("userLogin")
    public String login() {
        return "login";
    }

    @GetMapping("forgotPass")
    public String forget() {
        return "forgotPassword";
    }

    @GetMapping("resetForm")
    public String reset(){
        return "resetPassword";
    }

    @GetMapping("profilePage")
    public String viewProfile(HttpSession session, Model model){
        String  emailNPh = session.getAttribute("emailNPh").toString();
        AppleDto appleDto = service.displayUserByEmail(emailNPh);
        model.addAttribute("dto",appleDto);
        return "viewProfile";
    }

    @PostMapping("updateProfile")
    public String update(HttpSession httpSession, Model model){
        String  emailNPh = httpSession.getAttribute("emailNPh").toString();
       AppleDto appleDto = service.displayUserByEmail(emailNPh);
       model.addAttribute("dto",appleDto);
        return "profileUpdate";
    }

    @PostMapping("logout")
    public String redirect(){
        return "index";
    }
}
