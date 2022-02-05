module ApplicationHelper

  def show_link(obj)
    link_to(raw(%Q[<i class="fas fa-eye"></i>]), polymorphic_path(obj),
            target: '_top',
            class: 'btn btn-outline-secondary me-2')
  end

  def edit_link(obj)
    link_to(raw(%Q[<i class="fas fa-pencil-alt"></i>]), edit_polymorphic_path(obj),
            target: '_top',
            class: 'btn btn-outline-secondary me-2')
  end

  def delete_link(obj)
    button_to(raw(%Q[<i class="fas fa-trash-alt"></i>]), obj,
            method: :delete,
            target: '_top',
            class: 'btn btn-danger me-2')
  end
end
