package ${serverPackage}.controller;

import ${serverPackage}.vo.${objectName}VO;
import ${serverPackage}.service.${objectName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.List;
/**
*${objectCNName}Controller
*@author ${author}
**/

@RestController
@RequestMapping("/${lowerObjectName}")
@Api("tags = ${objectCNName}")
public class ${objectName}Controller {
@Autowired
private ${objectName}Service ${objectName}Service;

    @PreAuthorize("hasAuthority('${upperObjectName}_FIND')")
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ApiOperation(value = "查询",notes = "列表查询")
    public List<${objectName}VO> list()
    {
        return ${objectName}Service.list();
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_insert')")
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增",notes = "新增")
    public void insert(@RequestBody ${objectName}VO vo)
    {
        ${objectName}Service.insert(vo);
    }


    @PreAuthorize("hasAuthority('${upperObjectName}_UPDATE')")
    @RequestMapping(value = "update", method = RequestMethod.PUT)
    @ApiOperation(value = "更新",notes = "更新")
    public void update(@RequestBody ${objectName}VO vo)
    {
        ${objectName}Service.update(vo);
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_GET')")
    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "查询",notes = "查询单个")
    public ${objectName}VO get(@PathVariable("id") String id)
    {
        return ${objectName}Service.get(id);
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_DELETE')")
    @RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
    @ApiOperation(value = "删除",notes = "删除")
    public void delete(@PathVariable("id") String id)
    {
        ${objectName}Service.delete(id);
    }
}
