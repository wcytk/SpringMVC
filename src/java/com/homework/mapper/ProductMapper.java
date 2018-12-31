package com.homework.mapper;

import com.homework.entity.Product;
import com.homework.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

    List<Product> performProduct();

    void insertProduct(Product product);

    void deleteByProductId(int productId);

    Product findByProductId(int productId);

    List<Product> findByProductName(String productName);

    boolean getGood(int id);

    void updateGood(Product product);
}
