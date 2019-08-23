package utils;

import org.apache.commons.beanutils.BeanMap;
import org.apache.commons.beanutils.BeanUtils;

import java.util.HashMap;
import java.util.Map;

public class CommonUtils {

    /**
     * 父类转子类，要求父类属性全为基本类型
     * date必须赋值
     * @param father
     * @param son
     */
    public static void BeantoBean(Object father,Object son){
        Map<String,Object> map = new HashMap<>();
        BeanMap beanMap = new BeanMap(father);
        for(Object obj:beanMap.keySet()){
            map.put((String) obj, beanMap.get(obj));
        }
        try {
            BeanUtils.populate(son, map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
