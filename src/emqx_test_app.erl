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

-define(APP, emqx_test).

-define(JWT_ACTION, {emqx_auth_jwt, check, [auth_env()]}).

start(_StartType, _StartArgs) ->
    {ok, Sup} = emqx_test_sup:start_link(),
    emqx_test:load(),
    emqx:hook('client.authenticate', ?JWT_ACTION),
    {ok, Sup}.

stop(_State) ->
    emqx_test:unload(),
    emqx:unhook('client.authenticate', ?JWT_ACTION),
    ok.

auth_env() ->
    #{secret     => env(secret, undefined),
      from       => env(from, password),
      pubkey     => read_pubkey(),
      checklists => env(verify_claims, []),
      opts       => env(jwerl_opts, #{})
     }.

read_pubkey() ->
    case env(pubkey, undefined) of
        undefined  -> undefined;
        Path ->
            {ok, PubKey} = file:read_file(Path), PubKey
    end.

env(Key, Default) ->
    application:get_env(?APP, Key, Default).
