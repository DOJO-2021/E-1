import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet(name = "Upload", urlPatterns = { "/upload" })
@MultipartConfig(fileSizeThreshold = 5000000, maxFileSize = 10000000, location = "c:/Temp")
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        for (Part part : request.getParts()) {
            if (part.getName().equals("files")) {
                String name = getFilename(part);
                part.write(name);
                sb.append(name).append("<br>");
            }
        }
        request.setAttribute("upload_files", sb.toString());
        request.getRequestDispatcher("jsp/test.jsp").forward(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        processRequest(request, response);
    }
    private String getFilename(Part part) {
        for (String cd : part.getHeader("Content-Disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }
    public void doGet (HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException
    {
    		this.doPost(request, response);
    }
}