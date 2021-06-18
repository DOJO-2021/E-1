package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TeacherFaqResult
 */
@WebServlet("/TeacherFaqResult")
public class TeacherFaqResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherFaqResult() {
        super();
        // TODO Auto-generated constructor stub
    }

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
//		int faq_id = Integer.parseInt(request.getParameter("faq_id"));
//		String faq_title = request.getParameter("faq_title");
//		String faq_ans = request.getParameter("faq_ans");
//		int faq_m_category = Integer.parseInt(request.getParameter("faq_m_category"));
//
//		//更新または削除
//		CommonDao cDao = new CommonDao();
//		if (request.getParameter("SUBMIT").equals("更新")) {
//			if (cDao.FaqUpdate(new Faq(faq_id, faq_title, faq_ans, faq_m_category))) {	// 更新成功
//				request.setAttribute("faq_id", faq_id);
//				request.setAttribute("faq_title", faq_title);
//				request.setAttribute("faq_ans", faq_ans);
//				request.setAttribute("faq_m_category", faq_m_category);

				//結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faqRegistResultjsp");
				dispatcher.forward(request, response);
//			}
//			else {												// 更新失敗
//				System.out.println("更新失敗しました。");
//			}
//		}
//		else {
//			if (cDao.FaqDelete(faq_id)) {	// 削除成功
//				request.setAttribute("");
//			}
//			else {						// 削除失敗
//				request.setAttribute();
//			}
//		}
//
//
    }
}

