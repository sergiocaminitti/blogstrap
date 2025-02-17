module ApplicationHelper
  def render_if(condition, template, record)
    # Só irá renderizar o template se a condição for verdadeira
    # condição de o registro for válido
    render template, record if condition
  end
end
