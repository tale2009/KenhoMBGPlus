package com.kenho.util;

import com.kenho.object.TableRelateDetail;
import org.mybatis.generator.config.*;

public class ConfigurationResetUtil {
    /**
     * 改变项可以通过在工具类进行拓展
     * @param config
     */
    public static void reset(Configuration config)
    {
        TableRelateDetail tableinfo = (TableRelateDetail) ThreadLocalUtil.get("tableinfo");
        JDBCConnectionConfiguration jdbcConnectionConfiguration = config.getContexts().get(0).getJdbcConnectionConfiguration();
        /**
         * 重新设置密码和账号
         */
        jdbcConnectionConfiguration.setPassword(tableinfo.getPassword());
        jdbcConnectionConfiguration.setUserId(tableinfo.getUsername());
        jdbcConnectionConfiguration.setConnectionURL("jdbc:mysql://" + tableinfo.getDatabaseurl() + "?characterEncoding=utf8&useSSL=false");
        jdbcConnectionConfiguration.setDriverClass("com.mysql.cj.jdbc.Driver");
        /**
         * 重新设置服务包名
         */
        SqlMapGeneratorConfiguration sqlMapGeneratorConfiguration = config.getContexts().get(0).getSqlMapGeneratorConfiguration();
        sqlMapGeneratorConfiguration.setTargetPackage(tableinfo.getServerPackage());
        /**
         * 重新设置对象包名
         */
        JavaModelGeneratorConfiguration javaModelGeneratorConfiguration = config.getContexts().get(0).getJavaModelGeneratorConfiguration();
        javaModelGeneratorConfiguration.setTargetPackage(tableinfo.getObjectPackage());
        /**
         * 设置表名
         */
        TableConfiguration tableConfiguration = config.getContexts().get(0).getTableConfigurations().get(0);
        tableConfiguration.setTableName(tableinfo.getTableName());
        tableConfiguration.setDomainObjectName(tableinfo.getObjectName());
    }

}
