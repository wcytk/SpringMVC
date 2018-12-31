package com.homework.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.homework.entity.User;
import com.homework.service.impl.ServiceImpl;
import com.homework.util.Ip;
import com.homework.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.homework.util.Md5;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

@Controller
public class UserController {
    @Autowired
    private ServiceImpl service;
    @Autowired
    @Qualifier("mailSender")
    private JavaMailSenderImpl mailSender;

    //      @RequestMapping(value = "/ListAll")
//      public String ListAll(Model model){
//        List<User> list = service.ListAll();
//        model.addAttribute("userlist",list);
//        return "/ListAll";
//    }
    @RequestMapping("/ListAll")
    public String userList(@RequestParam(required = true, defaultValue = "1") Integer page, HttpServletRequest request, Model model) {
        PageHelper.startPage(page, 5);
        List<User> list = service.selectByList();
        PageInfo<User> p = new PageInfo(list);
        model.addAttribute("page", p);
        model.addAttribute("userlist", list);
        return "/ListAll";
    }

    @RequestMapping(value = "/checkUser")
    public void checkUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        response.setCharacterEncoding("utf-8");
        //新建一个printWriter对象
        PrintWriter pw = null;
        //通过response 获取pw
        pw = response.getWriter();
        if (service.findByName(username) == null) {
            //用pw对象传递json
            pw.print("{\"result\":\"1\"}");//该用户名可以使用
        } else {
            pw.print("{\"result\":\"2\"}");
        }
        pw.flush();
        pw.close();
    }

    @RequestMapping(value = "/checkEmail")
    public void checkEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        response.setCharacterEncoding("utf-8");
        //新建一个printWriter对象
        PrintWriter pw = null;
        //通过response 获取pw
        pw = response.getWriter();
        if (service.findByEmail(email) == null) {
            //用pw对象传递json
            pw.print("{\"result\":\"1\"}");//该用户名可以使用
        } else {
            pw.print("{\"result\":\"2\"}");
        }
        pw.flush();
        pw.close();
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        return "redirect:/";
    }
    //实现注册
    @RequestMapping(value = "/register")
    public String register(String username, String password, String email, HttpServletRequest request) {
        Log log = new Log();
        Ip ip = new Ip();
        ip.setRequest(request);
        String IP = ip.getClientIp();
        String passwordByMd5 = Md5.MD5(password);
        //Session中存好的验证码数值
        String piccode = (String) request.getSession().getAttribute("piccode");
        //前端用户输入的验证码值
        String identifyingCode = request.getParameter("identifyingCode");
        boolean count = true;
        if (username == null || password == null || email == null) count = false;

        if (count) {
            //  service.register(username,passwordByMd5,email);
            if (identifyingCode.equals(piccode) && (!identifyingCode.equals(""))) {
                service.register(username, passwordByMd5, email);
                log.setInfo("邮箱:" + email + " 用户名:" + username + " IP:" + IP + " 注册成功");
                return "redirect:index.jsp";
            } else {
                log.setInfo("邮箱:" + email + " 用户名:" + username + " IP:" + IP + " 注册失败(验证码错误)");
                return "fail";
            }
        } else {
            log.setInfo("邮箱:" + email + " 用户名:" + username + " IP:" + IP + " 注册失败");
            System.out.println(passwordByMd5);
            return "/register";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String email, String password, HttpServletRequest request) {
        Log log = new Log();//设置Log
        String passwordByMd5 = Md5.MD5(password); //Session中存好的验证码数值
        String piccode = (String) request.getSession().getAttribute("piccode");//前端用户输入的验证码值
        String identifyingCode = request.getParameter("identifyingCode");
        User user1 = service.login(email, passwordByMd5);
        Ip ip = new Ip();
        ip.setRequest(request);
        String IP = ip.getClientIp();
        if (user1 != null) {
            if (user1.getEmail().equals("1051160758@qq.com")) {
                if (user1.getPassword().equals("e10adc3949ba59abbe56e057f20f883e")) {
                    System.out.println(user1.getEmail());
                    System.out.println(user1.getPassword());
                    if (identifyingCode.equals(piccode) && (!identifyingCode.equals(" "))) {
                        request.getSession().setAttribute("user", user1);
                        request.getSession().setAttribute("admin", user1);
                        log.setInfo("超级用户:" + user1.getUsername() + " IP:" + IP + " 登录成功");
                        System.out.println(passwordByMd5);
                        return "redirect:ListAll";
                    } else {
                        log.setError("超级用户:" + user1.getUsername() + " IP:" + IP + " 验证码错误");
                        return "fail";
                    }
                } else {
                    log.setError("超级用户:" + user1.getUsername() + " IP:" + IP + " 密码错误");
                    return "fail";
                }
            } else {
                System.out.println(user1.getEmail());
                System.out.println(user1.getPassword());
                if (identifyingCode.equals(piccode) && (!identifyingCode.equals(" "))) {
                    request.getSession().setAttribute("user", user1);
                    log.setInfo("用户:" + user1.getUsername() + " IP:" + IP + " 登录成功");
                    System.out.println(passwordByMd5);
                    return "redirect:performProduct1";
                } else {
                    log.setError("用户:" + user1.getUsername() + " IP:" + IP + " 验证码错误");
                    return "fail";
                }
            }
        } else {
            log.setError("IP:" + IP + " 用户名或密码错误");
            System.out.println(passwordByMd5);
            return "fail";
        }
    }


    @RequestMapping(value = "/forgetPass")
    public String forgetPass(String email, Model model, HttpServletRequest request) {
        Log log = new Log();
        Ip ip = new Ip();
        ip.setRequest(request);
        String IP = ip.getClientIp();
        User user = service.findByEmail(email);
        //Session中存好的验证码数值
        String piccode = (String) request.getSession().getAttribute("piccode");
        //前端用户输入的验证码值
        String identifyingCode = request.getParameter("identifyingCode");
        boolean count = true;
        if (email == null) count = false;
        if (count) {
            //  service.register(username,passwordByMd5,email);
            if (identifyingCode.equals(piccode) && (!identifyingCode.equals(""))) {
                model.addAttribute("user", user);
                log.setInfo("邮箱:" + email + " 用户名:" + user.getUsername() + " IP:" + IP + " 修改密码验证成功");
                return "editPass";
            } else {
                log.setInfo("邮箱:" + email + " 用户名:" + user.getUsername() + " IP:" + IP + " 修改密码验证失败(验证码错误)");
                return "fail";
            }
        } else {
            log.setInfo("邮箱:" + user.getEmail() + " 用户名:" + user.getUsername() + " IP:" + IP + " 修改密码验证失败");
            return "/forgetPassword";
        }
    }

    @RequestMapping(value = "/findById")
        public String findById(int id, Model model) {
        User user = service.findById(id);
        model.addAttribute("user", user);
        return "/findone";
    }

    @RequestMapping(value = "/findByName")
    public String findByName(String username, Model model, HttpServletRequest request) {
        String username1 = request.getParameter("username");
        User user = service.findByName(username1);
        model.addAttribute("user", user);
        return "/findone";
    }

    @RequestMapping(value = "/findByEmail")
    public String findByEmail(String email, Model model, HttpServletRequest request) {
        String userEmail = request.getParameter("email");
        User user = service.findByEmail(userEmail);
        model.addAttribute("user", user);
        return "/findone";
    }

    @RequestMapping(value = "/insert")
    public String insertUser(User user) {
        user.setPassword(Md5.MD5(user.getPassword()));
        service.insertUser(user);
        return "redirect:ListAll";
    }

    @RequestMapping(value = "/delete")
    public String deleteById(int id) {
        service.deleteById(id);
        return "redirect:ListAll";
    }

    @RequestMapping(value = "/update")
    public String getUser(int id, Model model) {
        model.addAttribute("user", service.findById(id));
        return "editUser";
    }

    @RequestMapping(value = "/updateUser")
    public String updateUser(User user, Model model) {
        user.setPassword(Md5.MD5(user.getPassword()));
        service.updateUser(user);
        return "redirect:/ListAll";
    }

    @RequestMapping(value = "/updatePass")
    public String updatePass(User user, Model model) {
        user.setPassword(Md5.MD5(user.getPassword()));
        service.updatePass(user);
        return "redirect:/";
    }

//    @RequestMapping(value = "/login2", method = RequestMethod.POST)
//    public String login2(String email,String password,HttpServletRequest request) {
//        String passwordByMd5 = Md5.MD5(password);
//        User user = new User();
//        user.setEmail(email);
//        user.setPassword(passwordByMd5);
//        //Session中存好的验证码数值
//        String piccode = (String) request.getSession().getAttribute("piccode");
//        SimpleMailMessage message = new SimpleMailMessage();//消息构造器
//        message.setFrom("674908679@qq.com");//发件人
//        message.setTo("674908679@qq.com");//收件人
//        message.setSubject("Spring Email Test");//主题
//        message.setText(piccode);//正文
//        mailSender.send(message);
//        System.out.println("邮件发送完毕");
//        //前端用户输入的验证码值
//        String identifyingCode = request.getParameter("identifyingCode");
//        boolean count = service.login(email,passwordByMd5);
//        if (count == true) {
//            if(identifyingCode.equals(piccode)&&(!identifyingCode.equals(" "))){
//                System.out.println(passwordByMd5);
//                return "redirect:ListAll";
//            }else {
//                return "fail";
//            }
//        } else {
//            return "fail";
//        }
//    }


    @RequestMapping("/VerifyCode")
    public void VerifyCode(HttpServletRequest request, HttpServletResponse response) {
        // 创建一个宽100,高50,且不带透明色的image对象 100 40
        BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_RGB);
        //获得一个画笔
        Graphics g = bi.getGraphics();
        //RGB色彩
        Color c = new Color(255, 255, 255);
        // 框中的背景色
        g.setColor(c);
        // 颜色填充像素
        g.fillRect(0, 0, 100, 40);
        // 定义验证码字符数组
        // 将字符串对象转换为一个字符数组
        char[] ch = "ABCDEFGHIJKLMNPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm0123456798".toCharArray();
        Random r = new Random();
        int len = ch.length;
        int index;
        StringBuffer sb = new StringBuffer();
        // 取出四个数字
        for (int i = 0; i < 4; i++) {
            // 循环四次随机取长度定义为索引
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
            Font font = new Font("Times New Roman", Font.ITALIC, 17);
            g.setFont(font);
            g.drawString(ch[index] + "", (i * 18) + 10, 30);
            sb.append(ch[index]);
        }
        //放入Session中
        request.getSession().setAttribute("piccode", sb.toString());
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @ResponseBody
    @RequestMapping(value = "/youxiang")
    public void sendSimpleEmail(String email, HttpServletRequest request, HttpServletResponse response) {
        email = request.getParameter("email");
        Log log = new Log();
        Ip ip = new Ip();
        ip.setRequest(request);
        String IP = ip.getClientIp();
        System.out.print(email);
        // 创建一个宽100,高50,且不带透明色的image对象 100 40
        BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_RGB);
        //获得一个画笔
        Graphics g = bi.getGraphics();
        // 定义验证码字符数组
        // 将字符串对象转换为一个字符数组
        char[] ch = "ABCDEFGHIJKLMNPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm0123456798".toCharArray();
        Random r = new Random();
        int len = ch.length;
        int index;
        StringBuffer sb = new StringBuffer();
        // 取出四个数字
        for (int i = 0; i < 4; i++) {
            // 循环四次随机取长度定义为索引
            index = r.nextInt(len);
            g.drawString(ch[index] + "", (i * 18) + 10, 30);
            sb.append(ch[index]);
        }
        //放入Session中
        request.getSession().setAttribute("piccode", sb.toString());
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        SimpleMailMessage message = new SimpleMailMessage();//消息构造器
        message.setFrom("1051160758@qq.com");//发件人
        message.setTo(email);//收件人
        message.setSubject("王诚昱的验证码");//主题
        message.setText(sb.toString());//正文
        mailSender.send(message);
        System.out.println("邮件发送完毕");
        log.setInfo("成功向邮箱:" + email + " IP:" + IP + " 发送邮件");
    }

}
