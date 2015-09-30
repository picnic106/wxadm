package com.yaolan.wxacm.web.service.Impl;

import com.yaolan.wxacm.core.generic.GenericDao;
import com.yaolan.wxacm.core.generic.GenericServiceImpl;
import com.yaolan.wxacm.web.dao.UserMapper;
import com.yaolan.wxacm.web.model.User;
import com.yaolan.wxacm.web.service.UserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Yaolan on 2015/8/11.
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, Long> implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public int insert(User model) {
        return userMapper.insertSelective(model);
    }

    @Override
    public int update(User model) {
        return userMapper.updateByPrimaryKeySelective(model);
    }

    @Override
    public int delete(Long id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User authentication(User user) {
        return userMapper.authentication(user);
    }

    @Override
    public User selectById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public GenericDao<User, Long> getDao() {
        return userMapper;
    }

    @Override
    public User selectByUsername(String username) {
       // UserExample example = new UserExample();
       // example.createCriteria().andUsernameEqualTo(username);
       // final List<User> list = userMapper.selectByExample(example);
        return null;
    }
}
