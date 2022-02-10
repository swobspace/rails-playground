ActionController::Renderers.add :csv do |obj, options|
  filename = options[:filename] || 'data'
  str = obj.respond_to?(:to_csv) ? obj.to_csv : obj.to_s
  send_data str, type: Mime[:csv],
    disposition: "attachment; filename=#{filename}.csv"
end

ActionController::Renderers.add :pdf do |obj, options|
  filename = options[:filename] || "#{obj.class.name.to_s.underscore}_#{obj.id}"
  if obj.respond_to?(:to_pdf) 
    str =  obj.to_pdf 
  else
    pdf = Prawn::Document.new(options.reject{|k,v| k.to_sym == :filename})
    PrawnHtml.append_html(pdf, obj.to_s)
    str = pdf.render
  end 
  send_data str, type: Mime[:pdf],
    disposition: "inline; filename=#{filename}.pdf"
end
