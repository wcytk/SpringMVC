package com.homework.service;

import com.homework.entity.Product;
import com.homework.entity.User;
import com.homework.mapper.ProductMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductService {
    @Resource
    private ProductMapper productMapper;

    public List<Product> performProduct() {
        List<Product> listProduct = productMapper.performProduct();
        return listProduct;
    }
    public void insertProduct(Product product){
        productMapper.insertProduct(product);
    }

    public void deleteById(int productId){
        productMapper.deleteByProductId(productId);
    }

    public Product findByProductId(int productId){
        Product product = productMapper.findByProductId(productId);
        return product;
    }

    public List<Product> findByProductName(String productName){
        List<Product> listFindResult = productMapper.findByProductName(productName);
        return listFindResult;
    }

    public boolean getGood(int id) {
        return productMapper.getGood(id);
    }

    public void updateGood(Product product) {
        productMapper.updateGood(product);
    }
}
