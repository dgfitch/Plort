import org.specs._

class testStatePoint extends Specification {
  "defaults to not seen" in {
    val s = new StatePoint()
    s.isNotSeen must beTrue
  }
}
