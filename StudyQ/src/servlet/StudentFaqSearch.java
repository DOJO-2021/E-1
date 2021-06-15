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

import model.Faq;

/**
 * Servlet implementation class StudentFaqSearch
 */
@WebServlet("/StudentFaqSearch")
public class StudentFaqSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}

		// 検索ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_faqSearch.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}

		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String search_word = request.getParameter("search_word");
		/*String message = request.getParameter("message");*/


		// 検索処理を行う
				CommonDao cDao = new CommonDao();
				List<Faq> faqList = cDao.FaqSearch();
		//ヒット件数を取得する
				int hitcount = cDao.FaqCount();

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("faqList", faqList);
				request.setAttribute("hitcount", hitcount);

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/search_result.jsp");
				dispatcher.forward(request, response);
			}
		}

