import 'package:parkingapp/util/sing_in.dart';

abstract class DataUtils{
  static String getUser(String username){
   if(username =='xico'){
     return '$imageUrl';
   }
   return _getImageUrl('$name');
  }
  static String getChannelImage() => _getImageUrl('');
  static String _getImageUrl(String value)=>'$imageUrl';
}