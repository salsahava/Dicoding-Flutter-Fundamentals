import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/provider/done_module_provider.dart';

void main() {
  test('should contain new item when module is completed', () {
    // arrange
    var doneModuleProvider = DoneModuleProvider();
    var testModuleName = 'Test Module';

    // act
    doneModuleProvider.complete(testModuleName);

    // assert
    var result = doneModuleProvider.doneModuleList.contains(testModuleName);
    expect(result, true);
  });
}
