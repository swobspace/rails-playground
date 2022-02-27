module FlashAlertHelper
  def render_turbo_flash
    turbo_stream.prepend "flash", partial: "shared/flash_alert"
  end
end
