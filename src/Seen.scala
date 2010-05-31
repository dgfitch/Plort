trait Seen {
  def isSeen: Boolean
  def isNotSeen: Boolean = !isSeen
}
