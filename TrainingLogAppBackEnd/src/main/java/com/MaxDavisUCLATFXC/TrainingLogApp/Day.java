package com.MaxDavisUCLATFXC.TrainingLogApp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Entity
public class Day {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String email;
//    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    private int doubleRun;
    private boolean fuel;
    private boolean stretch_roll;

    protected Day() {}

    public Day(String email, int doubleRun, boolean fuel, boolean stretch_roll) {
        this.email = email;
        this.date = new Date();
        this.doubleRun = doubleRun;
        this.fuel = fuel;
        this.stretch_roll = stretch_roll;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getDoubleRun() {
        return doubleRun;
    }

    public void setDoubleRun(int doubleRun) {
        this.doubleRun = doubleRun;
    }

    public boolean isFuel() {
        return fuel;
    }

    public void setFuel(boolean fuel) {
        this.fuel = fuel;
    }

    public boolean isStretch_roll() {
        return stretch_roll;
    }

    public void setStretch_roll(boolean stretch_roll) {
        this.stretch_roll = stretch_roll;
    }

    @Override
    public String toString() {
        return String.format("Day[email='%s', date='%tD',doubleRun='%d', fuel='%b', stretch_roll='%b']",email,date,doubleRun,fuel,stretch_roll);
    }
}
