package cn.yd.carrentalsystem.po;

import com.github.pagehelper.PageInfo;

import java.io.Serializable;
import java.util.List;

public class PageBean<T>  implements Serializable {
    private  PageInfo<T> pageInfo;
    private List<T> resultList;
    private String url;

    public PageInfo<T> getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo<T> pageInfo) {
        this.pageInfo = pageInfo;
    }

    public List<T> getResultList() {
        return resultList;
    }

    public void setResultList(List<T> resultList) {
        this.resultList = resultList;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
