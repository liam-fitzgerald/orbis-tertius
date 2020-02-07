/+  *server, default-agent
/=  index
  /^  octs
  /;  as-octs:mimes:html
  /:  /===/app/orbis/index
  /|  /html/
      /~  ~
  ==
/=  tile-js
  /^  octs
  /;  as-octs:mimes:html
  /:  /===/app/orbis/js/tile
  /|  /js/
      /~  ~
  ==
/=  script
  /^  octs
  /;  as-octs:mimes:html
  /:  /===/app/orbis/js/index
  /|  /js/
      /~  ~
  ==
/=  style
  /^  octs
  /;  as-octs:mimes:html
  /:  /===/app/orbis/css/index
  /|  /css/
      /~  ~
  ==
/=  orbis-png
  /^  (map knot @)
  /:  /===/app/orbis/img  /_  /png/
::
|%
+$  card  card:agent:gall
--
^-  agent:gall
=<
  |_  bol=bowl:gall
  +*  this       .
      orbis-core  +>
      cc         ~(. orbis-core bol)
      def        ~(. (default-agent this %|) bol)
  ::
  ++  on-init
    ^-  (quip card _this)
    =/  launcha  [%launch-action !>([%orbis / '/~orbis/js/tile.js'])]
    :_  this
    :~  [%pass /orbis %agent [our.bol %orbis] %watch /orbis]
        [%pass / %arvo %e %connect [~ /'~orbis'] %orbis]
        [%pass /orbis %agent [our.bol %launch] %poke launcha]
    ==
  ++  on-poke
    |=  [=mark =vase]
    ^-  (quip card _this)
    ?>  (team:title our.bol src.bol)
    ?+    mark  (on-poke:def mark vase)
        %handle-http-request
      =+  !<([eyre-id=@ta =inbound-request:eyre] vase)
      :_  this
      %+  give-simple-payload:app  eyre-id
      %+  require-authorization:app  inbound-request
      poke-handle-http-request:cc
    ::
    ==
  ::
  ++  on-watch
    |=  =path
    ^-  (quip card:agent:gall _this)
    ?:  ?=([%http-response *] path)
      `this
    ?.  =(/ path)
      (on-watch:def path)
    [[%give %fact ~ %json !>(*json)]~ this]
  ::
  ++  on-agent  on-agent:def
  ::
  ++  on-arvo   
    |=  [=wire =sign-arvo]
    ^-  (quip card _this)
    ?.  ?=(%bound +<.sign-arvo)
      (on-arvo:def wire sign-arvo)
    [~ this]
  ::
  ++  on-save  on-save:def
  ++  on-load  on-load:def
  ++  on-leave  on-leave:def
  ++  on-peek   on-peek:def
  ++  on-fail   on-fail:def
  --
::
::
|_  bol=bowl:gall
::
++  poke-handle-http-request
  |=  =inbound-request:eyre
  ^-  simple-payload:http
  =+  url=(parse-request-line url.request.inbound-request)
  ?+  site.url  not-found:gen
      [%'~orbis' %css %index ~]  (css-response:gen style)
      [%'~orbis' %js %tile ~]    (js-response:gen tile-js)
      [%'~orbis' %js %index ~]   (js-response:gen script)
  ::
      [%'~orbis' %img @t *]
    =/  name=@t  i.t.t.site.url
    =/  img  (~(get by orbis-png) name)
    ?~  img
      not-found:gen
    (png-response:gen (as-octs:mimes:html u.img))
  ::
      [%'~orbis' *]  (html-response:gen index)
  ==
::
--