/// Converting comma separated name to normal
/// e.g. "Shakespeare, William" to "William Shakespeare"
String getName(String author){
  List<String> split = author.split(", ");
  return split.reversed.join(" ");
}