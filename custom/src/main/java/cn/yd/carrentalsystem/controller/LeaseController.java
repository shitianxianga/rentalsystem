package cn.yd.carrentalsystem.controller;

import cn.yd.carrentalsystem.po.LeaseCustom;
import cn.yd.carrentalsystem.po.User;
import cn.yd.carrentalsystem.service.LeaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LeaseController {
    @Autowired
    private LeaseService leaseService;

    @RequestMapping("/order/toOrderDetail")
    public String toOrderDetail(String lid, Model model, HttpSession session){
        LeaseCustom leaseCustom = leaseService.findLeaseCustomByLid(lid);
        User user = (User) session.getAttribute("user");
        if(user.getUid().equals(leaseCustom.getUid()))
            model.addAttribute("leaseCustom", leaseCustom);
        return "customer/orderDetail";
    }
}
