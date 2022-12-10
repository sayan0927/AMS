/**
 *
 * @author Sayan
 */
package servlet;

//This servlet is used for Downloading the pdf files to user PC.

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DownloadServlet")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String name="";

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		{// TODO Auto-generated method stub

			String name=request.getParameter("name");

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String filepath = addApplication.scorecardStoragePath;   //here the pdf is located
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");

			//use inline if you want to view the content in browser, helpful for pdf file
			//response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");


			//create inputstream object from the file.
			FileInputStream fileInputStream = new FileInputStream(filepath + name);

			//write data in stream to the user
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}
}

