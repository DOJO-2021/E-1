package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommonDao;
import model.SessionBeans;


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
/*		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}*/

		// 研修生　セッション予約(jsp)にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsv.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
/*		HttpSession session = request.getSession();
		if (session.getAttribute("s_id") == null) {
			response.sendRedirect("/StudyQ/StudentLogin");
			return;
		}
*/
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

//		String s_name = request.getParameter("s_name");
		String s_name = "1";
		String subject = request.getParameter("subject");
		String question = request.getParameter("question");
		String file = "004";
//		String file = request.getParameter("file");
		int session_m_category = 4;
//		int session_m_category = Integer.parseInt(request.getParameter("session_m_category"));

		SessionBeans s_rsv=new SessionBeans(0, s_name, subject, question, file, session_m_category);
		// セッション予約処理を行う(simpleBCからコード引っ張ってきたので完成してません)
		CommonDao bDao = new CommonDao();
		bDao.SessionRegist(s_rsv);	// 予約成功

		//リクエストスコープに値をセット
		request.setAttribute("rsv", s_rsv);


		// 研修生　セッション予約完了(jsp)にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsvResult.jsp");
		dispatcher.forward(request, response);

	}
}

