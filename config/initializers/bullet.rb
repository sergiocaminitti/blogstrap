if defined?(Bullet)
  Bullet.enable = true
  Bullet.alert = true
  Bullet.bullet_logger = true
  Bullet.console = true
  Bullet.rails_logger = true
  Bullet.add_footer = true

  # Adicione safelists para evitar avisos desnecessários
  Bullet.add_safelist type: :unused_eager_loading, class_name: 'Article', association: :category
  Bullet.add_safelist type: :unused_eager_loading, class_name: 'Article', association: :user
end
