package cn.yd.carrentalsystem.service.impl;

import cn.yd.carrentalsystem.mapper.CarMapper;
import cn.yd.carrentalsystem.po.Car;
import cn.yd.carrentalsystem.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustServiceImpl implements CustService {
    @Autowired
    private CarMapper carMapper;
    @Override
    public List<Car> findCars(String deliveryAddress, String pickUpAddress) {

        return null;
    }
}
