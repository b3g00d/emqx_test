-module(emqx_test).

-include_lib("emqx/include/emqx.hrl").

-export([ load/0,
          unload/0
        ]).

-export([ on_client_connect/3]).


load() ->
    emqx:hook('client.connect',      {?MODULE, on_client_connect, []}).

unload() ->
    emqx:unhook('client.connect',      {?MODULE, on_client_connect}).


on_client_connect(ConnInfo = #{clientid := ClientId}, Props, _Env) ->
    io:format("Client(~s) connect, ConnInfo: ~p, Props: ~p~n",
              [ClientId, ConnInfo, Props]),
    {ok, Props}.
