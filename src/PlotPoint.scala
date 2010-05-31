case class PlotPoint(
    // this is clumsy
    owner: Either[Plot, StatePoint],
    condition: Plot => Boolean,
    consequence: Plot => Plot,
    // todo: better signature for preparation?
    preparation: Option[Plot => Plot]
  ) { 
}

