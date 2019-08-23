package cn.yd.carrentalsystem.po;

import java.io.Serializable;

public class QueryVo implements Serializable {
    private String startAddress;
    private String endAddress;
    private Integer kindIdChoosed;
    private String keyWord;
    private Integer maxPrice;

    @Override
    public String toString() {
        return "QueryVo{" +
                "startAddress='" + startAddress + '\'' +
                ", endAddress='" + endAddress + '\'' +
                ", kindIdChoosed=" + kindIdChoosed +
                ", keyWord='" + keyWord + '\'' +
                ", maxPrice=" + maxPrice +
                ", minPrice=" + minPrice +
                '}';
    }

    public QueryVo() {
    }

    public QueryVo(String startAddress, String endAddress, Integer kindIdChoosed, String keyWord, Integer maxPrice, Integer minPrice) {
        this.startAddress = startAddress;
        this.endAddress = endAddress;
        this.kindIdChoosed = kindIdChoosed;
        this.keyWord = keyWord;
        this.maxPrice = maxPrice;
        this.minPrice = minPrice;
    }

    public String getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress;
    }

    public String getEndAddress() {
        return endAddress;
    }

    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress;
    }

    public Integer getKindIdChoosed() {
        return kindIdChoosed;
    }

    public void setKindIdChoosed(Integer kindIdChoosed) {
        this.kindIdChoosed = kindIdChoosed;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    private Integer minPrice;
}
