package com.yaolan.wxacm.web.dao;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.web.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Yaolan on 2015/8/11.
 */
public interface UserMapper extends GenericDao<User, Long> {
    /**
     * 用户登录验证查询
     *
     * @param record
     * @return
     */
    User authentication(@Param("record") User record);
}
