package com.qdu.model;

public class top_dlc_developers {
    private String Developers;
    private String sum_DLC_count;

    public top_dlc_developers() {
    }

    public top_dlc_developers(String developers, String sum_DLC_count) {
        this.Developers = developers;
        this.sum_DLC_count = sum_DLC_count;
    }

    public String getDevelopers() {
        return Developers;
    }

    public void setDevelopers(String developers) {
        this.Developers = developers;
    }

    public String getSum_DLC_count() {
        return sum_DLC_count;
    }

    public void setSum_DLC_count(String sum_DLC_count) {
        this.sum_DLC_count = sum_DLC_count;
    }
}
