source 'https://gems.ruby-china.com'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# 登录
gem 'devise', '~> 4.4.3'
# jquery
gem 'jquery-rails'
# bootstrap
gem 'bootstrap-sass', '~> 3.3.7'
gem 'font-awesome-rails', '~> 4.7.0.4'
# form表单
gem 'simple_form', '~> 4.0.1'
# 分页
gem 'kaminari', '~> 1.1.1'
# 面包屑
gem "breadcrumbs_on_rails", '~> 3.0.1'
# 高亮当前菜单
gem 'active_link_to', '~> 1.0.5'
gem 'record_tag_helper', '~> 1.0'

# 枚举支持
gem 'enumerize', '~> 2.2', '>= 2.2.2'
# 环境变量
gem 'dotenv-rails', groups: [:development, :test]
# 批量插入
gem 'activerecord-import', '~> 0.24.0'
# http 请求
gem 'http', '~> 4.0'
# 阿里云短信
# gem 'aliyun-sms'
# 文章重写
gem 'cat_ai', :git => 'git@github.com:csxiaodiao/cat_ai.git'
gem 'art_api', :git => 'git@github.com:csxiaodiao/Art_api.git'
# 搜索
gem 'ransack', '~> 2.1'
# 后台任务
gem 'delayed_job', '~> 4.1.5'
gem 'delayed_job_active_record', '~> 4.1.3'
# 定时任务
gem 'whenever', '~> 0.10.0'
# 文件上传
gem 'carrierwave', '~> 1.2', '>= 1.2.3'
#状态机
gem 'aasm', '~> 5.0', '>= 5.0.1'
#软删除
gem 'paranoia', '~> 2.4', '>= 2.4.1'
#权限
gem 'pundit', '~> 2.0'
#树状结构
gem 'closure_tree', '~> 7.0'
#默认值
gem 'default_value_for', '~> 3.1'
#跨域
gem 'rack-cors', require: 'rack/cors'
# 拼音
# gem 'ruby-pinyin', '~> 0.5.0'
#编辑器
gem 'ckeditor', '~> 4.3'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry', '~> 0.11.3'

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'database_cleaner', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'mocha', '~> 1.5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
