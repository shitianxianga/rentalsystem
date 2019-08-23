package cn.yd.carrentalsystem.service;

import cn.yd.carrentalsystem.po.Car;

import java.util.List;

public interface CustService {

    List<Car> findCars(String deliveryAddress, String pickUpAddress);
}
