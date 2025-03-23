module ApplicationHelper

  def back_link
   link_to(raw(%Q[<i class="fas fa-arrow-left"></i>]), :back,
            class: 'btn btn-outline-secondary me-1')
  end

  def new_link(obj, opts = {})
    options = {class: 'btn btn-outline-secondary me-1'}.merge(opts)
    link_to(raw(%Q[<i class="fas fa-plus"></i>]), new_polymorphic_path(obj), options)
  end

  def show_link(obj, opts = {})
    options = {class: 'btn btn-outline-secondary me-1'}.merge(opts)
    link_to(raw(%Q[<i class="fas fa-eye"></i>]), polymorphic_path(obj), options)
  end

  def edit_link(obj, opts = {})
    options = {class: 'btn btn-outline-secondary me-1'}.merge(opts)
    link_to(raw(%Q[<i class="fas fa-pencil-alt"></i>]), 
            edit_polymorphic_path(obj),
            options)
  end

  def delete_link(obj, opts = {})
    item = Array(obj).last
    options = { method: :delete,
                id: "delete_#{dom_id(item)}",
                form: { 'data-turbo-confirm': 'Are you sure?' },
                class: 'btn btn-danger me-1' }.merge(opts)
    button_to(raw(%Q[<i class="fas fa-trash-alt"></i>]), obj, options)
  end
end
