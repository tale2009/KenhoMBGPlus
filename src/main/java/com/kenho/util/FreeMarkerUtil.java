package com.kenho.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;


public class FreeMarkerUtil {
    private Configuration freeMarker;
    public FreeMarkerUtil() {
        freeMarker=new Configuration(Configuration.VERSION_2_3_0);
        freeMarker.setClassForTemplateLoading(this.getClass(),"/ftl");
    }

    private void output(Template currentTemplate,Map<String,Object> objectMap,String filePath,String fileName) throws IOException, TemplateException {
        File file = new File(filePath);
        if(!file.exists()) {
            file.mkdirs();
        }
        file = new File(filePath, fileName );
        if(!file.exists()) {
            file.createNewFile();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8));
        currentTemplate.process(objectMap,  out);
        out.close();
    }

    public void generateFile(String freeMarkName, Map<String,Object> objectMap,String filePath,String fileName) throws IOException, TemplateException {
        Template currentTemplate=freeMarker.getTemplate(freeMarkName);
        this.output(currentTemplate,objectMap,filePath,fileName);
    }
}

