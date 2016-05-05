-module(user_show_handler).
-behavior(cowboy_http_handler).

-include("user.hrl").

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
  %{ok, Req2} = ferl_auth:unauthorized(Req),
  {Id, _} = cowboy_req:binding(id, Req),
  IdInt = binary_to_integer(Id),
  User = #user{id=IdInt},
  Json = ferl_json:user(User),
  {ok, Req2} = cowboy_req:reply(200, [], Json, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
