import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter_app/core/model/User.dart';
import 'package:unit_test_flutter_app/core/service/counter.dart';

//eski surumlerde run edilebilmesi için  test class için dosya sonuna _test yazilmalıydi "sample_test.dart"


void main(){

  test("sample test senaryo",(){

    final counter=Counter(5);
    counter.increase();
    // 6 olmasini bekleriz
    expect(counter.number,5);
  });

  test("sample user senario",(){

    final user=User(name:"mirza");
    expect(user.name,"mirza");


  });

}