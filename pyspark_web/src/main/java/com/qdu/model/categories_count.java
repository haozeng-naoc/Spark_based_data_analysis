package com.qdu.model;

public class categories_count {
    private String catagory;
    private int Frequency;

    public categories_count() {
    }

    public categories_count(String catagory, int frequency) {
        this.catagory = catagory;
        this.Frequency = frequency;
    }

    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public int getFrequency() {
        return Frequency;
    }

    public void setFrequency(int frequency) {
        this.Frequency = frequency;
    }
}
