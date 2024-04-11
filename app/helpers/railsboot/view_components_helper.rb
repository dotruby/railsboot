module Railsboot
  module ViewComponentsHelper
    RAILSBOOT_HELPERS = {
      accordion: "Railsboot::BadgeComponent",
      alert: "Railsboot::AlertComponent",
      badge: "Railsboot::BadgeComponent",
      breadcrumb: "Railsboot::BreadcrumbComponent",
      button: "Railsboot::ButtonComponent",
      button_button: "Railsboot::Button::ButtonComponent",
      button_input: "Railsboot::Button::InputComponent",
      button_link: "Railsboot::Button::LinkComponent",
      card: "Railsboot::CardComponent",
      close_button: "Railsboot::CloseButtonComponent",
      heading: "Railsboot::HeadingComponent",
      list_group: "Railsboot::ListGroupComponent",
      modal: "Railsboot::ModalComponent",
      nav: "Railsboot::NavComponent",
      pagination: "Railsboot::PaginationComponent",
      spinner: "Railsboot::SpinnerComponent",
      table: "Railsboot::TableComponent",
      table_body: "Railsboot::Table::BodyComponent",
      table_cell: "Railsboot::Table::CellComponent",
      table_head: "Railsboot::Table::HeadComponent",
      table_row: "Railsboot::Table::RowComponent",
      toast: "Railsboot::Table::ToastComponent"
    }

    RAILSBOOT_HELPERS.each do |name, component|
      define_method :"railsboot_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end
  end
end
