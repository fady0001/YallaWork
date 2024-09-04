
import '../../features/add/widget/shared_preferences.dart';

class AppLink {
  static const String server = "http://192.168.43.4:8000/api";
  static const String imagesServer = "http://192.168.43.4:8000/storage";

//================================================================
//   static String token =
//       'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjBmN2FjNWNmNDlhOGQ2ZmYxOWYzMmQ3NTMxYjI1NDNmZGExMTNmZTM5YzI2NThmMWRjYmMwYThiZjc5MzZkYjgwMzY2YmI2ZTY1YmVmYjYiLCJpYXQiOjE3MjI4NTE0MzMuNzI3Mzc5LCJuYmYiOjE3MjI4NTE0MzMuNzI3MzgzLCJleHAiOjE3NTQzODc0MzMuNjY2Njk1LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.lK_mqF6hE_BOSNq5Zl8KqwayPpgJTTS4WTJjQ8W1vgjh917gYGf7frMpurUts6nHUNtGSpdHr9OD9Ca0IF3eHaLfxugfaGBhNTQ_QMdpelxqOUd2xmwsjuj6W3lcTcwtIIRO48ltOfkfaCeqJY-bLqD2wbw_FQUZUBCyjxyaALQnvodcJMXsJ0B3Ysp62R8Puv_2BqI22SFLV3im3_vNTN8KyXfFi50Jbp5VePkxFSUDO3jnKpCZQGbOVSHXVVPn7HbzjiZDTTugiwfdZR87QsQMov_3rRMGghdOYzULMWBheezCWlWy0DwK0W1eAf_VxEzwC3u3NUir9CyeksR0w08oreEwYdbepdURhT2oIJ3GBGzUv6Nm1vsmbXwejAIqS266LOovmIvefvOKwjr9ein5pHzdDzN29BmntKNuyY2ABINHoVJnGTtfDXtK3dxB4uPmWSdB91Mykn8BCKvMLX7p20bTJNSVtmQZ7gbjxbbHdjKe7XBoadQjxyA67GdwXBt2ImCig2hqhqPV5ohlpIdnpteI_uB9R76AwSqXJoMpmLzFxoWHkSfLg5ybylnzjNIEHPXYdUp_CAWWrc-hWA3qIEujaj2BMQnTcNhEXSNwDraADEu6nChZjhVXZGlbC9gtjkl-44muOfhn5yPow-_lqETyZzpzimyIwzKedc8';
  static String token=  CachData.getData(key: 'access_token');
  // static String token =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjBmN2FjNWNmNDlhOGQ2ZmYxOWYzMmQ3NTMxYjI1NDNmZGExMTNmZTM5YzI2NThmMWRjYmMwYThiZjc5MzZkYjgwMzY2YmI2ZTY1YmVmYjYiLCJpYXQiOjE3MjI4NTE0MzMuNzI3Mzc5LCJuYmYiOjE3MjI4NTE0MzMuNzI3MzgzLCJleHAiOjE3NTQzODc0MzMuNjY2Njk1LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.lK_mqF6hE_BOSNq5Zl8KqwayPpgJTTS4WTJjQ8W1vgjh917gYGf7frMpurUts6nHUNtGSpdHr9OD9Ca0IF3eHaLfxugfaGBhNTQ_QMdpelxqOUd2xmwsjuj6W3lcTcwtIIRO48ltOfkfaCeqJY-bLqD2wbw_FQUZUBCyjxyaALQnvodcJMXsJ0B3Ysp62R8Puv_2BqI22SFLV3im3_vNTN8KyXfFi50Jbp5VePkxFSUDO3jnKpCZQGbOVSHXVVPn7HbzjiZDTTugiwfdZR87QsQMov_3rRMGghdOYzULMWBheezCWlWy0DwK0W1eAf_VxEzwC3u3NUir9CyeksR0w08oreEwYdbepdURhT2oIJ3GBGzUv6Nm1vsmbXwejAIqS266LOovmIvefvOKwjr9ein5pHzdDzN29BmntKNuyY2ABINHoVJnGTtfDXtK3dxB4uPmWSdB91Mykn8BCKvMLX7p20bTJNSVtmQZ7gbjxbbHdjKe7XBoadQjxyA67GdwXBt2ImCig2hqhqPV5ohlpIdnpteI_uB9R76AwSqXJoMpmLzFxoWHkSfLg5ybylnzjNIEHPXYdUp_CAWWrc-hWA3qIEujaj2BMQnTcNhEXSNwDraADEu6nChZjhVXZGlbC9gtjkl-44muOfhn5yPow-_lqETyZzpzimyIwzKedc8';
  // static String myId = '5';
  static String myId=  CachData.getData(key: 'user_id');
  //
  static const String sendMsg = "$server/message";
  static const String getAllMsg = "$server/message";
  static const String getAllChats = "$server/chat";
  static const String addChat = "$server/chat";
}
