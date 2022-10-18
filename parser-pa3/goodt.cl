#17
_program
  #17
  _class
    Bazz
    IO
    "good.cl"
    (
    #3
    _attr
      h
      Int
      #3
      _int
        1
      : _no_type
    #10
    _attr
      g
      Foo
      #10
      _typcase
        #5
        _object
          self
        : _no_type
        #7
        _branch
          n
          Bazz
          #6
          _new
            Foo
          : _no_type
        #8
        _branch
          n
          Razz
          #7
          _new
            Bar
          : _no_type
        #9
        _branch
          n
          Foo
          #8
          _new
            Razz
          : _no_type
        #10
        _branch
          n
          Bar
          #9
          _object
            n
          : _no_type
      : _no_type
    #12
    _attr
      i
      Object
      #12
      _dispatch
        #12
        _object
          self
        : _no_type
        printh
        (
        )
      : _no_type
    #14
    _method
      printh
      Int
      #14
      _block
        #14
        _dispatch
          #14
          _object
            self
          : _no_type
          out_int
          (
          #14
          _object
            h
          : _no_type
          )
        : _no_type
        #14
        _int
          0
        : _no_type
      : _no_type
    #16
    _method
      doh
      Int
      #16
      _let
        i
        Int
        #16
        _object
          h
        : _no_type
        #16
        _block
          #16
          _assign
            h
            #16
            _plus
              #16
              _object
                h
              : _no_type
              #16
              _int
                1
              : _no_type
            : _no_type
          : _no_type
          #16
          _object
            i
          : _no_type
        : _no_type
      : _no_type
    )
