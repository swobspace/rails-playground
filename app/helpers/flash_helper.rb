module FlashHelper
  def render_turbo_flash
    turbo_stream.prepend "flash", partial: "shared/flash_alert"
  end

  def render_turbo_toast
    turbo_stream.prepend "flash", partial: "shared/flash_toast"
  end
end
