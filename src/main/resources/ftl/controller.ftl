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

import java.util.List;
/**
*
*
*
*@author ${author}
**/

@RestController
@RequestMapping("/${lowerObjectName}")
public class ${objectName}Controller {
@Autowired
private ${objectName}Service ${objectName}Service;

    @PreAuthorize("hasAuthority('${upperObjectName}_FIND')")
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<${objectName}VO> list()
    {
        return ${objectName}Service.list();
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_insert')")
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public void insert(@RequestBody ${objectName}VO vo)
    {
        ${objectName}Service.insert(vo);
    }


    @PreAuthorize("hasAuthority('${upperObjectName}_UPDATE')")
    @RequestMapping(value = "update", method = RequestMethod.PUT)
    public void update(@RequestBody ${objectName}VO vo)
    {
        ${objectName}Service.update(vo);
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_GET')")
    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    public ${objectName}VO get(@PathVariable("id") String id)
    {
        return ${objectName}Service.get(id);
    }

    @PreAuthorize("hasAuthority('${upperObjectName}_DELETE')")
    @RequestMapping(value = "delete/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") String id)
    {
        ${objectName}Service.delete(id);
    }
}
