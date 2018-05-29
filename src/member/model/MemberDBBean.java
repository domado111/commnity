package member.model;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;

public class MemberDBBean extends MybatisConnector {
	private final String namespace = "ldg.mybatis.member";
	private static MemberDBBean instance = new MemberDBBean();
	SqlSession sqlSession;

	private MemberDBBean() {
	}

	public static MemberDBBean getInstance() {
		return instance;
	}

	public void insertMember(MemberDataBean member) {
		sqlSession = sqlSession();
		sqlSession.insert(namespace + ".insertMember", member);
		sqlSession.commit();
		sqlSession.close();
	}

	public int deleteMember(String email) {
		sqlSession = sqlSession();
		int chk = sqlSession.delete(namespace + ".deleteMember", email);
		sqlSession.commit();
		sqlSession.close();

		return chk;
	}

	public void updateMember(MemberDataBean member) {
		sqlSession = sqlSession();
		sqlSession.update(namespace + ".updateMember", member);
		sqlSession.commit();
		sqlSession.close();
	}

	public ArrayList<MemberDataBean> getMemberList() {
		sqlSession = sqlSession();

		ArrayList members = (ArrayList) sqlSession.selectList(namespace + ".getMemberList");
		sqlSession.close();
		return members;
	}

	public MemberDataBean getMember(String email) {
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("email", email);

		MemberDataBean member = sqlSession.selectOne(namespace + ".getMember", map);
		sqlSession.close();

		return member;
	}

	public int loginCheck(String email, String password) {
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("email", email);
		map.put("password", password);
		int chk = sqlSession.selectOne(namespace + ".loginCheck", map);
		sqlSession.close();

		return chk;
	}
}
