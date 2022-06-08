package com.ensias.foodstore.controllers.admin;

import com.ensias.foodstore.dao.AdminDao;
import com.ensias.foodstore.dao.ReviewDao;
import com.ensias.foodstore.dao.interfaces.AdminDaoInterface;
import com.ensias.foodstore.dao.interfaces.ReviewDaoInterface;
import com.ensias.foodstore.models.Review;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;

@WebServlet(name = "ReviewsManagmentServlet", value = "/admin/reviews")
public class ReviewsManagmentServlet extends HttpServlet {

    private ReviewDaoInterface reviewDao;

    @Override
    public void init() throws ServletException {
        reviewDao = new ReviewDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("id") != null) {
            Long reviewId = Long.valueOf(request.getParameter("id"));
            Review review = reviewDao.getReviewById(reviewId);
            review.setStatut(review.getStatut() == false ? true : false);
            review.setUpdatedAt(Instant.now());
            reviewDao.saveOrUpdateReview(review);
        }

        request.setAttribute("reviews",reviewDao.getAllReviews());
        this.getServletContext().getRequestDispatcher("/views/admin/reviews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
