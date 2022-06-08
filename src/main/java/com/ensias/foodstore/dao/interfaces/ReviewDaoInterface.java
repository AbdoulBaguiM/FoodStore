package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Review;

import java.util.List;

public interface ReviewDaoInterface {

    List<Review> getAllReviews();

    List<Review> getReviewsForProduct(int productId);

    Review getReviewForProductByUser(Long userId, int productId);

    Review getReviewById(Long reviewId);

    void saveOrUpdateReview(Review review);
}
