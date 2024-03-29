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
import model.SessionBeans;
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
		int session_id = Integer.parseInt(request.getParameter("session_id"))-1;
		String downloadPath = "appfile/";

		CommonDao cDao = new CommonDao();
//		SessionBeans型のリストsnを生成
		List<SessionBeans> sn = new ArrayList<>();
//		リストsnにDaoのSessionListFindAllメソッドをつかって予約リストをすべて取得する
		sn = cDao.SessionListFindAll();
//		ArrayListのメソッドgetを使用し、
//		SessionBeans型のssnDにt_rsvListから取得したsession_idと同じ行にあるレコードを取得する。

		SessionBeans ssnD = sn.get(session_id);


// 	    リクエストスコープに値をセット
		request.setAttribute("ssnD", ssnD);
		request.setAttribute(downloadPath, downloadPath);



		//セッション予約詳細リストページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/t_rsvListResult.jsp");
		dispatcher.forward(request, response);
		}

}

