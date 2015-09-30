package com.yaolan.wxacm.web.dao;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.web.model.Wxac;

import java.util.List;

/**
 * Created by Yaolan on 2015/8/12.
 */
public interface WxacMapper extends GenericDao<Wxac, Long> {
    /**
     * 获取所有活动信息
     *
     * @param record
     * @return
     */
    List<Wxac> getAllAc();

    /**
     * 根据对象插入到数据库
     * @param wxac
     * @return
     */
    int insertSelective(Wxac wxac);

    int updateByPrimaryKey(Wxac wxac);

    int deleteByFKey(Long id,Long pzid);

    int save_pz_ac(Long acid,Long pzid);

    int updateStats(Integer stats,Integer acid);

}
