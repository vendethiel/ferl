-module(user_show_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([is_authorized/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
  {Id, _} = cowboy_req:binding(id, Req),
  {_IdInt, []} = string:to_integer(binary_to_list(Id)),
  {ok, Req2} = ferl_auth:unauthorized(Req),
	{ok, Req2, State}.

is_authorized(Req, State) ->
  {{false, <<"Basic realm=\"restful\"">>}, Req, State}.

terminate(_Reason, _Req, _State) ->
	ok.
