package com.qdu.model;

public class language_count {
    private String language;
    private int Frequency;

    public language_count() {
    }

    public language_count(String language, int frequency) {
        this.language = language;
        this.Frequency = frequency;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getFrequency() {
        return Frequency;
    }

    public void setFrequency(int frequency) {
        this.Frequency = frequency;
    }
}
