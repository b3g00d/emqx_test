%%%-------------------------------------------------------------------
%% @doc emqx_test public API
%% @end
%%%-------------------------------------------------------------------

-module(emqx_test_app).

-behaviour(application).

-include("emqx_test.hrl").

-emqx_plugin(?MODULE).

-export([ start/2
        , stop/1
        ]).

start(_StartType, _StartArgs) ->
    {ok, Sup} = emqx_test_sup:start_link(),
    ?APP:load(),
    ?APP:register_metrics(),
    {ok, Sup}.

stop(_State) ->
    ?APP:unload(),
    ok.
