(car ''abracadabra)
;;=
(car '(quote abracadabra))
;;因此 car 取出的是第一个 quote 的 car 部分，而这个 car 部分就是 'quote ，所以返回值就是 quote.