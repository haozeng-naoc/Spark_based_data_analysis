package com.qdu.model;

public class support {
    private String have_support_time;
    private String no_support_time;

    public support() {
    }

    public support(String have_support_time, String no_support_time) {
        this.have_support_time = have_support_time;
        this.no_support_time = no_support_time;
    }

    public String getHave_support_time() {
        return have_support_time;
    }

    public void setHave_support_time(String have_support_time) {
        this.have_support_time = have_support_time;
    }

    public String getNo_support_time() {
        return no_support_time;
    }

    public void setNo_support_time(String no_support_time) {
        this.no_support_time = no_support_time;
    }
}
