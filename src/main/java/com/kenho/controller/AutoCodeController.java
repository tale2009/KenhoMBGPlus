package com.kenho.controller;

import org.mybatis.generator.api.ShellRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AutoCodeController {
    @RequestMapping(value = "/generate", method = RequestMethod.GET)
    public void generate()
    {
        String[] args=new String[3];
        args=new String[3];
        args[0]="-configfile";
        args[1]="/Users/kirra/Desktop/project/KenhoMBGPlus/KenhoMBGPlus/src/main/resources/MysqlConfig.xml";
        args[2]="-overwrite";
        ShellRunner.main(args);
    }
}
