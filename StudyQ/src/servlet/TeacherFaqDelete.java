package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommonDao;
import model.Faq;
import model.Result;

/**
 * Servlet implementation class TeacherFaqDelete
 */
@WebServlet("/TeacherFaqEdit")
public class TeacherFaqDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
/*		HttpSession session = request.getSession();
		if (session.getAttribute("t_id") == null) {
		response.sendRedirect("/StugyQ/StudentLogin");
		return;
		} */
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		int faq_id = Integer.parseInt(request.getParameter("faq_id"));
		String faq_title = request.getParameter("faq_title");
		String faq_ans = request.getParameter("faq_ans");

		//更新または削除を行う
		CommonDao cDao = new CommonDao();
		if (request.getParameter("SUBMIT").equals("更新")) {
			if (cDao.FaqUpdate(new Faq(faq_id, faq_title, faq_ans))) {	// 更新成功
				request.setAttribute("result",
				new Result("FAQ項目編集", "以下の内容を更新しました。", "/StudyQ/"));
			}
			else {												// 更新失敗
				request.setAttribute("result",
				new Result("FAQ項目編集", "レコードを更新できませんでした。", "/simpleBC/MenuServlet"));
			}
		}
		else {
			if (cDao.FaqDelete(faq_id)) {	// 削除成功
				request.setAttribute("result",
				new Result("FAQ項目編集", "以下の内容を削除しました。", "/StudyQ/"));
			}
			else {						// 削除失敗
				request.setAttribute("result",
				new Result("FAQ項目編集", "レコードを削除できませんでした。", "/simpleBC/MenuServlet"));
			}
		}


		//結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_faq.jsp");
		dispatcher.forward(request, response);
	}
}
