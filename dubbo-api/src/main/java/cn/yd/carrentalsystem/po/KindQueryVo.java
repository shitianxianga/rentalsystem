package cn.yd.carrentalsystem.po;

import java.io.Serializable;
import java.util.List;

public class KindQueryVo implements Serializable {
	
	private KindCustom kindCustom;

	public KindCustom getKindCustom() {
		return kindCustom;
	}

	public void setKindCustom(KindCustom kindCustom) {
		this.kindCustom = kindCustom;
	}

	//接收批量商品修改信息
	private List<Kind> kindList;

	public List<Kind> getKindList() {
		return kindList;
	}

	public void setKindList(List<Kind> kindList) {
		this.kindList = kindList;
	}
	
}
