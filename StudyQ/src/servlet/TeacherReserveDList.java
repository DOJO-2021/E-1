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
 * Servlet implementation class TeacherReserveDList
 */
@WebServlet("/TeacherReserveDList")
public class TeacherReserveDList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("t_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}

		//リクエストパラメータを取得する（beansが完成したら）
		request.setCharacterEncoding("UTF-8");
		String session_id = request.getParameter("session_id");
		String s_name = request.getParameter("s_name");
		String subject = request.getParameter("subject");
		String question = request.getParameter("question");
		String file = request.getParameter("file");
		String session_m_category = request.getParameter("session_m_category");


		//リクエストスコープに値をセット
		request.setAttribute("session_id", session_id);
		request.setAttribute("s_name", s_name);
		request.setAttribute("subject", subject);
		request.setAttribute("question", question);
		request.setAttribute("file", file);
		request.setAttribute("session_m_category", session_m_category);


		//セッション予約詳細リストページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_rsvListResult.jsp");
		dispatcher.forward(request, response);
		}

}

