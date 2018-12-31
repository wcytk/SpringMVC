package com.homework.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.homework.entity.Product;
import com.homework.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/performProduct")
    public String ListAll(@RequestParam(required = true, defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page, 5);
        List<Product> list = productService.performProduct();
        PageInfo<Product> p = new PageInfo(list);
        model.addAttribute("page", p);
        model.addAttribute("Productlist", list);
        return "/performProduct";
    }

    @RequestMapping(value = "/performProduct1")
    public String ListAll2(Model model) {
        List<Product> list = productService.performProduct();
        model.addAttribute("Productlist", list);
        return "/shouye";
    }

    @RequestMapping(value = "/insertGood")
    public String insertUser(Product product) {
        productService.insertProduct(product);
        return "redirect:performProduct";
    }

    @RequestMapping(value = "/deleteGood")
    public String deleteById(int productId) {
        productService.deleteById(productId);
        return "redirect:performProduct";
    }

    @RequestMapping(value = "/editGood")
    public String getGood(int productId, Model model) {
        model.addAttribute("product", productService.findByProductId(productId));
        return "editGoods";
    }

    @RequestMapping(value = "/updateGood")
    public String updateGood(Product product, Model model) {
        productService.updateGood(product);
        return "redirect:/performProduct";
    }

    @RequestMapping(value = "/findByProductId")
    public String findByProductId(int productId, Model model) {
        Product product = productService.findByProductId(productId);
        model.addAttribute("product", product);
        return "/findManyProduct";
    }

    @RequestMapping(value = "/findByProductName")
    public String findByProductName(String productName1, Model model, HttpServletRequest request) {
        String productName = request.getParameter("productName");
        List<Product> list = productService.findByProductName(productName);
        model.addAttribute("Productlist", list);
        return "/findManyProduct";
    }
}
