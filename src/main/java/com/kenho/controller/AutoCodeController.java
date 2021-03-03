package com.kenho.controller;

import com.kenho.object.TableRelateDetail;
import com.kenho.util.ThreadLocalUtil;
import org.mybatis.generator.api.ShellRunner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AutoCodeController {
    @ResponseBody
    @RequestMapping(value = "/generate", method = RequestMethod.GET)
    public void generate(TableRelateDetail tableRelateDetail)
    {
        ThreadLocalUtil.set("tableinfo",tableRelateDetail);
        String[] args=new String[3];
        args=new String[3];
        args[0]="-configfile";
        args[1]="/Users/kirra/Desktop/project/KenhoMBGPlus/KenhoMBGPlus/src/main/resources/MysqlConfig.xml";
        args[2]="-overwrite";
        ShellRunner.main(args);
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index()
    {
        return "index";
    }
}