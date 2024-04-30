import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.unauthenticated() = Unauthenticated;

  const factory SplashState.internetUnAvailable() = _InternetUnAvailable;

  const factory SplashState.authenticated() = AppAuthenticated;

  const factory SplashState.authenticatedAnonymous() =
      AppAuthenticatedAnonymous;
}
