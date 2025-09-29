package com.apple.app.restController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AppleRestController {
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

    @GetMapping("updateProfile")
    public String update(){
        return "updateUser";
    }
}
