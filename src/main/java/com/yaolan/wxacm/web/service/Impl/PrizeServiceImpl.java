package com.yaolan.wxacm.web.service.Impl;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.core.generic.GenericServiceImpl;
import com.yaolan.wxacm.web.dao.PrizeMapper;
import com.yaolan.wxacm.web.model.Prize;
import com.yaolan.wxacm.web.service.PrizeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Yaolan on 2015/8/14.
 */
@Service
public class PrizeServiceImpl extends GenericServiceImpl<Prize, Long> implements PrizeService {
    @Resource
    private PrizeMapper prizeMapper;

    @Override
    public GenericDao<Prize, Long> getDao() {
        return prizeMapper;
    }
    @Override
    public List<Prize> selectList() {
        return prizeMapper.getAllPz();
    }

    @Override
    public int insert(Prize model) {
        return prizeMapper.insertSelective(model);
    }


    public List<Prize> selectPrizeByAc(Long acid){
        return prizeMapper.getPzByac(acid);
    }

    public List<Prize> selectPrizeByPz(Long pzid){
        return prizeMapper.getPzByPz(pzid);
    }

    public List<Prize> selectPrizeByAcStats(Integer stats){
        return prizeMapper.getPzByStats(stats);
    }
}
