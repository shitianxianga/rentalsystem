package cn.yd.carrentalsystem.service.impl;

import cn.yd.carrentalsystem.mapper.CarMapper;
import cn.yd.carrentalsystem.mapper.KindMapper;
import cn.yd.carrentalsystem.mapper.UserMapper;
import cn.yd.carrentalsystem.po.*;
import cn.yd.carrentalsystem.service.SystemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class SystemServiceImpl implements SystemService {

    @Autowired(required = false)
    private CarMapper carMapper;
    @Autowired(required = false)
    private KindMapper kindMapper;
    @Autowired(required = false)
    private UserMapper userMapper;

    @Override
    public PageBean<Car> findCarAll(Integer pc, Integer ps, CarQueryVo carQueryVo) throws Exception {

        PageBean<Car> pb = new PageBean<Car>();
        PageHelper.startPage(pc, ps);//计算分页数据

        CarExample carExample = new CarExample();
        carExample.setOrderByClause("cid desc");

        List<Car> carlist = carMapper.selectByState(carExample);
        pb.setResultList(carlist);//将当前页显示的记录存入集合

        PageInfo<Car> info = new PageInfo<Car>(carlist);
        pb.setPageInfo(info);

        return pb;
    }
    @Override
    public PageBean<Car> findCar(Integer pc, Integer ps, CarQueryVo carQueryVo) throws Exception {

        PageBean<Car> pb = new PageBean<Car>();
        PageHelper.startPage(pc, ps);//计算分页数据

        CarExample carExample = new CarExample();
        carExample.setOrderByClause("cid desc");

        //组合查询条件
       CarExample.Criteria criteria = carExample.createCriteria();

        //组合查询条件(url用)
        String urlStr = "";

        //判断查询条件是否为null
        if(carQueryVo.getCarCustom()!=null){
            //判断是否传入了名称
            if(carQueryVo.getCarCustom().getCname()!=null && !"".equals(carQueryVo.getCarCustom().getCname())){
                criteria.andCnameLike("%"+carQueryVo.getCarCustom().getCname()+"%");
                urlStr += "&carCustom.cname="+carQueryVo.getCarCustom().getCname();
            }
            //判断是否传入了车型
            if(carQueryVo.getCarCustom().getCdesc()!=null && !"".equals(carQueryVo.getCarCustom().getCdesc())){
                criteria.andCdescLike("%"+carQueryVo.getCarCustom().getCdesc()+"%");
                urlStr += "&carCustom.cdesc="+carQueryVo.getCarCustom().getCdesc();
            }

            //判断是否传入了导航仪
            if(carQueryVo.getCarCustom().getNavigator()!=null && !"".equals(carQueryVo.getCarCustom().getNavigator())){
                criteria.andNavigatorEqualTo(carQueryVo.getCarCustom().getNavigator());
                urlStr += "&carCustom.navigator="+carQueryVo.getCarCustom().getNavigator();
            }
            //判断是否传入了自动挡
            if(carQueryVo.getCarCustom().getAutomatic()!=null && !"".equals(carQueryVo.getCarCustom().getAutomatic())){
                criteria.andAutomaticEqualTo(carQueryVo.getCarCustom().getAutomatic());
                urlStr += "&carCustom.automatic="+carQueryVo.getCarCustom().getAutomatic();
            }
            //判断是否传入了天窗
            if(carQueryVo.getCarCustom().getSkylight()!=null && !"".equals(carQueryVo.getCarCustom().getSkylight())){
                criteria.andSkylightEqualTo(carQueryVo.getCarCustom().getSkylight());
                urlStr += "&carCustom.skylight="+carQueryVo.getCarCustom().getSkylight();
            }
            pb.setUrl(urlStr);
        }
        List<Car> carlist = carMapper.selectByExample(carExample);
        pb.setResultList(carlist);//将当前页显示的记录存入集合

        PageInfo<Car> info = new PageInfo<Car>(carlist);
        pb.setPageInfo(info);

        return pb;
    }

    @Override
    public void deleteCar(Car car) throws Exception {

        carMapper.deleteCar(car);

    }

    @Override
    public Car findCarById(Integer uid) throws Exception {

        return carMapper.selectByPrimaryKey(uid);
    }

    @Override
    public void editCar(Car car) throws Exception {
        carMapper.updateByPrimaryKeySelective(car);
    }
    @Override
    public void addCar(Car car) throws Exception {
        carMapper.insert(car);
    }

    @Override
    public PageBean<User> findUserAll(Integer pc, Integer ps, UserQueryVo userQueryVo) throws Exception {

        PageBean<User> pb = new PageBean<User>();
        PageHelper.startPage(pc, ps);//计算分页数据

        UserExample userExample = new UserExample();
        userExample.setOrderByClause("uid desc");

        List<User> userlist = userMapper.selectByState(userExample);
        pb.setResultList(userlist);//将当前页显示的记录存入集合

        PageInfo<User> info = new PageInfo<User>(userlist);
        pb.setPageInfo(info);

        return pb;
    }
    @Override
    public PageBean<User> findUser(Integer pc, Integer ps, UserQueryVo userQueryVo) throws Exception {

        PageBean<User> pb = new PageBean<User>();
        PageHelper.startPage(pc, ps);//计算分页数据

        UserExample userExample = new UserExample();
        userExample.setOrderByClause("uid desc");

        //组合查询条件
        UserExample.Criteria criteria = userExample.createCriteria();

        //组合查询条件(url用)
        String urlStr = "";

        //判断查询条件是否为null
        if(userQueryVo.getUserCustom()!=null){
            //判断是否传入了编号
            if(userQueryVo.getUserCustom().getUid()!=null && !"".equals(userQueryVo.getUserCustom().getUid())){
                criteria.andUidEqualTo(userQueryVo.getUserCustom().getUid());
                urlStr += "&userCustom.uid="+userQueryVo.getUserCustom().getUid();
            }
            //判断是否传入了名称
            if(userQueryVo.getUserCustom().getName()!=null && !"".equals(userQueryVo.getUserCustom().getName())){
                criteria.andNameLike("%"+userQueryVo.getUserCustom().getName()+"%");
                urlStr += "&userCustom.name="+userQueryVo.getUserCustom().getName();
            }
            //判断是否传入了账户状态
            if(userQueryVo.getUserCustom().getState()!=null && !"".equals(userQueryVo.getUserCustom().getState())){
                criteria.andStateEqualTo(userQueryVo.getUserCustom().getName());
                urlStr += "&userCustom.state="+userQueryVo.getUserCustom().getState();
            }
            pb.setUrl(urlStr);
        }
        List<User> userlist = userMapper.selectByExample(userExample);
        pb.setResultList(userlist);//将当前页显示的记录存入集合

        PageInfo<User> info = new PageInfo<User>(userlist);
        pb.setPageInfo(info);

        return pb;
    }

    @Override
    public void deleteUser(User user) throws Exception {

        userMapper.deleteUser(user);

    }

    @Override
    public User findUserById(Integer uid) throws Exception {

        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public void editUser(User user) throws Exception {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void editstate(User user) throws Exception{

        userMapper.updatestate(user);
    }

    @Override
    public void deleteImg(Integer cid, Integer index) {
        Car car = carMapper.selectByPrimaryKey(cid);
        String[] imgs = car.getImgs().split(";");
        String newImgs = "";
        for(int i=0;i<imgs.length;i++){
            if(i!=index)
                newImgs+=imgs[i]+";";
        }
        car.setImgs(newImgs);
        carMapper.updateByPrimaryKey(car);
    }

    @Override
    public PageBean<Kind> findKindAll(Integer pc, Integer ps, KindQueryVo kindQueryVo) throws Exception {

        PageBean<Kind> pb = new PageBean<Kind>();
        PageHelper.startPage(pc, ps);//计算分页数据

        KindExample kindExample = new KindExample();
        kindExample.setOrderByClause("kid desc");

        List<Kind> kindlist = kindMapper.selectByExample(kindExample);
        pb.setResultList(kindlist);//将当前页显示的记录存入集合

        PageInfo<Kind> info = new PageInfo<Kind>(kindlist);
        pb.setPageInfo(info);

        return pb;
    }
    @Override
    public PageBean<Kind> findKind(Integer pc, Integer ps, KindQueryVo kindQueryVo) throws Exception {

        PageBean<Kind> pb = new PageBean<Kind>();
        PageHelper.startPage(pc, ps);//计算分页数据

        KindExample kindExample = new KindExample();
        kindExample.setOrderByClause("kid desc");

        //组合查询条件
        KindExample.Criteria criteria = kindExample.createCriteria();

        //组合查询条件(url用)
        String urlStr = "";

        //判断查询条件是否为null
        if(kindQueryVo.getKindCustom()!=null){
            //判断是否传入了名称
            if(kindQueryVo.getKindCustom().getKname()!=null && !"".equals(kindQueryVo.getKindCustom().getKname())){
                criteria.andKnameLike("%"+kindQueryVo.getKindCustom().getKname()+"%");
                urlStr += "&kindCustom.kname="+kindQueryVo.getKindCustom().getKname();
            }
            pb.setUrl(urlStr);
        }
        List<Kind> kindlist = kindMapper.selectByExample(kindExample);
        pb.setResultList(kindlist);//将当前页显示的记录存入集合

        PageInfo<Kind> info = new PageInfo<Kind>(kindlist);
        pb.setPageInfo(info);

        return pb;
    }


    @Override
    public Kind findKindById(Integer kid) throws Exception {

        return kindMapper.selectByPrimaryKey(kid);
    }

    @Override
    public void editKind(Kind kind) throws Exception {
        kindMapper.updateByPrimaryKey(kind);
    }
    @Override
    public void addKind(Kind kind) throws Exception {
        kindMapper.insert(kind);
    }
}
