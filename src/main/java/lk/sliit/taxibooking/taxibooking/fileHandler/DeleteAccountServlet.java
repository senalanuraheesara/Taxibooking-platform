package lk.sliit.taxibooking.taxibooking.fileHandler;

import lk.sliit.taxibooking.taxibooking.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteAccountServlet", value = "/user/delete")
public class DeleteAccountServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        UserDAO.delete(id);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("{\"success\": true, \"id\": \"" + id + "\"}");
    }
}