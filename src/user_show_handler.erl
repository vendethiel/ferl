-module(user_show_handler).
-behaviour(cowboy_http_handler).
-include("user.hrl").

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
  {Id, _} = cowboy_req:binding(id, Req),
  _IdInt = binary_to_integer(Id),
  %{ok, Req2} = ferl_auth:unauthorized(Req),
  User = #user{},
  {ok, Req2} = cowboy_req:reply(200, "hey", Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
