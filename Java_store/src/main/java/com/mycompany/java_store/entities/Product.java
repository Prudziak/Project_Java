package com.mycompany.java_store.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int prodId;
    private String prodName;
    @Column(length = 1500)
    private String prodDesc;
    private String prodImage;
    private int prodPrice;
    private int prodQuantity;
    
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(String prodName, String prodDesc, String prodImage, int prodPrice, int prodQuantity, Category category) {
        this.prodName = prodName;
        this.prodDesc = prodDesc;
        this.prodImage = prodImage;
        this.prodPrice = prodPrice;
        this.prodQuantity = prodQuantity;
        this.category = category;
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdDesc() {
        return prodDesc;
    }

    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }

    public String getProdImage() {
        return prodImage;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }

    public float getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(int prodPrice) {
        this.prodPrice = prodPrice;
    }

    public int getProdQuantity() {
        return prodQuantity;
    }

    public void setProdQuantity(int prodQuantity) {
        this.prodQuantity = prodQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    

    @Override
    public String toString() {
        return "Product{" + "prodId=" + prodId + ", prodName=" + prodName + ", prodDesc=" + prodDesc + ", prodImage=" + prodImage + ", prodPrice=" + prodPrice + ", prodQuantity=" + prodQuantity + '}';
    }
    
    
}
