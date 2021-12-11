class HttpExcep implements Exception
{
  final String message;
  HttpExcep (this.message);

@override
String toString(){
//TODO: implement toString
return message;
}
}