package com.homework.entity;

public class Product {
    private int productId;
    private String productName;
    private String statement;
    private double productPrice;
    private String image;

    public Product() {
    }

    public Product( String productName, String statement, double productPrice, String image) {
        this.productName = productName;
        this.statement = statement;
        this.productPrice = productPrice;
        this.image = image;
    }
    public Product(int productId, String productName, String statement, double productPrice, String image) {
        this.productId = productId;
        this.productName = productName;
        this.statement = statement;
        this.productPrice = productPrice;
        this.image = image;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getStatement() {
        return statement;
    }

    public void setStatement(String statement) {
        this.statement = statement;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
