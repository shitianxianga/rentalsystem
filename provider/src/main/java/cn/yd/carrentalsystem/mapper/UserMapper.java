package cn.yd.carrentalsystem.mapper;

import cn.yd.carrentalsystem.po.User;
import cn.yd.carrentalsystem.po.UserExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer uid);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int updateByExampleWithBLOBs(@Param("record") User record, @Param("example") UserExample example);

    int updatestate(User record);

    int deleteUser(User record);

    List<User> selectByState(UserExample example);
}