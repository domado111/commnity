package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.sist.msk.Action;

import board.model.BoardDBBean;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import member.model.MemberDBBean;
import member.model.MemberDataBean;

public class IndexController extends Action {
	public String index(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 싱글톤 패턴으로 데이터를 공유합니다.
		BoardDBBean db = BoardDBBean.getInstance();
		MemberDBBean memberdb = MemberDBBean.getInstance();
		MemberDataBean member;
		
		// 최신 영화 리뷰 4개를 보여줍니다.
		List articlelist = db.getArticles(0, 4, "1");
		request.setAttribute("articlelist", articlelist);
		
		// 새로운 세션값이 들어오면 덮어씌웁니다.
		HttpSession session = request.getSession();		
		String email = (String) session.getAttribute("sessionID");
		if (session.isNew()) {
			email = (String) session.getAttribute("sessionID");
		}
		member = memberdb.getMember(email);
		request.setAttribute("member", member);

		// 관리자로 로그인 시 modal로 회원 목록을 보여줍니다.
		ArrayList<MemberDataBean> memberlist = memberdb.getMemberList();
		request.setAttribute("memberlist", memberlist);

		// 어제 날짜를 구하기 위한 로직입니다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		Calendar c = Calendar.getInstance();
		c.add(c.DATE, -1);
		String yesterday = sdf.format(c.getTime());

		// 오픈 API를 가져오기 위한 키값입니다.
		String key = "9f7b98d19ef5a71ec3a78cb5e0bdb38a";

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		// 어제까지의 주간박스오피스 값입니다.
		String weeklyResponse = service.getWeeklyBoxOffice(true, yesterday, "5", "0", "", "", "");
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
		request.setAttribute("weeklyResult", weeklyResult);

		return "/index.jsp";
	}
}
