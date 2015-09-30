package com.yaolan.wxacm.web.service.Impl;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.core.generic.GenericServiceImpl;
import com.yaolan.wxacm.web.dao.SignUpUserMapper;
import com.yaolan.wxacm.web.dao.WxacMapper;
import com.yaolan.wxacm.web.model.Wxac;
import com.yaolan.wxacm.web.service.WxacService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Yaolan on 2015/8/12.
 */
@Service
public class WxacServiceImpl extends GenericServiceImpl<Wxac, Long> implements WxacService {
    @Resource
    private WxacMapper wxacMapper;
    @Resource
    private SignUpUserMapper signUpUserMapper;

    @Override
    public GenericDao<Wxac, Long> getDao() {
        return wxacMapper;
    }

    @Override
    public List<Wxac> selectList() {
        return wxacMapper.getAllAc();
    }

    @Override
    public int insert(Wxac model) {
        return wxacMapper.insertSelective(model);
    }

    public int savePzAc(Long acid,Long pzid){
        return wxacMapper.save_pz_ac(acid,pzid);
    }

    public int updateStats(Integer stats,Integer pzid){
        return wxacMapper.updateStats(stats, pzid);
    }

    @Override
    public int update(Wxac model){return wxacMapper.updateByPrimaryKey(model);}

    public int deleteByFKey(Long id,Long pzid){return wxacMapper.deleteByFKey(id,pzid);}

    public List<Map<String,Object>> selectCharts(Long acid){return signUpUserMapper.selectCharts(acid);}

    public List<Map<String,Object>> selectSignUpUsers(Long acid){return signUpUserMapper.selectSignUpUsers(acid);}
}
