This is public repository for Ruby/Rails and other helpful snippets

Check repository to explore snippets


___
### Ruby, metaprogramming, classes
Using class via string, inflecting and camelize given string, then search for declared class name and use this class. May be better alternative for `case..when` or hash contruction like `{ 'main_menu' => StateInteractions::MainMenu::Handle }`.

`calling_classes_from_string.rb`
___
### Markdown, HTML, rendering
Custom [Redcarpet](https://github.com/vmg/redcarpet) markdown renderer. May be useful when you want to render markdown text to HTML when you want to use markdown text in Telegram.

`custom_redcarpet_markdown_render.rb`
___
### ActiveAdmin, Redis
Modelless [ActiveAdmin](https://github.com/activeadmin/activeadmin) page implementing storing some settings in Redis. May be useful when u don't want to store data in database and need to store it some other way.

`modelless_redis_active_admin.rb`
___
### Docker, Postgres
Making backup SQL file of Postgres Docker container data on one server and restore this backup on another. May be helpful if you need to migrate data from one server to another.

`postgres_backup_and_restore_data.sh`
___
### Docker, Redis
Transfer backup file of Redis Docker container data from one server to another.

`redis_transfer_data.sh`
___
### Rails, migrations, SQL
It is preffered to use SQL in migrations when you update older records because model and other classes may be changed in future (e. g. model's validations, callbacks, etc). So there is example of fine SQL query which uses regular expression to match two tables by name and set foreign key. And do not forget about double quoting (`\\`) because SQL query there is a string.

`regexp_SQL_migration.rb`
