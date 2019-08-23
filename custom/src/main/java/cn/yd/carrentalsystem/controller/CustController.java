package cn.yd.carrentalsystem.controller;

import cn.yd.carrentalsystem.po.CarCustom;
import cn.yd.carrentalsystem.po.Kind;
import cn.yd.carrentalsystem.po.QueryVo;
import cn.yd.carrentalsystem.service.CarService;
import cn.yd.carrentalsystem.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class CustController {

    @Autowired
    private KindService kindService;
    @Autowired
    private CarService carService;
 Object object;

    @RequestMapping("/conditionSubmit")
    public String conditionSubmit(HttpServletRequest request, String deliveryAddress, String pickUpAddress, String startTime, String endTime)
    {
        QueryVo vo = new QueryVo();
        vo.setStartAddress(deliveryAddress);
        vo.setEndAddress(pickUpAddress);
        request.getSession().setAttribute("vo", vo);

        request.getSession().setAttribute("startTime",startTime);
        request.getSession().setAttribute("endTime",endTime);

        return "redirect:/toCarList";
    }

    @RequestMapping("/toCarList")
    public String toCarList(HttpSession session, Model model){

        QueryVo vo = (QueryVo) session.getAttribute("vo");
        System.out.println(vo);
        List<CarCustom> cars = carService.getCarListByQueryVo(vo);

        List<Kind> kinds = kindService.getAllKinds();

        model.addAttribute("queryVo", vo);
        model.addAttribute("kinds", kinds);
        model.addAttribute("cars", cars);
        return "customer/carList";
    }

    @RequestMapping("/addCondition")
    public String addCondition(HttpSession session, QueryVo vo, String startTime, String endTime){
        session.setAttribute("vo", vo);
        session.setAttribute("startTime",startTime);
        session.setAttribute("endTime",endTime);
        return "redirect:/toCarList";
    }

    @RequestMapping("/toCarDetail")
    public String toCarDetail(Integer cid,Model model){

        CarCustom carCustom = carService.getCarByCid(cid);

        System.out.println(carCustom);
        model.addAttribute("carCustom", carCustom);
        return "customer/carDetail";
    }
}
