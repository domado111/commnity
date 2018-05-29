package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import member.model.MemberDBBean;
import member.model.MemberDataBean;

public class AdminController extends Action {
	public String manager(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDBBean db = MemberDBBean.getInstance();
		ArrayList<MemberDataBean> memberlist = db.getMemberList();

		request.setAttribute("memberlist", memberlist);

		return "/admin/view/memberlist.jsp";
	}
}
