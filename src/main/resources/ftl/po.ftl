package ${objectPackage}.po;

import java.io.Serializable;
import javax.validation.constraints.NotNull;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
<#list columnList as column>
    <#if column.columnType == 3>
import java.math.BigDecimal;<#break>
    </#if>
</#list>

<#list columnList as column>
    <#if column.columnType == 2>
import java.util.Date;<#break>
    </#if>
</#list>

@ApiModel("${objectCNName}")
public class ${objectName}PO implements Serializable
{
    <#list columnList as column>
    @ApiModelProperty("${column.columnCNname}")
    <#if column.nullable == false>@NotNull(message="${column.columnCNname}不能为空")</#if>
    private <#if column.columnType == 1>String</#if><#if column.columnType == 2>Date</#if><#if column.columnType == 3>BigDecimal</#if><#if column.columnType == 4>Integer</#if><#if column.columnType == 5>Boolean</#if> ${column.columnname};
    </#list>

    <#list columnList as column>
    public <#if column.columnType == 1>String</#if><#if column.columnType == 2>Date</#if><#if column.columnType == 3>BigDecimal</#if><#if column.columnType == 4>Integer</#if><#if column.columnType == 5>Boolean</#if> get${column.columnname?cap_first}()
    {
        return this.${column.columnname};
    }

    public void set${column.columnname?cap_first}(<#if column.columnType == 1>String</#if><#if column.columnType == 2>Date</#if><#if column.columnType == 3>BigDecimal</#if><#if column.columnType == 4>Integer</#if><#if column.columnType == 5>Boolean</#if> ${column.columnname})
    {
    this.${column.columnname}=${column.columnname};
    }

    </#list>
}
