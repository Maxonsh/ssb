class PagesController < ApplicationController
  def disclaimer; end

  def contacts
    @feedback = Feedback.new
  end

  def privacy_policy; end
end
