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
import model.Faq;



/**
 * Servlet implementation class TeacherFaqRegist
 */
@WebServlet("/TeacherFaqRegist")
public class TeacherFaqRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
	/*
    public TeacherFaqRegist() {
        super();
        // TODO Auto-generated constructor stub
    }
    */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("t_id") == null) {
			response.sendRedirect("/studyQ/StudentLogin");
			return;
		}
		//登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faqRegist.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	// もしもログインしていなかったらログインサーブレットにリダイレクトする
			HttpSession session = request.getSession();
			if (session.getAttribute("t_id") == null) {
				response.sendRedirect("/stugyQ/StudentLogin");
				return;
			}

			//リクエストパラメータを取得する
			request.setCharacterEncoding("UTF-8");
			String faq_title = request.getParameter("faq_title");
			String faq_ans = request.getParameter("faq_ans");
			int faq_m_category = Integer.parseInt(request.getParameter("faq_m_category"));


			//登録処理
			CommonDao cmn = new CommonDao();
			cmn.FaqRegist(new Faq(0, faq_title, faq_ans, faq_m_category));

			//リクエストスコープに値をセット
			request.setAttribute("obj1", faq_title);
			request.setAttribute("obj2", faq_m_category);
			request.setAttribute("obj3", faq_ans);

			// 「講師|FAQ登録結果画面」にフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faqRegistResult.jsp");
			dispatcher.forward(request, response);
	}
}