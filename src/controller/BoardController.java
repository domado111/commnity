package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.sist.msk.Action;

import board.model.BoardDBBean;
import board.model.BoardDataBean;
import jsoup.MovieInfo;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

public class BoardController extends Action {
	
	// ��ȭ ���� ���
	public String reviewlist(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// boardid�� �Խ��� ��ȣ�Դϴ�.
		String boardid = request.getParameter("boardid");
		if (boardid == null)
			boardid = "1";
		// ������� �ִ� 5������ ǥ���մϴ�.
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// ���� ������
		int currentPage = Integer.parseInt(pageNum);
		// ���õ� ������������ ù��° �Խñ��� ����մϴ�.
		int startRow = (currentPage - 1) * pageSize + 1;
		// ���õ� ������������ ������ �Խñ��� ǥ���մϴ�.
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		// ������� ī��Ʈ�մϴ�.
		count = dbPro.getArticleCount(boardid);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, boardid);
		}
		number = count - (currentPage - 1) * pageSize;
		// 
		int bottomLine = 3;
		// ����� ���� ����������� �������� �� ������ ���� ����մϴ�.
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// ���� ������ ���� �������� ù ������ ��ȣ�� �����մϴ�.
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		// ���� ������ ���� �������� ������ ������ ��ȣ�� �����մϴ�.
		int endPage = startPage + bottomLine - 1;
		// ������ �������� �� ������ ������ ũ�ԵǸ� �� ������ ���� ������ �������� �����մϴ�.
		if (endPage > pageCount)
			endPage = pageCount;

		request.setAttribute("boardid", boardid);
		request.setAttribute("count", count);
		request.setAttribute("articleList", articleList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("endPage", endPage);
		request.setAttribute("number", number);

		// ���� API ��ȭ ������ ���õ� �����Դϴ�.
		String curPage = request.getParameter("curPage") == null ? "1" : request.getParameter("curPage");
		String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");
		String movieNm = request.getParameter("movieNm") == null ? "" : request.getParameter("movieNm");
		String directorNm = request.getParameter("directorNm") == null ? "" : request.getParameter("directorNm");
		String openStartDt = request.getParameter("openStartDt") == null ? "" : request.getParameter("openStartDt");
		String openEndDt = request.getParameter("openEndDt") == null ? "" : request.getParameter("openEndDt");
		String prdtStartYear = request.getParameter("prdtStartYear") == null ? "" : request.getParameter("prdtStartYear");
		String prdtEndYear = request.getParameter("prdtEndYear") == null ? "" : request.getParameter("prdtEndYear");
		String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
		String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr") == null ? null : request.getParameterValues("movieTypeCdArr");

		// ���� API�� ����ϱ� ���� Ű ��
		String key = "9f7b98d19ef5a71ec3a78cb5e0bdb38a";

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt,
				openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> result = mapper.readValue(movieCdResponse, HashMap.class);

		request.setAttribute("result", result);

		String nationCdResponse = service.getComCodeList(true, "2204");
		HashMap<String, Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
		request.setAttribute("nationCd", nationCd);

		return "/content/view/reviewlist.jsp";
	}

	// ��ȭ �˻�
	public String search(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String curPage = request.getParameter("curPage") == null ? "1" : request.getParameter("curPage");
		String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");
		String movieNm = request.getParameter("movieNm") == null ? "" : request.getParameter("movieNm");
		String directorNm = request.getParameter("directorNm") == null ? "" : request.getParameter("directorNm");
		String openStartDt = request.getParameter("openStartDt") == null ? "2000" : request.getParameter("openStartDt");
		String openEndDt = request.getParameter("openEndDt") == null ? "2018" : request.getParameter("openEndDt");
		String prdtStartYear = request.getParameter("prdtStartYear") == null ? "" : request.getParameter("prdtStartYear");
		String prdtEndYear = request.getParameter("prdtEndYear") == null ? "" : request.getParameter("prdtEndYear");
		String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
		String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr") == null ? null : request.getParameterValues("movieTypeCdArr");
		String key = "9f7b98d19ef5a71ec3a78cb5e0bdb38a";

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt,
				openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> result = mapper.readValue(movieCdResponse, HashMap.class);

		request.setAttribute("result", result);

		String nationCdResponse = service.getComCodeList(true, "2204");
		HashMap<String, Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
		request.setAttribute("nationCd", nationCd);

		String movieTypeCdResponse = service.getComCodeList(true, "2201");
		HashMap<String, Object> movieTypeCd = mapper.readValue(movieTypeCdResponse, HashMap.class);
		request.setAttribute("movieTypeCd", movieTypeCd);

		MovieInfo info = new MovieInfo();

		request.setAttribute("info", info);

		return "/content/view/search.jsp";
	}

	public String movieinfo(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movieNm = request.getParameter("movieNm");

		MovieInfo info = new MovieInfo();
		String poster = info.poster(movieNm);
		String story = info.story(movieNm);

		request.setAttribute("poster", poster);
		request.setAttribute("story", story);

		return "/content/view/movieinfo.jsp";
	}

	// ��ȭ ���
	public String movielist(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movieNm = request.getParameter("movieNm") == null ? "" : request.getParameter("movieNm");
		// ���� API�� ����ϱ� ���� Ű ��
		String key = "9f7b98d19ef5a71ec3a78cb5e0bdb38a";

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		// �˻��� ��ȭ �̸��� �������� �ִ� 30���� ǥ���մϴ�.
		String movieCdResponse = service.getMovieList(true, "1", "30", movieNm, "", "", "", "", "", "", null);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> result = mapper.readValue(movieCdResponse, HashMap.class);
		request.setAttribute("result", result);

		// ��ȭ�� �����͸� �����ɴϴ�(JSOUP)
		MovieInfo info = new MovieInfo();
		String poster = info.poster(movieNm);
		request.setAttribute("poster", poster);

		return "/content/view/movielist.jsp";
	}

	public String reviewdetail(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String boardid = request.getParameter("boardid");
		if (boardid == null)
			boardid = "1";

		int num = Integer.parseInt(request.getParameter("boardnum"));

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		try {
			BoardDBBean dbPro = BoardDBBean.getInstance();
			BoardDataBean article = dbPro.getArticle(num, boardid, "content");

			request.setAttribute("article", article);
			request.setAttribute("pageNum", pageNum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/content/view/reviewdetail.jsp";
	}

	public String writereview(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/content/view/writereview.jsp";
	}

	public String writereviewPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pageNum = request.getParameter("pageNum");
		String boardid = request.getParameter("boardid");

		if (pageNum == null || pageNum == "")
			pageNum = "1";

		BoardDataBean article = new BoardDataBean();

		if (request.getParameter("boardnum") != null && !request.getParameter("boardnum").equals("")) {
			article.setBoardnum(Integer.parseInt(request.getParameter("boardnum")));

		}
		article.setWriter(request.getParameter("writer"));
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setBoardid(request.getParameter("boardid"));
		article.setMovieNm(request.getParameter("movieNm"));
		article.setMoviescore(Integer.parseInt(request.getParameter("moviescore")));

		System.out.println(article);
		BoardDBBean dbPro = BoardDBBean.getInstance();
		dbPro.insertArticle(article);
		request.setAttribute("pageNum", pageNum);
		response.sendRedirect(
				request.getContextPath() + "/review/reviewlist?pageNum=" + pageNum + "&boardid=" + boardid);
		return null;
	}

	public String deletereview(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String boardid = request.getParameter("boarid");
		if (boardid == null)
			boardid = "1";
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		BoardDBBean dbPro = BoardDBBean.getInstance();
		int check = dbPro.deleteArticle(boardnum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);

		return "/content/view/deletePro.jsp";
	}

	public String updatereview(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String boardid = request.getParameter("boardid");
		if (boardid == null)
			boardid = "1";
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}

		int num = Integer.parseInt(request.getParameter("boardnum"));

		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num, boardid, "update");
		request.setAttribute("article", article);

		return "/content/view/updatereview.jsp";
	}

	public String updatereviewPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String boardid = request.getParameter("boarid");
		if (boardid == null)
			boardid = "1";
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		BoardDataBean article = new BoardDataBean();
		if (request.getParameter("boardnum") != null && !request.getParameter("boardnum").equals("")) {
			article.setBoardnum(Integer.parseInt(request.getParameter("boardnum")));
		}
		article.setWriter(request.getParameter("writer"));
		article.setEmail(request.getParameter("email"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setBoardid(request.getParameter("boardid"));
		article.setMoviescore(Integer.parseInt(request.getParameter("moviescore")));
		System.out.println(article);
		BoardDBBean dbPro = BoardDBBean.getInstance();
		int chk = dbPro.updateArticle(article);
		request.setAttribute("chk", chk);
		request.setAttribute("pageNum", pageNum);

		return "/content/view/updatePro.jsp";
	}
}
