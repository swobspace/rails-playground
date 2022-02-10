module PostConcerns
  extend ActiveSupport::Concern

  included do
  end

  def to_pdf(options = {})
    pdf = Prawn::Document.new(options)

    pdf.text "Subject:", style: :bold
    pdf.move_down 6
    pdf.indent(20) do
      pdf.text subject
    end
     pdf.move_down 12
    pdf.text "Content:", style: :bold
    pdf.move_down 6
    pdf.indent(20) do
      PrawnHtml.append_html(pdf, content.to_s)
    end
    pdf.render
  end
end
