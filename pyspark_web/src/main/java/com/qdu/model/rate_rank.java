package com.qdu.model;

public class rate_rank {
    private String name;
    private int rate;

    public rate_rank() {
    }

    public rate_rank(String name, int rate) {
        this.name = name;
        this.rate = rate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
}
