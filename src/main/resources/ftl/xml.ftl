<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${serverPackage}.mapper.${objectName}Mapper">
    <resultMap id="ResultMap" type="${objectPackage}.vo.${objectName}VO">
        <#list columnList as columntemp>
            <#if columntemp.primaryKey == true>
                <id column="${columntemp.sqlColumn}" jdbcType="${columntemp.javaType}" property="${columntemp.columnname}" />
            <#else >
                <result column="${columntemp.sqlColumn}" jdbcType="${columntemp.javaType}" property="${columntemp.columnname}" />
            </#if>
        </#list>
    </resultMap>
    <select id="list" resultMap="ResultMap">
        select <#list columnList as columntemp><#if columntemp_has_next>${columntemp.sqlColumn},<#else >${columntemp.sqlColumn}</#if></#list>
        from ${tableName}
    </select>
    <select id="get" resultMap="ResultMap">
        select <#list columnList as columntemp><#if columntemp_has_next>${columntemp.sqlColumn},<#else >${columntemp.sqlColumn}</#if></#list>
        from ${tableName}
        where 1=1
        <#list columnList as columntemp>
            <#if columntemp.primaryKey == true>
                and ${columntemp.sqlColumn}=${"#"}{${columntemp.columnname}}<#break>
            <#else >
            </#if>
        </#list>

    </select>
    <delete id="delete" >
        delete from
        where <#list columnList as columntemp><#if columntemp.primaryKey == true>${columntemp.sqlColumn}=${"#"}{${columntemp.columnname}}<#break></#if></#list>
    </delete>
    <insert id="insert" >
        insert into ${tableName}
        <#list columnList as columntemp><#if columntemp_has_next>${columntemp.sqlColumn},<#else >${columntemp.sqlColumn}</#if></#list>
        values
        (<#list columnList as columntemp><#if columntemp_has_next>${"#"}{${columntemp.columnname}},<#else >${"#"}{${columntemp.columnname}}</#if></#list>)
    </insert>
    <insert id="insertBatch" >
        insert into ${tableName}
        <#list columnList as columntemp><#if columntemp_has_next>${columntemp.sqlColumn},<#else >${columntemp.sqlColumn}</#if></#list>
        values
        <foreach collection="list" separator="," item="item">
            (<#list columnList as columntemp><#if columntemp_has_next>${"#"}{item.${columntemp.columnname}},<#else >${"#"}{item.${columntemp.columnname}}</#if></#list>)
        </foreach>
    </insert>
    <update id="update">
        update ${tableName}
        <set>
            <#list columnList as columntemp>
                <#if columntemp.primaryKey == false>
                    <if test="${columntemp.columnname} != null">
                        columntemp.sqlColumn=${columntemp.sqlColumn},
                    </if>
                </#if>
            </#list>
        </set>
        where <#list columnList as columntemp><#if columntemp.primaryKey == true>${columntemp.sqlColumn}=${"#"}{${columntemp.columnname}}<#break></#if></#list>
    </update>
</mapper>