case class StatePoint(
    plotPoints: List[PlotPoint], 
    connections: List[StatePoint],
    seen: Boolean
  ) extends Seen {
  def this() = this(List(), List(), false)
  def this(p: List[PlotPoint], c: List[StatePoint]) = this(p, c, false)
  def isSeen = seen
}

