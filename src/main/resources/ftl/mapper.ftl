package ${serverPackage}.mapper;

import ${serverPackage}.vo.${objectName}VO;
import java.util.List;

/**
*${objectCNName}mapper
*@author ${author}
**/

public interface ${objectName}Mapper
{
    public List<${objectName}VO> list();

    public void insert(${objectName}VO vo);

    public void update(${objectName}VO vo);

    public void delete(String id);

    public ${objectName}VO get(String id);

    public void insertBatch(List<${objectName}VO> vo);
}