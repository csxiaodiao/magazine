* install devsic
  rails generate devise:install
  rails g devise:views
  rails generate simple_form:install
  rails g model account
  rails generate devise account
  rails db:migrate
  
*  route.rb
```
devise_for :accounts, controllers: {
    sessions: 'admin/sessions'
  }, only: [:sessions]
```
  rails g controller admin/sessions
  cp -r  ../CPA/app/views/layouts/admin app/views/layouts
  cp -r  ../CPA/app/views/shared/ app/views/
  cp -r  ../CPA/app/views/shared app/views/

