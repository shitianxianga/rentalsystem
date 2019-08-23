package cn.yd.carrentalsystem.po;

import java.io.Serializable;
import java.util.List;

public class CarQueryVo implements Serializable {
	
	private CarCustom carCustom;

	public CarCustom getCarCustom() {
		return carCustom;
	}

	public void setCarCustom(CarCustom carCustom) {
		this.carCustom = carCustom;
	}

	//接收批量商品修改信息
	private List<Car> carList;
	private String firstImg;

	public String getFirstImg() {
		return firstImg;
	}

	public void setFirstImg(String firstImg) {
		this.firstImg = firstImg;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}
	
}
