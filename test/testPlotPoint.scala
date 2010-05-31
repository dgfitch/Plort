import org.specs._

class testPlotPoint extends Specification {
  "can be owned by the plot in general" in {
    val owner = new Plot()
    val p = PlotPoint(
      Left(owner),
      (plot => false),
      (identity),
      None
    )
    p.owner must be(Left(owner))
  }

  "can be owned by a StatePoint" in { }
}

