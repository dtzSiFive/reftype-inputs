FIRRTL version 3.0.0
circuit Test :
  module Child :
    output io : { flip y : UInt<1>, x : UInt<1>} @[src/test/scala/chiselTests/BoringUtilsSpec.scala 528:20]
    output bore : RWProbe<UInt<1>> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 543:46]
    output bore_1 : RWProbe<UInt<1>> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 544:46]

    connect io.x, io.y @[src/test/scala/chiselTests/BoringUtilsSpec.scala 532:14]
    define bore = rwprobe(io.x) @[src/test/scala/chiselTests/BoringUtilsSpec.scala 543:46]
    define bore_1 = rwprobe(io.y) @[src/test/scala/chiselTests/BoringUtilsSpec.scala 544:46]

  module Test :
    output outRW_X : RWProbe<UInt<1>> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 535:22]
    output outRW_Y : RWProbe<UInt<1>> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 536:23]
    output outXRead : UInt<1> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 537:24]
    output outX : UInt<1> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 538:20]
    input inY : UInt<1> @[src/test/scala/chiselTests/BoringUtilsSpec.scala 539:19]

    inst child of Child @[src/test/scala/chiselTests/BoringUtilsSpec.scala 540:25]
    connect child.io.y, inY @[src/test/scala/chiselTests/BoringUtilsSpec.scala 541:18]
    define outRW_X = child.bore @[src/test/scala/chiselTests/BoringUtilsSpec.scala 543:19]
    define outRW_Y = child.bore_1 @[src/test/scala/chiselTests/BoringUtilsSpec.scala 544:19]
    connect outXRead, read(outRW_X) @[src/test/scala/chiselTests/BoringUtilsSpec.scala 546:16]
    connect outX, child.io.x @[src/test/scala/chiselTests/BoringUtilsSpec.scala 547:12]
