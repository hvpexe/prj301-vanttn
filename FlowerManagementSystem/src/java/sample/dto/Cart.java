/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

/**
 *
 * @author PhuHV
 */
public class Cart {

    private int plantID;
    private String imgPath;
    private String plantName;
    private int price;
    private int quantity;

    public Cart() {
    }

    public Cart(int plantID, String imgPath, String plantName, int price, int quantity) {
        this.plantID = plantID;
        this.imgPath = imgPath;
        this.plantName = plantName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getPlantID() {
        return plantID;
    }

    public void setPlantID(int plantID) {
        this.plantID = plantID;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getPlantName() {
        return plantName;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
