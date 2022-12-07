package co.micol.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.service.MemberVO;
import co.micol.prj.member.service.impl.MemberServiceImpl;

public class MemberJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 처리
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		int n = 0;

		// String viewPage = null; // n을 돌려줄 페이지 만든것.
		String message = null; // 메세지를 담을것임.

		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberName(request.getParameter("memberName"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		if(request.getParameter("memberAge") != "") {
			vo.setMemberAge(Integer.valueOf(request.getParameter("memberAge")));
		}
		vo.setMemberAddress(request.getParameter("memberAddress"));
		vo.setMemberTel(request.getParameter("memberTel"));
		vo.setMemberAuthor("USER");
		// mapper에서 요구하는 갯수 만큼 vo가 있어야한다.

		n = dao.memberInsert(vo); // vo객체를 보낸다.
		if (n != 0) {
			 message = "회원가입이 성공적으로 처리되었습니다.";
			//return "memberList.do";// 성공했을 시 바로 목록이 보여지도록 하는것
		} else {
			message = "회원가입 실패";
		}
		request.setAttribute("message", message);
		return "member/memberJoin"; // member폴더에 memberjoin을 만들어줌(jsp파일로)
	}

}
