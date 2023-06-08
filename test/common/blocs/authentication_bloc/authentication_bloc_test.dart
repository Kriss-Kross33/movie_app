import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/src/common/common.dart';

import 'authentication_bloc_test.mocks.dart';

// class MockUserModel extends Mock implements UserModel {}

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

@GenerateMocks([UserModel, AuthenticationRepository])
void main() {
  late MockUserModel mockUserModel;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockUserModel = MockUserModel();
    mockAuthenticationRepository = MockAuthenticationRepository();

    when(mockAuthenticationRepository.user).thenAnswer((_) => Stream.empty());
    when(mockAuthenticationRepository.currentUser).thenReturn(UserModel.empty);
  });

  group('AuthenticationBloc', () {
    test('initial state is unauthenticated when user is empty', () {
      expect(
        AuthenticationBloc(repository: mockAuthenticationRepository).state,
        AuthenticationState.unauthenticated(),
      );
    });
  });

  group('UserChanged', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits authenticated when user is not empty',
      setUp: () {
        when(mockUserModel.isNotEmpty).thenReturn(true);
        when(mockAuthenticationRepository.user)
            .thenAnswer((realInvocation) => Stream.value(mockUserModel));
      },
      build: () => AuthenticationBloc(repository: mockAuthenticationRepository),
    );
  });

  group(
    'LogoutRequested',
    () {
      blocTest<AuthenticationBloc, AuthenticationState>('invokes logout',
          setUp: () {
            when(mockAuthenticationRepository.logout())
                .thenAnswer((_) async {});
          },
          act: (bloc) => bloc.add(LogoutRequestedEvent()),
          build: () =>
              AuthenticationBloc(repository: mockAuthenticationRepository),
          verify: (_) {
            verify(mockAuthenticationRepository.logout()).called(1);
          });
    },
  );
}
