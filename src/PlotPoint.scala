trait PlotPoint {
  def condition: Plot => Boolean
  def consequence: Plot => Plot
  // todo: better signature for preparation
  def preparation: Option[Plot => Plot]
}

