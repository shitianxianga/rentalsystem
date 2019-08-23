package cn.yd.carrentalsystem.service.impl;

import cn.yd.carrentalsystem.mapper.KindMapper;
import cn.yd.carrentalsystem.po.Kind;
import cn.yd.carrentalsystem.po.KindExample;
import cn.yd.carrentalsystem.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class KindServiceImpl implements KindService {

    @Autowired(required = false)
    private KindMapper kindMapper;
    @Override
    public List<Kind> getAllKinds() {
        List<Kind> kinds = kindMapper.selectByExample(new KindExample());
        return kinds;
    }
    @Override
    public int getKid(Integer id) {
        Integer kid=kindMapper.getKid(id);
        return kid;
    }


}
