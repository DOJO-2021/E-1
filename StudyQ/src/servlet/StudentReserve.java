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


/**
 * Servlet implementation class StudentReserve
 */
@WebServlet("/StudentReserve")
public class StudentReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentReserve() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}

		// 研修生　セッション予約(jsp)にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsv.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}

		// リクエストパラメータを取得する（beansが完成したら）
		request.setCharacterEncoding("UTF-8");
//
//		String s_name = request.getParameter("s_name");
//		String subject = request.getParameter("subject");
//		String question = request.getParameter("question");
//		String file = request.getParameter("file");
//		int state = Integer.parseInt(request.getParameter("state"));
//		int session_m_category = Integer.parseInt(request.getParameter("session_m_category"));


		// セッション予約処理を行う(simpleBCからコード引っ張ってきたので完成してません)
		CommonDao bDao = new CommonDao();
		bDao.SessionRegist();	// 予約成功



		// 研修生　セッション予約完了(jsp)にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsvResult.jsp");
		dispatcher.forward(request, response);

	}
}

