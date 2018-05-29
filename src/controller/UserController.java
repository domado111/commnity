package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;
import member.model.MemberDBBean;
import member.model.MemberDataBean;

public class UserController extends Action {
	
	// ȸ������
	public String joinPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDataBean member = new MemberDataBean();
		MemberDBBean db = MemberDBBean.getInstance();

		// ȸ������ �� �Է� �� �������� �����ɴϴ�.
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");

		// DB�� ������ �����մϴ�.
		member.setEmail(email);
		member.setName(name);
		member.setGender(gender);
		member.setPassword(password);
		db.insertMember(member);

		// ȸ�������� �Ϸ�Ǹ� �α��� ���·� �����ϴ�.
		HttpSession session = request.getSession();
		session.setAttribute("sessionID", email);
		session.setAttribute("sessionNAME", name);

		response.sendRedirect("../index");

		return null;
	}

	// �α���
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDBBean db = MemberDBBean.getInstance();
		MemberDataBean member = new MemberDataBean();

		// �α��� �� �Է��� �������� �����ɴϴ�.
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// loginCheck �޼ҵ带 ���� �α��� ���θ� Ȯ���մϴ�.
		int check = db.loginCheck(email, password);
		HttpSession session = request.getSession();

		// check ���� 1�̸� ���ǰ��� �����մϴ�.
		if (check == 1) {
			member = db.getMember(email);
			session.setAttribute("sessionID", member.getEmail());
			session.setAttribute("sessionNAME", member.getName());
			session.setAttribute("sessionGRADE", member.getGrade());
			System.out.println("�α��� ����");
		} else {
			System.out.println("�α��� ����");
		}
		response.sendRedirect("../index");

		return null;
	}

	// �α׾ƿ�
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();

		// HttpSession�� invalidate() �޼ҵ带 ����� ���ǰ��� �����մϴ�.
		session.invalidate();
		response.sendRedirect("../index");

		return null;
	}

	// ȸ�� Ż��
	public String deletemember(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDBBean db = MemberDBBean.getInstance();
		String email = request.getParameter("email");
		int result = db.deleteMember(email);

		if (result == 1) {
			response.sendRedirect("index");
		} else if (result == 0) {
			System.out.println("���� ����");
		}

		return null;
	}

	// ȸ�� ���� ����
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
