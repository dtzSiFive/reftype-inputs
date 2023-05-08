circuit RefWire:
  module RefWire:

    ; Illegal, may be supported, should be handled neatly regardless.
    wire foo : Probe<UInt<1>>
    ; Should do nothing
    foo is invalid
