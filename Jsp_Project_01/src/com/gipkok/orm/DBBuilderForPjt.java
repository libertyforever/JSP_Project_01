package com.gipkok.orm;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBBuilderForPjt {
	private static Logger logger = LoggerFactory.getLogger(DBBuilderForPjt.class);
	
	private static SqlSessionFactory factory_pjt;
	
	static {
		try {
			factory_pjt = new SqlSessionFactoryBuilder().build(Resources
					.getResourceAsReader("com/gipkok/orm/MybatisConfig.xml"));
			logger.info("Session >> Success");
		} catch (IOException e) {
			logger.info("Session >> fail");
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory_pjt;
	}
}
