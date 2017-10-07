# Regbuilding Rails From Scratch
Just want to know how Rails "magic" **_actually_** works. 

- **ActiveSupport** - is a compatibility library including methods that
                  aren't necessarily specific to Rails.  You'll see ActiveSupport
                  used by non-Rails libraries because it contains such a lot of
                  useful baseline functionality.  ActiveSupport includes methods
                  like how Rails changes words from single to plural, or
                  CamelCase to snake_case.  It also includes significantly
                  better time and date support than the Ruby standard library.
- **ActiveModel** - hooks into features of your models that aren't
                really about the database - for instance, if you want a URL for
                a given model, ActiveModel helps you there.  It's a thin
                wrapper around many different ActiveModel implementations
                to tell Rails how to use them.  Most commonly, ActiveModel
                implementations are ORMs (see ActiveRecord, below), but
                they can also use non-relational storage like MongoDB,
                Redis, Memcached or even just local machine memory.
- **ActiveRecord** - is an Object-Relational Mapper (ORM).  That
                 means that it maps between Ruby objects and tables in a
                 SQL database. When you query from or write to the SQL database in Rails, you do it through ActiveRecord.  
                                                                       ActiveRecord also implements ActiveModel. ActiveRecord
                                                                       supports MySQL and SQLite, plus JDBC, Oracle,
                                                                       PostgreSQL and many others.
- **ActionPack** does routing - the mapping of an incoming URL to
            a controller and action in Rails.  It also sets up your controllers
            and views, and shepherds a request through its controller
            action and then through rendering the view.  For some of it,
            ActionPack uses Rack.  The template rendering itself is done
            through an external gem like Erubis for .erb templates, or
            Haml for .haml templates.  ActionPack also handles action- or
            view-centered functionality like view caching.
- **ActionMailer** - is used to send out email, especially email based
                 on templates.  It works a lot like you'd hope Rails email would,
                 with controllers, actions and "views" - which for email are text-
                 based templates, not regular web-page templates.