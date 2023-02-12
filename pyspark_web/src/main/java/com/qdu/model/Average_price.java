package com.qdu.model;

public class Average_price {
    private Double Win_price;
    private Double Mac_price;
    private Double Linux_price;

    public Average_price() {
    }

    public Average_price(Double win_price, Double mac_price, Double linux_price) {
        this.Win_price = win_price;
        this.Mac_price = mac_price;
        this.Linux_price = linux_price;
    }

    public Double getWin_price() {
        return Win_price;
    }

    public void setWin_price(Double win_price) {
        this.Win_price = win_price;
    }

    public Double getMac_price() {
        return Mac_price;
    }

    public void setMac_price(Double mac_price) {
        this.Mac_price = mac_price;
    }

    public Double getLinux_price() {
        return Linux_price;
    }

    public void setLinux_price(Double linux_price) {
        this.Linux_price = linux_price;
    }
}
