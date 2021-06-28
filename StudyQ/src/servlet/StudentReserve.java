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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CommonDao;
import model.SessionBeans;


/**
 * Servlet implementation class StudentReserve
 */
@WebServlet("/StudentReserve")
@MultipartConfig(maxFileSize=500000000,location = "C:\\pleiades\\workspace\\E-1\\StudyQ\\WebContent\\appfile")

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


		request.setCharacterEncoding("UTF-8");
		Collection<Part> parts = request.getParts();

		HashMap<String,String> map = new HashMap<String,String>();

		String uploadFileName = "";
		String sendFileName = "";


//		String uploadFolder = "C:\\pleiades\\workspace\\E-1\\StudyQ\\WebContent\\appfile\\";

		String uploadFolder = this.getServletContext().getRealPath("/appfile/");

		String downloadPath = "appfile/";
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
					map.put( part.getName(),val);
					//HTMLのnameとPOSTされたvalueをセットにして格納

				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
			else{
				//アップロードされたファイルの処理
				if (part.getName().equals("file")) {
					uploadFileName = sDao.GetFileName();
					String sourceFileName = getFileName(part);
					sendFileName = sourceFileName;
					String extName = sourceFileName.split("\\.")[1];
					uploadFileName =uploadFileName + "." + extName;
					//.のあとを取得

					//実際には、ファイル名を商品IDなどに置き換えることになる（同一ファイル名対策）
					//ここだけコピペじゃなく、自分で実装すること
					part.write(uploadFolder + uploadFileName);
				}

			}
		}


		String s_name = (String) session.getAttribute("s_name");
		String subject = map.get("subject");
		String question = map.get("question");
		String file = uploadFileName;
		int session_m_category = Integer.parseInt(request.getParameter("session_m_category"));

		SessionBeans s_rsv=new SessionBeans(0, s_name, subject, question,file,session_m_category);

		sDao.SessionRegist(s_rsv);

		request.setAttribute("rsv", s_rsv);
		request.setAttribute("filenames", sendFileName);
		request.setAttribute("filePath", downloadPath + uploadFileName);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/s_rsvResult.jsp");
		dispatcher.forward(request, response);
	}
	 private String getFileName(Part part) {
         String name = null;
         for (String cd : part.getHeader("Content-Disposition").split(";")) {
             if (cd.trim().startsWith("filename")) {
                 return cd.substring(cd.indexOf('=') + 1).trim()
                         .replace("\"", "");
             }
         }
		return name;
	}
}

