package cn.yd.carrentalsystem.po;

import cn.yd.carrentalsystem.utils.CommonUtils;

import java.util.Arrays;
import java.util.List;

public class CarCustom extends Car {
    private List<String> imgPaths;
    private Kind kind;

    public Kind getKind() {
        return kind;
    }

    public void setKind(Kind kind) {
        this.kind = kind;
    }

    public List<String> getImgPaths() {
        return imgPaths;
    }

    public void setImgPaths(List<String> imgPaths) {
        this.imgPaths = imgPaths;
    }

    public CarCustom() {
    }
    public CarCustom(Car car) {
        if(car.getImgs()!=null) {
            String[] imgPathsArr = car.getImgs().split(";");
            List<String> imgPaths = Arrays.asList(imgPathsArr);
            this.setImgPaths(imgPaths);
        }
        CommonUtils.BeantoBean(car, this);
    }
}
