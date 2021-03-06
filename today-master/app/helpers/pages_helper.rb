module PagesHelper
  # make the tag name a link to the tag page where tagged posts are shown
  def render_tags_as_links(taglist)
    # use the regex from tag validation
    taglist.gsub(/\w[\w.-]*/){ |t| link_to t, "/posts/tag/#{t}" }.html_safe
  end
end
