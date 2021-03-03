package ${serverPackage}.service;

import ${serverPackage}.vo.${objectName}VO;
import java.util.List;

/**
*
*
*
*@author ${author}
**/

public interface ${objectName}Service
{
    public List<${objectName}VO> list();

    public void insert(${objectName}VO vo);

    public void update(${objectName}VO vo);

    public void delete(String id);

    public ${objectName}VO get(String id);

    public void insertBatch(List<${objectName}VO> vo);
}