package com.homework.service.impl;

import com.homework.entity.User;
import com.homework.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ServiceImpl {

    @Resource
    private UserMapper userMapper;

    public List<User> ListAll() {
        List<User> list = userMapper.ListAll();
        return list;
    }

    public User findById(int id) {
        User user = userMapper.findById(id);
        return user;
    }

    public User findByName(String username) {
        User user = userMapper.findByName(username);
        return user;
    }

    public User findByEmail(String email) {
        User user = userMapper.findByEmail(email);
        return user;
    }

    public List<User> selectByList() {
        return userMapper.selectByList();
    }

    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    public void deleteById(int id) {
        userMapper.deleteById(id);
    }

    //        public User login(User user){
//        return userMapper.login(user);
//        }
//public User login(String email,String password){
//    return userMapper.login(email,password);
//}
    public User login(String email, String password) {
//        if (!email.equals(" ")&&!password.equals(" ")){
//            return userMapper.login(email,password);
//        }else {
//            return false;
//        }
        return userMapper.login(email, password);
    }

    //       // public boolean register(String username,String password) {
//            return userMapper.register(username,password);
//        }
    public boolean register(String username, String password, String email) {
        return userMapper.register(username, password, email);
    }

    public boolean forgetPass(String email) {
        return userMapper.forgetPass(email);
    }

    public boolean getUser(int id) {
        return userMapper.getUser(id);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public void updatePass(User user) {
        userMapper.updatePass(user);
    }
}
