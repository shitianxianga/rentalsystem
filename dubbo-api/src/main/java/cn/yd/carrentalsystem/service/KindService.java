package cn.yd.carrentalsystem.service;

import cn.yd.carrentalsystem.po.Kind;

import java.util.List;

public interface KindService {
    List<Kind> getAllKinds();
    int getKid(Integer id);


}
