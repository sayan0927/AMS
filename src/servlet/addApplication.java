/**
 *
 * @author Sayan
 */
package servlet;

import Database.DatabaseController;
import Models.Application;
import Util.Config;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;


public class addApplication extends HttpServlet {

	public static final String scorecardStoragePath= Config.scorecardStorage;






	public static final String url= Config.currentURL+"user_page.jsp?window=0";
	boolean bool;





	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Connection connection = null;
		PreparedStatement ps = null;


		String file_name = null;
		String applierId = null,firstName=null,lastName=null,email=null,contact=null,address=null,course=null,hostelRequired = null;
		response.setContentType("text/html");

		String scoreCardPath=null;


		PrintWriter o = response.getWriter();
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent)
		{

			return;
		}
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		try
		{
			List<FileItem> fields = upload.parseRequest(request);
			Iterator<FileItem> iterator = fields.iterator();
			if (!iterator.hasNext()) {
				return;

			}
			while (iterator.hasNext())
			{

				FileItem file = iterator.next();
				boolean isFormField = file.isFormField();
				if (isFormField)
				{


					if(file.getFieldName().equals("appid"))
						applierId=file.getString();
					if(file.getFieldName().equals("fname"))
						firstName=file.getString();
					if(file.getFieldName().equals("lname"))
						lastName=file.getString();
					if(file.getFieldName().equals("email"))
						email=file.getString();
					if(file.getFieldName().equals("contact"))
						contact=file.getString();
					if(file.getFieldName().equals("address"))
						address=file.getString();
					if(file.getFieldName().equals("cid"))
						course=file.getString();
					if(file.getFieldName().equals("hostelRequired"))
						hostelRequired=file.getString();


				}
				else
				{
					if(file.getSize()>0)
					{
						file_name=applierId+"_scorecard.pdf";
						file.write( new File(scorecardStoragePath+file_name));

					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}



			DatabaseController databaseController;

		try {
			databaseController =new DatabaseController();
			databaseController.addNewApplication(new Application(applierId,firstName,lastName,email,contact, address,course,"pending",file_name,hostelRequired));
		} catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}


		o.println("<script type='text/javascript'>");
			o.println("window.location.href='"+url+"';");

			o.println("</script>");
			o.close();

	}
}