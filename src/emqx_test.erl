-module(emqx_test).

-include_lib("emqx/include/emqx.hrl").

-export([ load/0,
          unload/0
        ]).

-export([ on_client_connect/2]).


load() ->
    emqx:hook('client.connect',      {emqx_test, on_client_connect, []}).

unload() ->
    emqx:unhook('client.connect',      {emqx_test, on_client_connect}).


on_client_connect(ConnInfo = #{clientid := ClientId}, Props) ->
    io:format("Client(~s) connect, ConnInfo: ~p, Props: ~p~n",
              [ClientId, ConnInfo, Props]),
    {ok, Props}.
