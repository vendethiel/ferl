-module(ferl_auth).

-export([unauthorized/1]).

unauthorized(Req) ->
  {ok, Req2} = cowboy_http_req:set_resp_header(<<"Www-Authenticate">>, <<"Basic realm=\"Restful\"">>, Req),
  {ok, Req3} = cowboy_http_req:set_resp_body(unauthorized_body(), Req2),
  cowboy_http_req:reply(401, Req3).

unauthorized_body() ->
  <<"">>.

