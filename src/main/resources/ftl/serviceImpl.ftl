package ${serverPackage}.service.impl;

import ${serverPackage}.vo.${objectName}VO;
import ${serverPackage}.service.${objectName}Service;
import ${serverPackage}.mapper.${objectName}Mapper;
import org.springframework.stereotype.Service;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
*
*
*
*@author ${author}
**/

@Service
public class ${objectName}ServiceImpl implements ${objectName}Service
{
    private static org.slf4j.Logger logger = LoggerFactory.getLogger(${objectName}ServiceImpl.class);

    @Autowired
    private ${objectName}Mapper ${objectName}mapper;

    public List<${objectName}VO> list()
    {
        return ${objectName}mapper.list();
    }

    public void insert(${objectName}VO vo)
    {
        ${objectName}mapper.insert(vo);
    }

    public void update(${objectName}VO vo){
        ${objectName}mapper.update(vo);
    }

    public void delete(String id)
    {
        ${objectName}mapper.delete(id);
    }

    public ${objectName}VO get(String id)
    {
        return ${objectName}mapper.get(id);
    }

    public void insertBatch(List<${objectName}VO> ${objectName?uncap_first}VOList)
    {
        ${objectName}mapper.insertBatch(${objectName?uncap_first}VOList);
    }
}