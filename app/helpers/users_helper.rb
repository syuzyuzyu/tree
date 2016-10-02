module UsersHelper
  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def reisize_for(img_url, options = { width: 80, height: 80 })
    image = Magick::Image.read(img_url).first
    image.resize_to_fill!(70,60)
    image.write('resize_to_fill.png')
    image_tag('resize_to_fill.png', alt: "", class: "")
  end
end
