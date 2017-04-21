module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  def render_byline_for(post)
    "submitted #{time_ago_in_words(post.created_at)} ago by #{post.user.name} #{post.comments.count} Comments"
  end
end
