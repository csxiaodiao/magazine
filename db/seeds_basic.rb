puts '创建管理员admin'
admin = Account.create!(
  email: 'admin@admin.com',
  password: '123456',
)