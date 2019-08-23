package cn.yd.carrentalsystem.po;

import java.io.Serializable;

public class Kind implements Serializable {
    private Integer kid;

    private String kname;

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getKname() {
        return kname;
    }

    public void setKname(String kname) {
        this.kname = kname == null ? null : kname.trim();
    }
}