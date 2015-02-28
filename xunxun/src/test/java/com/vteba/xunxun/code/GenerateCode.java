package com.vteba.xunxun.code;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.generator.GenMain;

import com.vteba.ext.codegen.CodeBuilder;
import com.vteba.ext.codegen.DB;
import com.vteba.ext.codegen.KeyType;
import com.vteba.ext.codegen.TempType;

public class GenerateCode {

	public static void main(String[] args) {
		Map<String, String> tableListMap = new HashMap<String, String>();
		tableListMap.put("user", "用户信息");
		
	    //项目绝对路径
		String rootPath = "C:\\Users\\Administrator\\git\\xunxun\\xunxun\\";
		CodeBuilder builder = new CodeBuilder(rootPath, TempType.MybatisSimple);
		builder.setConfigFilePath("src/main/resources/config.properties")
		.setSrcPath("src/main/java/")
		.schema("tiantian")
		//.className("AppInfo")// 可以不设
		.setDb(DB.MySQL)// 可以不使用，只要jdbc url是正确的
		.keyType(KeyType.String)
		//.tableDesc("应用配置信息")
		//.tableName("app_info")
		.setTableList(tableListMap)
		.module("com.vteba.xunxun.user")
		.setPojo(false)
		.setMongo(false)
		.setGenAction(false)
        .setGenDao(false)
        .setGenMapper(false)
        .setGenModel(false)
        .setGenService(false)
        .setMybatisShards(false)
        .setMybatisAction(true)
        .setJsonAction(true)
		.build();

		GenMain.main(rootPath);

	}

}
