package cn.yd.carrentalsystem.po;

import java.io.Serializable;

public class User  implements Serializable {
    private Integer uid;

    private String phone;

    private String password;

    private String name;

    private String state;

    private String address;

    private String idcardnum;

    private String licenseiimg;

    private String idcardimgs;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getIdcardnum() {
        return idcardnum;
    }

    public void setIdcardnum(String idcardnum) {
        this.idcardnum = idcardnum == null ? null : idcardnum.trim();
    }

    public String getLicenseiimg() {
        return licenseiimg;
    }

    public void setLicenseiimg(String licenseiimg) {
        this.licenseiimg = licenseiimg == null ? null : licenseiimg.trim();
    }

    public String getIdcardimgs() {
        return idcardimgs;
    }

    public void setIdcardimgs(String idcardimgs) {
        this.idcardimgs = idcardimgs == null ? null : idcardimgs.trim();
    }
}