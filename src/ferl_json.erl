-module(ferl_json).

-include("src/user.hrl").

-export([user/1]).

user(User) ->
  record_to_json(record_info(fields, user), User).

record_to_json(Info, Record) ->
  % use tl on the record values list to drop the tag
  jiffy:encode({lists:zip(Info, tl(tuple_to_list(Record)))}).
