-module(ferl_auth).

-export([unauthorized/1]).

unauthorized(Req) ->
  cowboy_req:reply(401, [
    {<<"Www-Authenticate">>, <<"Basic realm=\"Restful\"">>}
  ], unauthorized_body(), Req).

unauthorized_body() ->
  <<"">>.

