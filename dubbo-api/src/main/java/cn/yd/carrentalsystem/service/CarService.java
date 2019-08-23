package cn.yd.carrentalsystem.service;

import cn.yd.carrentalsystem.po.CarCustom;
import cn.yd.carrentalsystem.po.CarQueryVo;
import cn.yd.carrentalsystem.po.QueryVo;

import java.util.List;

public interface CarService {
    List<CarCustom> getCarListByQueryVo(QueryVo vo);

    CarCustom getCarByCid(Integer cid);


    List<CarQueryVo> getHotCars();
}
