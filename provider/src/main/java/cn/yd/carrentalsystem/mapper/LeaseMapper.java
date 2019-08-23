package cn.yd.carrentalsystem.mapper;

import cn.yd.carrentalsystem.po.Lease;
import cn.yd.carrentalsystem.po.LeaseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface LeaseMapper {
    int countByExample(LeaseExample example);

    int deleteByExample(LeaseExample example);

    int deleteByPrimaryKey(String lid);

    int insert(Lease record);

    int insertSelective(Lease record);

    List<Lease> selectByExample(LeaseExample example);

    Lease selectByPrimaryKey(String lid);

    int updateByExampleSelective(@Param("record") Lease record, @Param("example") LeaseExample example);

    int updateByExample(@Param("record") Lease record, @Param("example") LeaseExample example);

    int updateByPrimaryKeySelective(Lease record);

    int updateByPrimaryKey(Lease record);
}