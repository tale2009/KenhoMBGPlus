package com.kenho.util;


import com.kenho.object.ColumnObject;
import com.kenho.object.TableRelateDetail;
import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.config.JDBCConnectionConfiguration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Properties;

public class CommonUtil {
    public static void rebuildJDBCConfig(TableRelateDetail tableRelateDetail, JDBCConnectionConfiguration jdbcConnectionConfiguration) throws ClassNotFoundException, SQLException {
        if(tableRelateDetail.getDatabaseType()==1)
        {
            jdbcConnectionConfiguration.setConnectionURL("jdbc:mysql://" + tableRelateDetail.getDatabaseurl() + "?characterEncoding=utf8&useSSL=false");
            jdbcConnectionConfiguration.setDriverClass("com.mysql.jdbc.Driver");
        }
        else
        {
            //暂时只支持使用jdbc:oracle:thin:@//<host>:<port>/<service_name>
            jdbcConnectionConfiguration.setConnectionURL("jdbc:oracle:thin:@//"+tableRelateDetail.getDatabaseurl());
            jdbcConnectionConfiguration.setDriverClass("oracle.jdbc.driver.OracleDriver");
            //让oracle字段带上注释
            jdbcConnectionConfiguration.addProperty("remarksReporting","true");
        }
    }

    public static String upperCaseObjectName(String name)
    {
        return name.substring(0, 1).toUpperCase()+
                name.substring(1,name.length());
    }

    public static void buildColumnList(List<ColumnObject> columnObjectList, List<IntrospectedColumn> columnList, Boolean isPriMaryKey)
    {
        for(IntrospectedColumn temp:columnList)
        {
            ColumnObject columnObject=new ColumnObject();
            columnObject.setColumnname(temp.getJavaProperty());
            columnObject.setColumnCNname(temp.getRemarks());
            columnObject.setNullable(temp.isNullable());
            columnObject.setLength(temp.getLength());
            columnObject.setColumnType(gettype(temp.getJdbcType()));
            columnObject.setPrimaryKey(isPriMaryKey);
            columnObject.setJavaType(temp.getJdbcTypeName());
            columnObject.setSqlColumn(temp.getActualColumnName());
            columnObjectList.add(columnObject);
        }
    }

    public static Integer gettype(Integer jdbcType)
    {
        if(jdbcType == Types.CHAR || jdbcType == Types.CLOB
                || jdbcType == Types.LONGVARCHAR || jdbcType == Types.VARCHAR
                || jdbcType == Types.LONGNVARCHAR || jdbcType == Types.NCHAR
                || jdbcType == Types.NCLOB || jdbcType == Types.NVARCHAR
                || jdbcType == Types.BLOB )
            return 1;
        if(jdbcType == Types.DATE || jdbcType == Types.TIME
                || jdbcType == Types.TIMESTAMP)
            return 2;
        if(jdbcType == Types.FLOAT || jdbcType == Types.DECIMAL
                || jdbcType == Types.DOUBLE || jdbcType == Types.REAL)
            return 3;
        if(jdbcType == Types.INTEGER || jdbcType == Types.SMALLINT
                || jdbcType == Types.BIGINT || jdbcType == Types.TINYINT)
            return 4;
        if(jdbcType == Types.BOOLEAN )
            return 5;
        else
            return null;
    }
}
