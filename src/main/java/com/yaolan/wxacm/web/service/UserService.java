package com.yaolan.wxacm.web.service;

import com.yaolan.wxacm.core.generic.GenericService;
import com.yaolan.wxacm.web.model.User;

/**
 * 用户 业务 接口
 * Created by Yaolan on 2015/8/11.
 */
public interface UserService extends GenericService<User, Long> {

    /**
     * 用户验证
     *
     * @param user
     * @return
     */
    User authentication(User user);

    /**
     * 根据用户名查询用户
     *
     * @param username
     * @return
     */
    User selectByUsername(String username);

}
