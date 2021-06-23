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

import dao.CommonDao;
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
		if (session.getAttribute("t_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}
		//検索ページにフォワードする
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
		if (session.getAttribute("t_id") == null) {
		response.sendRedirect("/StugyQ/StudentLogin");
		return;
		}
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		String search_word = request.getParameter("search_word");

		// 検索処理
		CommonDao cDao = new CommonDao();
		List<Faq> faqCategory = cDao.FaqSearch(search_word);

		//ヒット件数を取得
		int hitcount = cDao.FaqCount(search_word);

		//検索結果をリクエストスコープに格納
		request.setAttribute("faqCategory", faqCategory);
		request.setAttribute("hitcount", hitcount);
		request.setAttribute("search_word", search_word);
		//結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faqSearchResult.jsp");
		dispatcher.forward(request, response);
	}
}
