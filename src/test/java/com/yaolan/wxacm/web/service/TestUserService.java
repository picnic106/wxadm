package com.yaolan.wxacm.web.service;

import com.yaolan.wxacm.web.model.User;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;

/**
 * Created by Yaolan on 2015/8/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml",
        "classpath:spring-mybatis.xml" })
public class TestUserService {
    private static final Logger LOGGER = Logger
            .getLogger(TestUserService.class);

    @Autowired
    private UserService userService;

    @Test
    public void testQueryById1() {
        User user=new User();
        user.setUsername("starzou");
        user.setPassword("8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92");
        User userInfo =userService.authentication(user);
        LOGGER.info(userInfo == null ? "null" : userInfo.getUsername());
    }
}
