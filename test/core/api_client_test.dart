import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/core/core.dart';

import '../fixtures/fixture_reader.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  late MockClient mockClient;
  late ApiClient apiClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(mockClient);
  });

  test('should perform a get request on a url', () async {
    //* arrange
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => Response(fixture('empty.json'), 200));
    //* act
    await apiClient.get('');
    //* assert
    verify(mockClient.get(any, headers: anyNamed('headers')));
  });
}
