class TutorialsController < ApplicationController
  def post
    current_user.update(tutorial_completed: true)
  end

  def plots_new
  end

  def post_show
  end

  def eighteen_lines
  end

  def card
  end

  def foreshadowings
  end

  def characters
  end
end
