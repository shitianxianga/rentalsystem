package cn.yd.carrentalsystem.po;

import java.io.Serializable;
import java.math.BigDecimal;

public class Car implements Serializable {
    private Integer cid;

    private String cname;

    private Integer kid;

    private String imgs;

    private String cdesc;

    private BigDecimal price;

    private String licensenumber;

    private Integer sitnumber;

    private Float displacement;

    private Integer navigator;

    private String tankcapacity;

    private Integer automatic;

    private Integer skylight;

    private Float deposit;

    private String state;

    private String startaddress;

    private String endaddress;

    private Integer ishot;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs == null ? null : imgs.trim();
    }

    public String getCdesc() {
        return cdesc;
    }

    public void setCdesc(String cdesc) {
        this.cdesc = cdesc == null ? null : cdesc.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getLicensenumber() {
        return licensenumber;
    }

    public void setLicensenumber(String licensenumber) {
        this.licensenumber = licensenumber == null ? null : licensenumber.trim();
    }

    public Integer getSitnumber() {
        return sitnumber;
    }

    public void setSitnumber(Integer sitnumber) {
        this.sitnumber = sitnumber;
    }

    public Float getDisplacement() {
        return displacement;
    }

    public void setDisplacement(Float displacement) {
        this.displacement = displacement;
    }

    public Integer getNavigator() {
        return navigator;
    }

    public void setNavigator(Integer navigator) {
        this.navigator = navigator;
    }

    public String getTankcapacity() {
        return tankcapacity;
    }

    public void setTankcapacity(String tankcapacity) {
        this.tankcapacity = tankcapacity == null ? null : tankcapacity.trim();
    }

    public Integer getAutomatic() {
        return automatic;
    }

    public void setAutomatic(Integer automatic) {
        this.automatic = automatic;
    }

    public Integer getSkylight() {
        return skylight;
    }

    public void setSkylight(Integer skylight) {
        this.skylight = skylight;
    }

    public Float getDeposit() {
        return deposit;
    }

    public void setDeposit(Float deposit) {
        this.deposit = deposit;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getStartaddress() {
        return startaddress;
    }

    public void setStartaddress(String startaddress) {
        this.startaddress = startaddress == null ? null : startaddress.trim();
    }

    public String getEndaddress() {
        return endaddress;
    }

    public void setEndaddress(String endaddress) {
        this.endaddress = endaddress == null ? null : endaddress.trim();
    }

    public Integer getIshot() {
        return ishot;
    }

    public void setIshot(Integer ishot) {
        this.ishot = ishot;
    }
}