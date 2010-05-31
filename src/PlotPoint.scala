case class PlotPoint(
    condition: Plot => Boolean,
    consequence: Plot => Plot,
    // todo: better signature for preparation
    preparation: Option[Plot => Plot]
  ) { }

