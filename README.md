This is public repository for Ruby/Rails snippets where you can find some helpful pieces of code for any cases

Check repository to explore snippets

1. Modelless active admin page implementing storing some settings in Redis. May be useful when u don't want to store data in database and need to store it some other way.
2. It is preffered to use SQL in migrations when you update older records because model and other classes may be changed in future (e. g. model's validations, callbacks, etc). So there is example of fine SQL query which uses regular expression to match two tables by name and set foreign key. And do not forget about double quoting (`\\`) because SQL query there is a string
