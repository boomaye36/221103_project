package com.justlift.review.model;

public class ReviewCountView {
	private Review review;
	private int reviewCount;
	private boolean Inquired;
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public boolean isInquired() {
		return Inquired;
	}
	public void setInquired(boolean inquired) {
		Inquired = inquired;
	}
	
}
