package cn.yd.carrentalsystem.service;

import cn.yd.carrentalsystem.po.User;


public interface UserService {
    boolean getUserExist(String username);

    void regist(String phone, String password);

    User login(String phone, String password);
    void changePwd(User user, String newPassword);

    void updateUser(User user);

}
