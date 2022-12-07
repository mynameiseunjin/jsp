package co.micol.prj;

import co.micol.prj.common.Command;

public class MainCommand implements Command {

	@Override
	public String exec(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) {
		//	//첫 페이지 보여주는 곳 
		return "main/main.tiles";
	}
}
