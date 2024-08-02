import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:antinna/core/network/api_endpoint.dart';
import 'package:antinna/core/network/http/modules/antinna_http_module.dart';
import 'package:antinna/shared/data/data_sources/profile_remote_data_source.dart';
import 'package:antinna/shared/data/dtos/profile_dto.dart';
import 'package:antinna/shared/data/mapper/profile_mapper.dart';
import 'package:antinna/shared/data/models/profile_model.dart';

import '../../../../fixtures/fixtures.dart';
import '../../../../helpers/test_injection.dart';

class MockAntinnaHttpModule extends Mock implements AntinnaHttpModule {}

void main() {
  late AntinnaHttpModule mockHttpModule;
  late ProfileRemoteDataSource remoteDataSource;

  setUp(
    () {
      mockHttpModule = MockAntinnaHttpModule();
      registerTestFactory<AntinnaHttpModule>(mockHttpModule);
      remoteDataSource = ProfileRemoteDataSourceImpl();
    },
  );

  group(
    'ProfileRemoteDataSource',
    () {
      ProfileModel profile = ProfileMapper.fromDto(
        ProfileDto.fromJson(
          jsonFromFixture('profile_fixture.json'),
        ),
      );
      group(
        'getProfile',
        () {
          test(
            'should return ProfileModel when request success',
            () async {
              // arrange
              when(
                () => mockHttpModule.get(ApiEndpoint.baseUrl),
              ).thenAnswer(
                  (_) async => jsonFromFixture('profile_fixture.json'));

              // act
              var result = await remoteDataSource.getProfile();

              // assert
              expect(result, profile);
              verify(
                () => mockHttpModule.get(ApiEndpoint.baseUrl),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
