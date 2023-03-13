circuit RefProducer :
  module RefProducer :
    input a : UInt
    input en : UInt<1>
    output thereg : Probe<UInt>
  
    when en :
      reg myreg : UInt, clk
      myreg <= a
      define thereg = probe(myreg)
