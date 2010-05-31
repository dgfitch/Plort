import sbt._

class PulpCoreProject(info: ProjectInfo) extends DefaultProject(info)
{
  // currently keeping separate directories for ant and sbt
  override def outputDirectoryName = "build_sbt"

  override def dependencyPath = "lib_sbt"

  override def mainScalaSourcePath = "src"
  override def mainResourcesPath = "resources"
        
  override def testScalaSourcePath = "test"
  override def testResourcesPath = "test-resources"

  val specs = "org.scala-tools.testing" % "specs" % "1.6.2.1"
  //val pulpcore = "pulpcore" % "pulpcore" % "0.11.5" from "http://code.google.com/p/pulpcore/downloads/detail?name=pulpcore-0.11.5.zip&can=2&q="

  lazy val pack200 = task {
    println("Would do pack200 to make a JAR")
    None 
  }

  lazy val res = task {
    println("Here is where we would run the assets task and pack a zip file")
    None 
  }

  lazy val applet = task {
    println("Create the applet")
    None 
  }

  lazy val player = task {
    println("Would run applet")
    None 
  } dependsOn(res,compile,pack200)

}
