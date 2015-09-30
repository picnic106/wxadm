package com.yaolan.wxacm.web.dao;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.web.model.Prize;

import java.util.List;

/**
 * Created by Yaolan on 2015/8/14.
 */
public interface PrizeMapper extends GenericDao<Prize, Long> {
    /**
     * 获取所有活动信息
     *
     * @param record
     * @return
     */
    List<Prize> getAllPz();

    /**
     * 根据对象插入到数据库
     * @param wxac
     * @return
     */
    int insertSelective(Prize wxac);

    /**
     * 根据对象插入到数据库
     * @param wxac
     * @return
     */
    List<Prize> getPzByac(Long acid);

    /**
     * 根据对象插入到数据库
     * @param wxac
     * @return
     */
    List<Prize> getPzByPz(Long pzid);

    /**
     * 根据对象插入到数据库
     * @param wxac
     * @return
     */
    List<Prize> getPzByStats(Integer stats);
}
