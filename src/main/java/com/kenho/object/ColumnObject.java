package com.kenho.object;

public class ColumnObject {
    /**
     * 列名
     */
    private String columnname;
    /**
     * 列名
     */
    private String columnCNname;
    /**
     * 是否可空
     */
    private Boolean nullable;
    /**
     * 列类型
     */
    private Integer columnType;
    /**
     * 长度
     */
    private Integer length;
    /**
     * 是否主键
     */
    private Boolean isPrimaryKey;
    /**
     * java类型
     */
    private String javaType;
    /**
     * sql列
     */
    private String SqlColumn;

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public String getColumnCNname() {
        return columnCNname;
    }

    public void setColumnCNname(String columnCNname) {
        this.columnCNname = columnCNname;
    }

    public Boolean getNullable() {
        return nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }

    public Integer getColumnType() {
        return columnType;
    }

    public void setColumnType(Integer columnType) {
        this.columnType = columnType;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Boolean getPrimaryKey() {
        return isPrimaryKey;
    }

    public void setPrimaryKey(Boolean primaryKey) {
        isPrimaryKey = primaryKey;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getSqlColumn() {
        return SqlColumn;
    }

    public void setSqlColumn(String sqlColumn) {
        SqlColumn = sqlColumn;
    }
}
