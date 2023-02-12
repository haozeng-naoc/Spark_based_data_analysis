package com.qdu.model;

public class top_publishers_total_downloads {
    private String Developers;
    private int sum_DLC_count;

    public top_publishers_total_downloads() {
    }

    public top_publishers_total_downloads(String developers, int sum_DLC_count) {
        this.Developers = developers;
        this.sum_DLC_count = sum_DLC_count;
    }

    public String getDevelopers() {
        return Developers;
    }

    public void setDevelopers(String developers) {
        this.Developers = developers;
    }

    public int getSum_DLC_count() {
        return sum_DLC_count;
    }

    public void setSum_DLC_count(int sum_DLC_count) {
        this.sum_DLC_count = sum_DLC_count;
    }
}
