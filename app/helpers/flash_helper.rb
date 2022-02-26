module FlashHelper
  def render_turbo_flash
    turbo_stream.prepend "flash", partial: "shared/flash"
  end
end
