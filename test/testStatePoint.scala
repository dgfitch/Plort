import org.specs._

class testStatePoint extends Specification {
  "defaults to not seen" in {
    val s = StatePoint(List(), List())
    s.isNotSeen must beTrue
  }
}
