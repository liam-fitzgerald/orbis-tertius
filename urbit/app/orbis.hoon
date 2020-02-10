/+  *server, default-agent, xraylib=xray, easy-print=language-server-easy-print, lsp-build=language-server-build
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
+$  state-zero  [%0 =ximage]
--
=|  state-zero
=*  state  -
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
    =^  cards  state
      regen-xray:cc
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
        %json
      =^  cards  state
        (poke-xray-for:cc !<(json vase))
      [cards this]
        %handle-http-request
      =+  !<([eyre-id=@ta =inbound-request:eyre] vase)
      :_  this
      %+  give-simple-payload:app  eyre-id
      %+  require-authorization:app  inbound-request
      poke-handle-http-request:cc
        %noun
      =^  cards  state
        regen-xray:cc
      [cards this]
    ::
    ==
  ::
  ++  on-watch
    |=  =path
    ^-  (quip card:agent:gall _this)
    ?:  ?=([%http-response *] path)
      `this
    ?:  ?=([%primary ~] path)
     :_  this
     =,  enjs:format
     [%give %fact ~ %json !>((frond 'initial' (frond 'docs' (xray-to-json:cc get-documentation:cc))))]~
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
  ++  on-save  !>(state)
  ++  on-load
    |=  old=vase
    [~ this(state !<(state-zero old))]
  ++  on-leave  on-leave:def
  ++  on-peek   on-peek:def
  ++  on-fail   on-fail:def
  --
::
::
|_  bol=bowl:gall
::
++  poke-xray-for
  |=  jon=json
  ^-  (quip card _state)
  ?>  ?=([%n *] jon)
  =/  =xkey
    (slav %ud p.jon)
  =/  =xray
    (focus-on:xraylib xtable.ximage xkey)
  ~&  xray
  :_  state
  =,  enjs:format
  :~
  [%give %fact ~[/primary] %json !>((frond 'update' (frond 'docs' (xray-to-json xray))))]
  [%give %fact ~[/primary] %json !>((frond 'update' (frond 'source' (xray-to-json xray))))]
  ==
::
++  get-xray-for-xkey
  |=  =xkey
  ^-  xray
  *xray
::
++  spot-to-json
  |=  =spot
  ^-  json
  =,  enjs:format
  %:  pairs
    path+(path p.spot)
    pint+(pint-to-json q.spot)
    ~
  ==
++  loc-to-json
  |=  [p=@ q=@]
  ^-  json
  =,  enjs:format
  %:  pairs
    line+(numb p)
    col+(numb q)
    ~
  ==
++  pint-to-json
  |=  =pint
  ^-  json
  =,  enjs:format
  %:  pairs
    start+(loc-to-json p.pint)
    end+(loc-to-json q.pint)
    ~
  ==
++  to-wall
  |=  =tape
  ^-  wall
  %+  roll  (flop tape)
  |=  [char=@tD =wall]
  ?~  wall
    [[char ~] ~]
  ?:  =('\0a' char)
    [~ wall]
  [[char i.wall] t.wall]
::
++  get-src-for-spot
  |=  =spot
  ^-  json
  =/  pax=path
    (weld /=home/(scot %da now.bol) (slag 3 p.spot))
  ~&  pax
  =/  src=@t
    .^(@t %cx pax)
  =/  buf=wall
    (to-wall (trip src))
  :-  %s
  =*  pint  q.spot
  %-  crip  %-  zing
  %+  join  "\0a"
  %+  swag
    :-  (safe-sub p.p.pint 2)
    (add 2 (sub p.q.pint p.p.pint))
  buf
++  safe-sub
  |=  [a=@ b=@]
  ?:  (gth b a)
    0
  (sub a b)
::
::
++  pats-to-json
  |=  =xpat
  ^-  json
  ?.  ?=(%gate -.xpat)
    ~
  =,  enjs:format
  =/  sample
    (focus-on:xraylib xtable.ximage sample.xpat)
  =/  product
    (focus-on:xraylib xtable.ximage product.xpat)
  %:  pairs
    sample+(tape ~(ram re ~(duck easy-print type.sample)))
    product+(tape ~(ram re ~(duck easy-print type.product)))
    ~
  ==

++  xray-to-json
  |=  =xray
  =,  enjs:format
  ^-  json
  %+  frond
    (scot %ud xkey.xray)
  %:  pairs
    type+(tape ~(ram re ~(duck easy-print type.xray)))
    xdat+(fall (bind xdat.xray xdat-to-json) ~)
    spot+(fall (bind spot.xray spot-to-json) ~)
    src+(fall (bind spot.xray get-src-for-spot) ~)
    pats+(fall (bind pats.xray pats-to-json) ~)
    ~
  ==
++  xdat-to-json
  |=  =xdat
  ^-  json
  ?+  -.xdat  ~
      %core
    (core-xdat-to-json xdat)
  ==
++  core-xdat-to-json
  |=  =xdat
  ^-  json
  ?>  ?=(%core -.xdat)
  =,  enjs:format
  %:  pairs
    type+s+'core'
    ::
    :-  %garb
    %:  pairs
      poly+s+q.garb.xdat
      vair+s+r.garb.xdat
      ~
    ==
    ::
    :-  %batt
    (xbat-to-json batt.xdat)
    ~
  ==
::
++  xbat-to-json
  |=  =xbat
  ^-  json
  :-  %o
  %-  ~(run by xbat)
  |=  [what arms=(map term xkey)]
  ^-  json
  :-  %o
  %-  ~(run by arms)
  |=  =xkey
  [%n (scot %ud xkey)]
::
++  get-documentation
  ^-  xray
  (focus-on:xraylib xtable.ximage root.ximage)
++  regen-xray
  ^-  (quip card _state)
  :-  ~
  state(ximage (xray-type:xraylib 3 -:!>(lsp-build)))
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
