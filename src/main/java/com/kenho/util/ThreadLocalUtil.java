package com.kenho.util;

import java.util.HashMap;
import java.util.Map;

public class ThreadLocalUtil {
    /**
     * 创建一个存放线程数据的map,用于整个开发过程中随时能拿得到
     */
    public static ThreadLocal<Map<String,Object>> threadMap=new ThreadLocal();

    public static void set(String key,Object object)
    {
        Map<String, Object> map = threadMap.get();
        if(map==null)
        {
            map=new HashMap<>();
            map.put(key,object);
            threadMap.set(map);
        }
        map.put(key,object);
    }

    public static Object get(String key)
    {
        Map<String, Object> map = threadMap.get();
        if(map==null)
        {
            return null;
        }
        return map.get(key);
    }

}
