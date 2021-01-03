emqx_test
========

An EMQ X plugin

##### emqx_test.conf

```properties
emqx_test.hook.client.connected.1     = {"action": "on_client_connected"}
emqx_test.hook.client.disconnected.1  = {"action": "on_client_disconnected"}
emqx_test.hook.client.subscribe.1     = {"action": "on_client_subscribe"}
emqx_test.hook.client.unsubscribe.1   = {"action": "on_client_unsubscribe"}
emqx_test.hook.session.subscribed.1   = {"action": "on_session_subscribed"}
emqx_test.hook.session.unsubscribed.1 = {"action": "on_session_unsubscribed"}
emqx_test.hook.message.publish.1      = {"action": "on_message_publish"}
emqx_test.hook.message.delivered.1    = {"action": "on_message_delivered"}
emqx_test.hook.message.acked.1        = {"action": "on_message_acked"}
```

License
-------

Apache License Version 2.0

Author
------

Contributors
------------

# emqx_test
