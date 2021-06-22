package servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class SessionAjaxServlet
 */
@WebServlet("/SessionAjaxServlet")
public class SessionAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String json = request.getParameter("newJson");

		// JSONをオブジェクトに変更
		ObjectMapper mapper = new ObjectMapper();

		List<Map<String, String>> reqList =
				mapper.readValue(json, new TypeReference<List<Map<String, String>>>() {});

		Map<String, Object> resList = new HashMap<>();
		resList.put("ary", reqList);

		// オブジェクトをJson文字列に変更
		String resJson = mapper.writeValueAsString(resList);

		// ヘッダ情報などセット
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// JSONを戻す
		PrintWriter out = response.getWriter();
		out.print(resJson);

		//data.jsonに書き出す
		File file = new File("C:\\pleiades\\workspace\\E-1\\StudyQ\\WebContent\\json\\session_data.json");

		//filewriterにファイルを代入
		FileWriter filewriter = new FileWriter(file);

		filewriter.write(resJson);

		//filewriterを閉じる
		filewriter.close();

		}
		//@Override
		public void contextDestroyed(ServletContextEvent arg0) {
			System.out.println("contextDestroyed");
		}

		//@Override
		public void contextInitialized(ServletContextEvent arg0) {
			System.out.println("contextInitialized");
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
*/
	}


