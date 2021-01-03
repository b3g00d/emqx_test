%%%-------------------------------------------------------------------
%% @doc emqx_test public API
%% @end
%%%-------------------------------------------------------------------

-module(emqx_test_app).

-behaviour(application).

-emqx_plugin(?MODULE).

-export([ start/2
        , stop/1
        ]).

start(_StartType, _StartArgs) ->
    {ok, Sup} = emqx_test_sup:start_link(),
    emqx_test:load(),
    {ok, Sup}.

stop(_State) ->
    emqx_test:unload(),
    ok.
