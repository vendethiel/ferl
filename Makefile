PROJECT = ferl
PROJECT_DESCRIPTION = Restful+Erlang
PROJECT_VERSION = 0.0.1
DEPS = cowboy mysql
dep_mysql = git https://github.com/mysql-otp/mysql-otp 1.1.1

include erlang.mk
