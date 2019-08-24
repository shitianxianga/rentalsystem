package cn.yd.carrentalsystem.controller;


import cn.yd.carrentalsystem.po.CarQueryVo;
import cn.yd.carrentalsystem.po.User;
import cn.yd.carrentalsystem.service.CarService;
import cn.yd.carrentalsystem.service.UserService;
import cn.yd.carrentalsystem.utils.FastDFSClient;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {

@Value("${Host}")
private String host;
    @Autowired
    private UserService userService;
    @Autowired
    private CarService carService;


    @ResponseBody
    @RequestMapping("/regist")
    public  String Regist(String phone,String password)
    {
        boolean isExist = userService.getUserExist(phone);
        if(!isExist&& !StringUtils.isEmpty(phone) &&!StringUtils.isEmpty(password)){
            userService.regist(phone,password);
        }
        return "{\"status\":1}";
    }
    @RequestMapping("/toRegist")
    public String toRegist(){
        return "regist";
    }
    @RequestMapping("/toLogin")
    public  String toLogin()
    {

        return "login";
    }

    /**
     * 登录
     * @param request
     * @param phone
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request, String phone, String password) {

        password = DigestUtils.md5Hex(password);
        User user = userService.login(phone, password);
        if (user == null) {
            request.setAttribute("er", "账号或密码错误");
            return "login";
        }
            request.getSession().setAttribute("user", user);

        if(user.getState().equals("2"))
        {
            return "redirect:toMenu";
        }


        return "redirect:toIndex";
    }
/**
 * 退出登录
 */
@RequestMapping("/user/loginout")
public String loginout(HttpServletRequest request)
{
    request.getSession().removeAttribute("user");
    return "redirect:toLogin";
}
    /**
     * 去前台主页
     * @return
     */
    @RequestMapping("toIndex")
    public String toIndex(HttpServletRequest request)
    {
        List<CarQueryVo> cars=carService.getHotCars();
        request.getSession().setAttribute("cars",cars);
        return "index";
    }

    /**
     *
     *
     * @return
     */
@RequestMapping("toMenu")
public  String toMenu()
{
    return  "system/menu";
}

    @ResponseBody
    @RequestMapping("/getUserExist/{name}")
    public String getUserExist(@PathVariable("name") String username){
        boolean isExist = userService.getUserExist(username);

        return "{\"isExist\":"+isExist+"}";
    }

    /**
     *  去身份认证页面
     */

    @RequestMapping("/user/identitySAuth")
    public  String  identitySAuth(HttpServletRequest request)
    {
        User user = (User) request.getSession().getAttribute("user");
        if (user.getState().equals("1"))
        {
            String idCard[]=user.getIdcardimgs().split(",");
            String driverCard[]=user.getLicenseiimg().split(",");
            request.setAttribute("idCard1",host+idCard[0]);
            request.setAttribute("idCard2",host+idCard[1]);
            request.setAttribute("driverCard1",host+driverCard[0]);
            request.setAttribute("driverCard2",host+driverCard[0]);
            return "user/authenticationAccountT";
        }
        return "user/authenticationAccount";
    }
    /**
     * 去修改密码页面
     * @return
     */
    @RequestMapping("/user/toChangePwd")
    public String toChangePwd(){

        return  "user/improveAccount";
    }

    /**
     * 修改密码
     * @param request
     * @param newPassword
     * @return
     */
    @RequestMapping("/user/changePwd")
    public String changePwd(HttpServletRequest request,String newPassword)
    {
       User user= (User) request.getSession().getAttribute("user");
        newPassword = DigestUtils.md5Hex(newPassword);
       userService.changePwd(user,newPassword);
        return  "redirect:/order/findOrderList/0";
    }
    @RequestMapping("/user/testPwd/{oldPassword}")
    @ResponseBody
public String testPwd(@PathVariable("oldPassword") String oldPassword,HttpServletRequest request)
{
    User user= (User) request.getSession().getAttribute("user");
    if (DigestUtils.md5Hex(oldPassword).equals(user.getPassword()))
    {
        return  "{\"isSame\":"+true+"}";
    }
    else
    {
        return  "{\"isSame\":"+false+"}";
    }
}
    /**
     * 完善信息
     * @param request
     * @param name
     * @param address
     * @param idCardNum
     * @param idCard1
     * @param idCard2
     * @param driverCar1
     * @param driverCar2
     * @return
     */
    @RequestMapping("/user/authentica")
    public String authentica(HttpServletRequest request, String name, String address,
                             String idCardNum, MultipartFile idCard1,MultipartFile idCard2,
                             MultipartFile driverCar1,MultipartFile driverCar2)
    {
        User user= (User) request.getSession().getAttribute("user");

        //1、取文件的扩展名
        try {
            String originalFilename1 = idCard1.getOriginalFilename();
            String originalFilename2=idCard2.getOriginalFilename();
            String originalFilename3=driverCar1.getOriginalFilename();
            String originalFilename4 =driverCar2.getOriginalFilename();
            String extName = originalFilename1.substring(originalFilename1.lastIndexOf(".") + 1);
            String extName1=originalFilename2.substring(originalFilename2.lastIndexOf(".") + 1);
            String extName2=originalFilename3.substring(originalFilename3.lastIndexOf(".") + 1);
            String extName3=originalFilename4.substring(originalFilename4.lastIndexOf(".") + 1);

            //2、创建一个FastDFS的客户端
            FastDFSClient fastDFSClient = null;

            fastDFSClient = new FastDFSClient("classpath:client.conf");
            //3、执行上传处理
            String idCard1Path = fastDFSClient.uploadFile(idCard1.getBytes(), extName);
            idCard1Path=idCard1Path+","+fastDFSClient.uploadFile(idCard2.getBytes(),extName1);
            String driverCarPath=fastDFSClient.uploadFile(driverCar1.getBytes(), extName);
            driverCarPath=driverCarPath+","+fastDFSClient.uploadFile(driverCar2.getBytes(), extName);
            System.out.println(driverCarPath);
            user.setIdcardimgs(idCard1Path);
            user.setLicenseiimg(driverCarPath);
            user.setName(name);
            user.setAddress(address);
            user.setIdcardnum(idCardNum);
            userService.updateUser(user);
            //4、拼接返回的url和ip地址，拼装成完整 的url
             request.getSession().setAttribute("user",user);
             return "redirect:/order/findOrderList/0";
        }
        catch(Exception e)
        {
             e.printStackTrace();
        }
        return "redirect:/order/findOrderList/0";
    }

}
