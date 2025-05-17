module TweetsHelper
  def blank_or_dash(value)
    value.present? ? value : "ー"
  end
end