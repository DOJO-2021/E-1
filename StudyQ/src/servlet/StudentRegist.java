package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Common;
import model.StuIdpw;

/**
 * Servlet implementation class StudentRegist
 */
@WebServlet("/StudentRegist")
public class StudentRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_regist.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String s_l_name = request.getParameter("s_l_name");
		String s_f_name = request.getParameter("s_f_name");
		String s_id = request.getParameter("s_id");
		String s_pw = request.getParameter("s_pw");

	//登録処理
		Common cDao = new Common();
		if(cDao.isStudentRegistOK(new StuIdpw(0, s_l_name, s_f_name, s_id, s_pw))) {
			response.sendRedirect("/StudyQ/s_registResult.jsp");
		}else {
			System.out.println("登録失敗！");
		}
	}

}






















