package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommonDao;
import model.StuIdpw;
import util.Hash;

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

		StuIdpw student = new StuIdpw(0, s_id, s_pw ,s_l_name, s_f_name);
		HttpSession session = request.getSession();
		session.setAttribute("Student", student);

		Hash idHash = new Hash();
		Hash pwHash = new Hash();

		String hashId = idHash.getHash(s_id);
		String hashPw = pwHash.getHash(s_pw);

		StuIdpw hashstudent =  new StuIdpw(0, hashId, hashPw, s_l_name, s_f_name);
	//登録処理
		CommonDao cDao = new CommonDao();
		if(cDao.isStudentRegistOK(hashstudent)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_registResult.jsp");
			dispatcher.forward(request, response);
		}else {
			System.out.println("登録失敗！");
		}
	}

}






















