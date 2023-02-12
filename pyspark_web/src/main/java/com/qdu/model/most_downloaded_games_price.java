package com.qdu.model;

public class most_downloaded_games_price {
    private String Name;
    private int Price;
    private int owners_clean;

    public most_downloaded_games_price() {
    }

    public most_downloaded_games_price(String name, int price, int owners_clean) {
        this.Name = name;
        this.Price = price;
        this.owners_clean = owners_clean;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        this.Price = price;
    }

    public int getOwners_clean() {
        return owners_clean;
    }

    public void setOwners_clean(int owners_clean) {
        this.owners_clean = owners_clean;
    }
}
