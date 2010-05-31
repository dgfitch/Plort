// The plot points owned directly by a plot are not linked to any particular state
case class Plot(statePoints: List[StatePoint], plotPoints: List[PlotPoint]) { 
  def this() = this(List(), List())
}
