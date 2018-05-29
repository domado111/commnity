package board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import mybatis.MybatisConnector;

public class BoardDBBean extends MybatisConnector {
	private final String namespace = "ldg.mybatis.board";
	private static BoardDBBean instance = new BoardDBBean();
	SqlSession sqlSession;

	private BoardDBBean() {
	}

	public static BoardDBBean getInstance() {
		return instance;
	}

	public List<BoardDataBean> selectBoard() {
		sqlSession = sqlSession();
		System.out.println("selectboard");

		try {
			return sqlSession.selectList(namespace + ".boardList");
		} finally {
			sqlSession.close();
		}
	}

	public List<BoardDataBean> selectBoard(int boardnum) {
		sqlSession = sqlSession();
		System.out.println("selectboard");
		Map map = new HashMap<>();
		map.put("boardnum", boardnum);
		try {
			return sqlSession.selectList(namespace + ".boardList");
		} finally {
			sqlSession.close();
		}
	}

	public List<BoardDataBean> selectBoard(String boardid) {
		sqlSession = sqlSession();
		System.out.println("selectboard");
		Map map = new HashMap<>();
		map.put("boardid", boardid);
		try {
			return sqlSession.selectList(namespace + ".boardList");
		} finally {
			sqlSession.close();
		}
	}

	public int getArticleCount(String boardid) {
		int x = 0;
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("boardid", boardid);
		System.out.println(map);
		x = sqlSession.selectOne(namespace + ".getArticleCount", map);
		sqlSession.close();

		return x;

	}

	public List getArticles(int startRow, int endRow, String boardid) {
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("boardid", boardid);

		List li = sqlSession.selectList(namespace + ".getArticles", map);
		sqlSession.close();

		return li;
	}

	public BoardDataBean getArticle(int boardnum, String boardid, String chk) {
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("boardnum", boardnum);
		map.put("boardid", boardid);
		if (chk.equals("content")) {
			sqlSession.update(namespace + ".addReadCount", map);
		}

		BoardDataBean article = sqlSession.selectOne(namespace + ".getArticle", map);
		sqlSession.commit();
		sqlSession.close();

		return article;
	}

	public int updateArticle(BoardDataBean article) {
		sqlSession = sqlSession();

		int chk = sqlSession.update(namespace + ".updateArticle", article);
		sqlSession.commit();
		sqlSession.close();
		return chk;
	}

	public int deleteArticle(int boardnum) throws Exception {
		sqlSession = sqlSession();

		Map map = new HashMap();
		map.put("boardnum", boardnum);
		
		int chk = sqlSession.delete(namespace + ".deleteArticle", map);
		sqlSession.commit();
		sqlSession.close();

		return chk;
	}

	public void insertArticle(BoardDataBean article) {
		sqlSession = sqlSession();
		int number = sqlSession.selectOne(namespace + ".getNextNumber", article);

		article.setBoardnum(number);

		sqlSession.insert(namespace + ".insertArticle", article);
		sqlSession.commit();
		sqlSession.close();
	}
}
