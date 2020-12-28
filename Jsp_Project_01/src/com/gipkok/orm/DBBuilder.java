package com.gipkok.orm;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBBuilder {
	private static Logger logger = LoggerFactory.getLogger(DBBuilder.class);
	
	private static SqlSessionFactory factory;
	
	static {
		try {
			factory = new SqlSessionFactoryBuilder().build(Resources
					.getResourceAsReader("com/gipkok/orm/MybatisConfig.xml"));
			logger.info("Session >> Success");
		} catch (Exception e) {
			logger.info("Session >> fail");
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
