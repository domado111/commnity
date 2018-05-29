package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;
import member.model.MemberDBBean;
import member.model.MemberDataBean;

public class UserController extends Action {
	
	// 회원가입
	public String joinPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDataBean member = new MemberDataBean();
		MemberDBBean db = MemberDBBean.getInstance();

		// 회원가입 시 입력 된 정보값을 가져옵니다.
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");

		// DB에 정보를 저장합니다.
		member.setEmail(email);
		member.setName(name);
		member.setGender(gender);
		member.setPassword(password);
		db.insertMember(member);

		// 회원가입이 완료되면 로그인 상태로 보냅니다.
		HttpSession session = request.getSession();
		session.setAttribute("sessionID", email);
		session.setAttribute("sessionNAME", name);

		response.sendRedirect("../index");

		return null;
	}

	// 로그인
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDBBean db = MemberDBBean.getInstance();
		MemberDataBean member = new MemberDataBean();

		// 로그인 시 입력한 정보값을 가져옵니다.
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// loginCheck 메소드를 통해 로그인 여부를 확인합니다.
		int check = db.loginCheck(email, password);
		HttpSession session = request.getSession();

		// check 값이 1이면 세션값을 설정합니다.
		if (check == 1) {
			member = db.getMember(email);
			session.setAttribute("sessionID", member.getEmail());
			session.setAttribute("sessionNAME", member.getName());
			session.setAttribute("sessionGRADE", member.getGrade());
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}
		response.sendRedirect("../index");

		return null;
	}

	// 로그아웃
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();

		// HttpSession의 invalidate() 메소드를 사용해 세션값을 삭제합니다.
		session.invalidate();
		response.sendRedirect("../index");

		return null;
	}

	// 회원 탈퇴
	public String deletemember(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDBBean db = MemberDBBean.getInstance();
		String email = request.getParameter("email");
		int result = db.deleteMember(email);

		if (result == 1) {
			response.sendRedirect("index");
		} else if (result == 0) {
			System.out.println("삭제 실패");
		}

		return null;
	}

	// 회원 정보 수정
	public String updateinfo(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		MemberDBBean db = MemberDBBean.getInstance();
		MemberDataBean member = new MemberDataBean();

		member.setEmail(email);
		member.setName(name);
		member.setPassword(password);
		db.updateMember(member);

		response.sendRedirect("index");

		return null;
	}
}
