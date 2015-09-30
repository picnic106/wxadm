package com.yaolan.wxacm.web.dao;


import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.web.model.Prize;
import com.yaolan.wxacm.web.model.User;

import java.util.List;
import java.util.Map;


/**
 * Created by Yaolan on 2015/8/17.
 */
public interface SignUpUserMapper extends GenericDao<User, Long> {
    List<Map<String,Object>> selectSignUpUsers(Long acid);

    List<Map<String,Object>> selectCharts(Long acid);
}
