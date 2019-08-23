package cn.yd.carrentalsystem.po;

import java.io.Serializable;

public class LeaseQueryVo implements Serializable {
    private Lease lease;

    public Lease getLease() {
        return lease;
    }

    public void setLease(Lease lease) {
        this.lease = lease;
    }

    private Car car;

    public Car getCar() {
        return car;
    }

    public void setCar(Car car)
    {
        this.car = car;
    }
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    private String carfirstimg;

    public String getCarfirstimg() {
        return carfirstimg;
    }

    public void setCarfirstimg(String carfirstimg) {
        this.carfirstimg = carfirstimg;
    }
}
