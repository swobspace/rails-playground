SimpleForm.setup do |config|
  # vertical select input
  config.wrappers :vertical_tom_select, class: 'mb-3' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'form-label'
    b.use :input, class: 'form-select', error_class: 'is-invalid', valid_class: 'is-valid', data: { controller: :select }
    b.use :full_error, wrap_with: { class: 'invalid-feedback' }
    b.use :hint, wrap_with: { class: 'form-text' }
  end
end
