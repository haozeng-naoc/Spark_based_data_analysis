package com.qdu.model;

public class Pos_neg {
    private String name;
    private int positive_count;
    private int negative_count;

    public Pos_neg() {
    }

    public Pos_neg(String name, int positive_count, int negative_count) {
        this.name = name;
        this.positive_count = positive_count;
        this.negative_count = negative_count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPositive_count() {
        return positive_count;
    }

    public void setPositive_count(int positive_count) {
        this.positive_count = positive_count;
    }

    public int getNegative_count() {
        return negative_count;
    }

    public void setNegative_count(int negative_count) {
        this.negative_count = negative_count;
    }
}
