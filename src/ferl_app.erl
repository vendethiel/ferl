-module(ferl_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
  Dispatch = cowboy_router:compile([
    {'_', [
      {"/", root_handler, []},
      {"/user/:id", user_show_handler, []}
    ]}
  ]),
  {ok, _} = cowboy:start_http(ferl_app, 100,
    [{port, 8181}],
    [{env, [{dispatch, Dispatch}]}]
  ),
	ferl_sup:start_link().

stop(_State) ->
	ok.
