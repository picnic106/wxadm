package com.yaolan.wxacm.web.service;

import com.yaolan.wxacm.core.generic.GenericService;
import com.yaolan.wxacm.web.model.Prize;

import java.util.List;

/**
 * Created by Yaolan on 2015/8/14.
 */
public interface PrizeService extends GenericService<Prize, Long> {
    public List<Prize> selectPrizeByAc(Long acid);

    public List<Prize> selectPrizeByPz(Long pzid);
    public List<Prize> selectPrizeByAcStats(Integer stats);
}
