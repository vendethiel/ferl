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
  {Id, Req2} = cowboy_req:binding(id, Req),
  io:put_chars(Id),
  {ok, Req3} = cowboy_req:reply(200, Req2),
  {ok, Req3, State}.
  %{ok, Req3} = ferl_auth:unauthorized(Req),
	%{ok, Req3, State}.

is_authorized(Req, State) ->
  {{false, <<"Basic realm=\"restful\"">>}, Req, State}.

terminate(_Reason, _Req, _State) ->
	ok.
