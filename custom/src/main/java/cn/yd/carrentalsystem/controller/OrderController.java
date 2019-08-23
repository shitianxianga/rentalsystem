package cn.yd.carrentalsystem.controller;

import cn.yd.carrentalsystem.po.*;
import cn.yd.carrentalsystem.service.CarService;
import cn.yd.carrentalsystem.service.LeaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.UUID;

@Controller
public class OrderController {
    @Autowired
    private LeaseService leaseService;
    @Autowired
    private CarService carService;
    /**
     *
     *查询订单
     */

    @RequestMapping("/order/findOrderList/{state}")
    public String findOrderList(HttpServletRequest request, @PathVariable("state") int state, @RequestParam(value = "pc",required=true,defaultValue ="1") Integer pc)
    {
        Integer ps=4;

        User user = (User) request.getSession().getAttribute("user");
        PageBean<LeaseQueryVo> pageBean=leaseService.findLeaseList(user.getState(), user.getUid(),state,pc,ps);
        request.setAttribute("pageBean",pageBean);
        if (user.getState().equals("2")&&state==1) {
            return "system/rentalapplication";
        }
        if (user.getState().equals("2")&&state==4) {
            return "system/returnapplication";
        }
        if (user.getState().equals("2")&&state==0) {
            return "system/orderList";
        }
        if (user.getState().equals("2")&&state==3) {
            return "system/getCar";
        }
        return "user/order";
    }

    @RequestMapping("/order/toOrderPreview")
    public String toOrderPreview(Integer cid, Model model){
        //用户状态校验
        CarCustom carCustom = carService.getCarByCid(cid);
        model.addAttribute("carCustom", carCustom);

        return "customer/orderPreview";
    }

    @RequestMapping("/order/makeLease")
    public String makeLease(Integer cid, String receiveaddress, String returnaddress, String receivetime,
                            String returntime, String contactphone, HttpSession session,Model model) throws ParseException {
        Lease lease = new Lease();
        String uuid=UUID.randomUUID().toString();
        uuid=uuid.replaceAll("-","");
        lease.setLid(uuid);

        lease.setCid(cid);
        lease.setCreatetime(new Date());
        lease.setUid(((User)session.getAttribute("user")).getUid());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        Date returnTime = format.parse(returntime);
        Date receiveTime = format.parse(receivetime);
        lease.setReceivetime(receiveTime);
        if(receiveTime.before(returnTime))
            lease.setReturntime(returnTime);
        else {
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(receiveTime);
            calendar.add(calendar.DATE,1);
            lease.setReturntime(calendar.getTime());
        }
        lease.setState(1);
        lease.setContactphone(contactphone);

        CarCustom car = carService.getCarByCid(cid);
        if(receiveaddress.equals(""))
            lease.setReceiveaddress("（网点取车）"+car.getStartaddress());
        else
            lease.setReceiveaddress(receiveaddress);

        if(returnaddress.equals(""))
            lease.setReturnaddress("（网点还车）"+car.getEndaddress());
        else
            lease.setReturnaddress(returnaddress);

        leaseService.addLease(lease);

        model.addAttribute("tip", "订单提交成功");
        return "forward:/order/findOrderList/0";
    }
    /**
     * 审核
     */
    @RequestMapping("/order/audit")
    public String audit(@RequestParam(value = "s") int state, @RequestParam(value = "l" ) String lid)
    {
        leaseService.updateState(state,lid);
        if (state==2)
        {
            return "redirect:findOrderList/1";
        }
        if (state==5)
        {
            return "redirect:findOrderList/4";
        }
        if (state==6)
        {
            return "redirect:findOrderList/0";
        }
        return "404";

    }

    @RequestMapping("/order/returnApply")
    public String returnApply(String lid,HttpSession session,Model model){
        LeaseCustom leaseCustom = leaseService.findLeaseCustomByLid(lid);
        User user = (User) session.getAttribute("user");
        if(!user.getUid().equals(leaseCustom.getUid()))
            return null;
        leaseService.returnApply(lid);

        model.addAttribute("tip", "还车申请提交成功");
        return "forward:/order/findOrderList/0";
    }

    /**
     * 取消订单
     */
    @RequestMapping("/order/cancelLease")
    public String cancelLease(String lid,HttpSession session,Model model){
        LeaseCustom leaseCustom = leaseService.findLeaseCustomByLid(lid);
        User user = (User) session.getAttribute("user");
        if(!user.getUid().equals(leaseCustom.getUid()))
            return null;
        if(leaseService.findLeaseByLid(lid).getState()!=1)
            return null;
        leaseService.updateState(6, lid);

        model.addAttribute("tip", "取消订单成功");
        return "forward:/order/findOrderList/0";
    }
}
