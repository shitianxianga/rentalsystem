package cn.yd.carrentalsystem.controller;


import cn.yd.carrentalsystem.po.User;
import cn.yd.carrentalsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
    @Autowired
    private UserService userService;
    @RequestMapping("/hello")
    @ResponseBody
    public User HelloWord()
    {
        return null ;
    }


}
