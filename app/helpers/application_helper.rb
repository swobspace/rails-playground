module ApplicationHelper

  def back_link
   link_to(raw(%Q[<i class="fas fa-arrow-left"></i>]), :back,
            class: 'btn btn-outline-secondary me-1')
  end

  def new_link(obj)
    link_to(raw(%Q[<i class="fas fa-plus"></i>]), new_polymorphic_path(obj),
            target: '_top',
            class: 'btn btn-outline-secondary me-1')
  end

  def show_link(obj)
    link_to(raw(%Q[<i class="fas fa-eye"></i>]), polymorphic_path(obj),
            target: '_top',
            class: 'btn btn-outline-secondary me-1')
  end

  def edit_link(obj)
    link_to(raw(%Q[<i class="fas fa-pencil-alt"></i>]), edit_polymorphic_path(obj),
            target: '_top',
            class: 'btn btn-outline-secondary me-1')
  end

  def delete_link(obj)
    button_to(raw(%Q[<i class="fas fa-trash-alt"></i>]), obj,
            method: :delete,
            target: '_top',
            form: { 'data-turbo-confirm': 'Are you sure?' },
            class: 'btn btn-danger me-1')
  end
end
