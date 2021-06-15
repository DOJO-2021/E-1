package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Common;
import model.Faq;

/**
 * Servlet implementation class TeacherFaqEdit
 */
@WebServlet("/TeacherFaqEdit")
public class TeacherFaqEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/studyQ/LoginServlet");
			return;
		}
		//登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faqSearch.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("/stugyQ/LoginServlet");
			return;
		}
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String search_word = request.getParameter("search_word");

		// 検索処理
		Common cmn = new Common();
		List<Faq> faqList = cmn.FaqSearch();

		//ヒット件数を取得
		int hitCount = cmn.FaqCount();

		//検索結果をリクエストスコープに格納
		request.setAttribute("faqList", faqList);
		request.setAttribute("hitCount", hitCount);

		//結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
		dispatcher.forward(request, response);
	}
}
