package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.ContactUsDao;
import com.ensias.foodstore.dao.ReviewDao;
import com.ensias.foodstore.dao.interfaces.ContactUsDaoInterface;
import com.ensias.foodstore.dao.interfaces.ReviewDaoInterface;
import com.ensias.foodstore.models.Contactus;
import com.ensias.foodstore.models.Review;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "MessageManagementServlet", value = "/admin/messages")
public class MessageManagementServlet extends HttpServlet {
    private ContactUsDaoInterface contactUsDao;

    @Override
    public void init() throws ServletException {
        contactUsDao = new ContactUsDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("id") != null) {
            int messageId = Integer.parseInt(request.getParameter("id"));
            Contactus contactus = contactUsDao.getMessageById(messageId);
            contactUsDao.deleteMessage(contactus);
        }

        request.setAttribute("messages",contactUsDao.getAllMessages());
        this.getServletContext().getRequestDispatcher("/views/admin/messages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
