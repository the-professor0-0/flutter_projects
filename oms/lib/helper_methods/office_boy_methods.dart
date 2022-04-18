import 'package:dio/dio.dart';
import '../constants.dart';
import 'ip.dart';



getLocations() async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getLocations').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}



addUserApplications(to,from) async {
  var dio = Dio();
  String url = ('http://' +
      IP.ip +
      '/obms/api/obms/addUserApplications')
      .toString();
  var response = await dio.post(url,data:{
    'toDate':to,
    'fromDate':from,
    'appliedBy':User.id,
    'leaveStatus':'pending'
  });
  var res = response.data;
}

getUserApplications() async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/obms/api/obms/getUserApplications?id=' +
          User.id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

addLocationLogs(location,floors,dated,timed) async {
  var dio = Dio();
  String url = ('http://' +
      IP.ip +
      '/obms/api/obms/addLocationLogs')
      .toString();
  var response = await dio.post(url,data:{
    'location':location,
    'floors':floors,
    'dated': dated,
    'timed':timed,
    'userid':User.id,
  });
  var res = response.data;
}
