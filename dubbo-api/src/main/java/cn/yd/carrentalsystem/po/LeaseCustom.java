package cn.yd.carrentalsystem.po;

public class LeaseCustom extends Lease {
    private CarCustom carCustom;

    public CarCustom getCarCustom() {
        return carCustom;
    }

    public void setCarCustom(CarCustom carCustom) {
        this.carCustom = carCustom;
    }
}
