/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author thuat
 */
public class Movie {

    private int id;
    private String title;
    private ArrayList<Genre> genre;
    private ArrayList<Actor> actor;
    private Date date;
    private String descript;
    private String img;
    private String src;
    private String trail;
    private int likecount;
    private double rate;
    private int status;
    private int statusrelease;

    public Movie() {
    }

    public Movie(int id, String title, ArrayList<Genre> genre, ArrayList<Actor> actor, Date date, String descript, String img, String src, String trail, int likecount, double rate, int status, int statusrelease) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.actor = actor;
        this.date = date;
        this.descript = descript;
        this.img = img;
        this.src = src;
        this.trail = trail;
        this.likecount = likecount;
        this.rate = rate;
        this.status = status;
        this.statusrelease = statusrelease;
    }

    public Movie(String title, ArrayList<Genre> genre, Date date, String descript, String img, String src, String trail, double rate, int status, int statusrelease) {
        this.title = title;
        this.genre = genre;
        this.date = date;
        this.descript = descript;
        this.img = img;
        this.src = src;
        this.trail = trail;
        this.rate = rate;
        this.status = status;
        this.statusrelease = statusrelease;
    }

    public ArrayList<Actor> getActor() {
        return actor;
    }

    public void setActor(ArrayList<Actor> actor) {
        this.actor = actor;
    }

    public ArrayList<Genre> getGenre() {
        return genre;
    }

    public void setGenre(ArrayList<Genre> genre) {
        this.genre = genre;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getTrail() {
        return trail;
    }

    public void setTrail(String trail) {
        this.trail = trail;
    }

    public int getLikecount() {
        return likecount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatusrelease() {
        return statusrelease;
    }

    public void setStatusrelease(int statusrelease) {
        this.statusrelease = statusrelease;
    }

    @Override
    public String toString() {
        return "Movie{" + "id=" + id + ", title=" + title + ", genre=" + genre + ", date=" + date + ", descript=" + descript + ", img=" + img + ", src=" + src + ", trail=" + trail + ", likecount=" + likecount + ", rate=" + rate + ", status=" + status + ", statusrelease=" + statusrelease + '}';
    }

}
