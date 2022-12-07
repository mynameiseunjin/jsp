package co.micol.prj.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataSource { // 싱글톤 class : instance를 하나만 생성할 수 있는것.(초기화 하지 않고 불러쓸수있다)
	private static SqlSessionFactory sqlSessionFactory;

	private DataSource() {
	}; // 외부에서 나를 생성하지 못하도록 생성자를 private로 생성자만든다.

	public static SqlSessionFactory getInstance() { // 돌려줄 값
		String resource = "config/mybatis-config.xml"; // 마이바티스 설정파일
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
}
