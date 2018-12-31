package com.homework.entity;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String loginName;

    public User(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    //
//    public User(String username, String password) {
//        this.username = username;
//        this.password = password;
//    }
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User() {
    }

    public User(int id, String username, String password, String email, String loginName) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.loginName = loginName;
    }

    public User(String username, String password, String email, String loginName) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.loginName = loginName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
