case class StatePoint(plotPoints: List[PlotPoint], connections: List[StatePoint]) extends Seen {
  val seen: Boolean = false
  def isSeen = seen
}
