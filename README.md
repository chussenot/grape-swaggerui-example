# Grape documentation using Swagger UI on a Rails app.

This application aims to demonstate how to document a
[Grape](https://github.com/intridea/grape) Api using
[Swagger Ui](https://github.com/wordnik/swagger-ui).

The API endpoint lives on `api.grape-swagger.local` and the documentation on
`grape-swagger.local/doc`.

By mounting the API on a subdomain, we wanted to describe how to use CORS
features between Grape and Swagger UI.

## Lanching the demo

First, clone this repo :
`git clone git@github.com:AF83/grape-swaggerui-example.git`.

Install its dependencies : `bundle install; bower install`.

Populate the database with some bands and members :
`bundle exec rake db:populate`.

Copy the nginx virtual host :
`cp admin/nginx/grape-swagger.local /etc/nginx/site-availables/`

Restart nginx.

Add hosts to your `/etc/hosts` :
`echo 127.0.0.1 grape-swagger.local api.grape-swagger.local >> /etc/hosts`

Launch the server : `bundle exec rails s`.
