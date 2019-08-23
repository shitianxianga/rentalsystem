package cn.yd.carrentalsystem.service;

import cn.yd.carrentalsystem.po.*;


public interface SystemService {

    PageBean<Car> findCarAll(Integer pc, Integer ps, CarQueryVo carQueryVo) throws Exception;

    PageBean<Car> findCar(Integer pc, Integer ps, CarQueryVo carQueryVo) throws Exception;
    void deleteCar(Car car) throws Exception;

    Car findCarById(Integer cid)throws Exception;

    void editCar(Car car) throws Exception;
    void addCar(Car car) throws Exception;
    PageBean<Kind> findKindAll(Integer pc, Integer ps, KindQueryVo kindQueryVo) throws Exception;

    PageBean<Kind> findKind(Integer pc, Integer ps, KindQueryVo kindQueryVo) throws Exception;


    Kind findKindById(Integer kid) throws Exception;

    void editKind(Kind kind) throws Exception;

    void addKind(Kind kind) throws Exception;
    PageBean<User> findUserAll(Integer pc, Integer ps, UserQueryVo userQueryVo) throws Exception;

    PageBean<User> findUser(Integer pc, Integer ps, UserQueryVo userQueryVo) throws Exception;
    void deleteUser(User user) throws Exception;

    User findUserById(Integer uid)throws Exception;

    void editUser(User user) throws Exception;

    void editstate(User user) throws Exception;

    void deleteImg(Integer cid, Integer index);
}
