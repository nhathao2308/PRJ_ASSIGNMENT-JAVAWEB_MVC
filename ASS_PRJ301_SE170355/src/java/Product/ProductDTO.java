/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;
public class ProductDTO {
    private String productID;
    private String productName;
    private String price;
    private String image;
    private int quantity;
    
    
    ProductDTO() {
    }
    
    public ProductDTO(String productID, String productName, String price, String image) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
    }

    public ProductDTO(String productID, String productName, String price, String image, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
}
