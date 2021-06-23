package servlet;

import java.io.IOException;
import java.util.ArrayList;
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

		//FAQリストを表示
		CommonDao cDao = new CommonDao();
		List<Faq> faqList = cDao.FaqListFindAll();
		List<ArrayList<Faq>> pager = cDao.FaqTabChange();
		request.setAttribute("faqList", faqList);
		request.setAttribute("pager", pager);

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


		// 検索処理を行う
				CommonDao cDao = new CommonDao();
				List<Faq> faqCategory = cDao.FaqSearch(search_word);

		//ヒット件数を取得する
				int hitcount = cDao.FaqCount(search_word);

        //FAQリストを表示
				List<Faq> faqList = cDao.FaqListFindAll();


		// 検索結果とヒット件数をリクエストスコープに格納する
		        request.setAttribute("faqCategory", faqCategory);
		        request.setAttribute("hitcount", hitcount);
		        request.setAttribute("faqList", faqList);
		        request.setAttribute("search_word", search_word);

		// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_faqSearchResult.jsp");
				dispatcher.forward(request, response);
	}
}

