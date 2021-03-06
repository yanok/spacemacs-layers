organization := "mm"
name := "__PROJECT-NAME__"
scalaVersion := "__SCALA-VERSION__"
lazy val __(s-lower-camel-case skeletor-project-name)__ = project.in(file(".")).enablePlugins(PlayScala)
name in Universal := moduleName.value

resolvers ++= Seq(
  "Typesafe repository" at "https://repo.typesafe.com/typesafe/releases/",
  "movio" at "__MOVIO-ARTIFACTORY-REPO-URL__"
)

libraryDependencies ++= Seq(
  "mm" %% "playlib" % "__PLAYLIB-VERSION__",
  "com.softwaremill.macwire" %% "macros" % "__MACWIRE-VERSION__",
  // "joda-time" % "joda-time" % "__JODA-TIME-VERSION__",
  // "org.joda" % "joda-convert" % "__JODA-CONVERT-VERSION__",
  // "com.sksamuel.elastic4s" %% "elastic4s" % "__ELASTIC4S-VERSION__",
  "org.scalatestplus" %% "play" % "__SCALATESTPLUS-VERSION__" % Test
)

scalacOptions ++= Seq(
  "-Xlint",
  "-deprecation",
  "-feature"
)

fork in Test := true

javaOptions in Test += "-Dconfig.file=test/resources/application.conf"
javaOptions in Test += "-Dlogger.file=test/resources/logger.xml"

releaseSettings
ReleaseKeys.versionBump := sbtrelease.Version.Bump.Minor
ReleaseKeys.tagName := version.value.toString

publishTo <<= version { (v: String) ⇒
  val repo = "__MOVIO-ARTIFACTORY-URL__"
  if (v.trim.endsWith("SNAPSHOT"))
    Some("movio snapshots" at repo + "libs-snapshot-local")
  else
    Some("movio releases" at repo + "libs-release-local")
}
