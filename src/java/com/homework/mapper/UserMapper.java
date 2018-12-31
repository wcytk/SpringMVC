package com.homework.mapper;

import com.homework.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    List<User> ListAll();

    void insertUser(User user);

    User findById(int id);

    User findByName(@Param("username") String username);

    User findByEmail(@Param("email") String email);

    void deleteById(int id);

    User login(@Param("email") String email, @Param("password") String password);

    boolean register(@Param("username") String username, @Param("password") String password, @Param("email") String email);

    boolean forgetPass(@Param("email") String email);

    List<User> selectByList();

    boolean getUser(int id);

    void updateUser(User user);

    void updatePass(User user);
}
