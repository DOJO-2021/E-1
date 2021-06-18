package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommonDao;
import model.SessionBeans;

/**
 * Servlet implementation class TeacherReserveList
 */
@WebServlet("/TeacherReserveList")
public class TeacherReserveList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
//		HttpSession session = request.getSession();
//		if (session.getAttribute("t_id") == null) {
//			response.sendRedirect("/StudyQ/StudentLogin");
//			return;
//		}

		// リクエストパラメータを取得する（beansが完成したら）
//		request.setCharacterEncoding("UTF-8");
//		String session_id = request.getParameter("session_id");
//		String s_name = request.getParameter("s_name");
//		String subject = request.getParameter("subject");
//		String question = request.getParameter("question");
//		String file = request.getParameter("file");
//		String state = request.getParameter("state");
//		String session_m_category = request.getParameter("session_m_category");

		//一覧を表示処理
		CommonDao cDao = new CommonDao();
		List<SessionBeans> sessionList = cDao.SessionListFindAll();

		// リクエストスコープに格納する
		request.setAttribute("sessionList", sessionList);

		// セッション予約リストページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_rsvList.jsp");
		dispatcher.forward(request, response);


	}
}





