package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.HashMap;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CommonDao;
import model.SessionBeans;


/**
 * Servlet implementation class StudentReserve
 */
@WebServlet("/StudentReserve")
@MultipartConfig
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
		request.setCharacterEncoding("UTF-8");
		Collection<Part> parts = request.getParts();

		HashMap<String,String> map = new HashMap<String,String>();

		String uploadFileName = "";
		String sendFileName ="";

		String uploadFolder = this.getServletContext().getRealPath("/WebContent/WEB-INF/appfile/");
		// リクエストパラメータを取得する

		CommonDao sDao = new CommonDao();

		for(Part part:parts){ //partsから１つずつ取り出す
			String contentType = part.getContentType();
			if ( contentType == null) {
				//ここは通常のテキストやチェックボックス、セレクトなどのケース

				try(InputStream inputStream = part.getInputStream()) {
					BufferedReader bufReader = new BufferedReader(new InputStreamReader(inputStream));
					//実際のデータを取ってくる
					String val = (String)bufReader.lines().collect(Collectors.joining());
					//HTMLのnameとPOSTされたvalueをセットにして格納
					map.put(part.getName(), val);
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}else{
				//アップロードされたファイルの処理
				uploadFileName = sDao.GetFileName();
				String sourceFileName = this.getFileName(part);
				sendFileName =sourceFileName;
				String extName = sourceFileName.split(".")[1];
				uploadFileName =uploadFileName + "." + extName;
				//.のあとを取得

				//実際には、ファイル名を商品IDなどに置き換えることになる（同一ファイル名対策）
				//ここだけコピペじゃなく、自分で実装すること
				part.write(uploadFolder + uploadFileName);

			}
		}


		String s_name = "1";
		String subject = map.get("subject");
		String question = map.get("question");
		String file = sendFileName;
		int session_m_category = Integer.parseInt(request.getParameter("session_m_category"));

		SessionBeans s_rsv=new SessionBeans(0, s_name, subject, question,file , session_m_category);

		sDao.SessionRegist(s_rsv);

		request.setAttribute("rsv", s_rsv);
		request.setAttribute("filePath", uploadFolder + uploadFileName);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsvResult.jsp");
		dispatcher.forward(request, response);



//		String s_name = request.getParameter("s_name");
//		String file = "004";
//		String file = request.getParameter("file");
//		int session_m_category = 4;
//		int session_m_category = Integer.parseInt(request.getParameter("session_m_category"));


		// セッション予約処理を行う(simpleBCからコード引っ張ってきたので完成してません)

			// 予約成功

		//リクエストスコープに値をセット
//		request.setAttribute("rsv", s_rsv);
//
//
//		// 研修生　セッション予約完了(jsp)にフォワードする
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsvResult.jsp");
//		dispatcher.forward(request, response);

	}

	private String getFileName(Part part) {
		// TODO 自動生成されたメソッド・スタブ
		String name = null;
		for(String dispotion:part.getHeader("Content-Disposition").split(";")) {
			 if (dispotion.trim().startsWith("filename")) {
	                name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"", "").trim();
	                name = name.substring(name.lastIndexOf("\\") + 1);
	                break;
			 }
		}
		return null;
	}
}

