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
		// �̱��� �������� �����͸� �����մϴ�.
		BoardDBBean db = BoardDBBean.getInstance();
		MemberDBBean memberdb = MemberDBBean.getInstance();
		MemberDataBean member;
		
		// �ֽ� ��ȭ ���� 4���� �����ݴϴ�.
		List articlelist = db.getArticles(0, 4, "1");
		request.setAttribute("articlelist", articlelist);
		
		// ���ο� ���ǰ��� ������ �����ϴ�.
		HttpSession session = request.getSession();		
		String email = (String) session.getAttribute("sessionID");
		if (session.isNew()) {
			email = (String) session.getAttribute("sessionID");
		}
		member = memberdb.getMember(email);
		request.setAttribute("member", member);

		// �����ڷ� �α��� �� modal�� ȸ�� ����� �����ݴϴ�.
		ArrayList<MemberDataBean> memberlist = memberdb.getMemberList();
		request.setAttribute("memberlist", memberlist);

		// ���� ��¥�� ���ϱ� ���� �����Դϴ�.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		Calendar c = Calendar.getInstance();
		c.add(c.DATE, -1);
		String yesterday = sdf.format(c.getTime());

		// ���� API�� �������� ���� Ű���Դϴ�.
		String key = "9f7b98d19ef5a71ec3a78cb5e0bdb38a";

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		// ���������� �ְ��ڽ����ǽ� ���Դϴ�.
		String weeklyResponse = service.getWeeklyBoxOffice(true, yesterday, "5", "0", "", "", "");
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
		request.setAttribute("weeklyResult", weeklyResult);

		return "/index.jsp";
	}
}
