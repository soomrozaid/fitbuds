import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fitbuds/models/models.dart';

class UserRepository {
  final AmplifyClass? amplify;
  final ModelProviderInterface modelProvider;

  const UserRepository({this.amplify, required this.modelProvider});

  Future<String?> _getCurrentAuthenticatedUserId() async {
    try {
      AuthSession _session = await Amplify.Auth.fetchAuthSession(
              options: CognitoSessionOptions(getAWSCredentials: true))
          .timeout(const Duration(seconds: 10));
      String? _id = (_session as CognitoAuthSession).identityId;
      return _id;
    } catch (e) {
      return null;
    }
  }

  Future<User?> createNewUser({
    required String username,
    required String email,
    Profile? profile,
    String? userId,
  }) async {
    String? _userId = userId;

    if (_userId is! String) {
      String? _userId = await _getCurrentAuthenticatedUserId();

      if (_userId == null) {
        return null;
      }
    }

    bool _isProfileComplete = await _checkProfileComplete(profile: profile);

    ActivityLog _log = ActivityLog(
      id: UUID.getUUID(),
      type: ActivityType.CREATED_ACCOUNT,
      desc: 'Created a new account',
      timestamp: TemporalDateTime.now(),
    );

    User _user = User(
      id: _userId,
      username: username,
      email: email,
      profile: profile,
      isProfileComplete: _isProfileComplete,
      createdAt: TemporalDateTime.now(),
      activityLogs: [_log],
      updates: [TemporalDateTime.now()],
    );

    await Amplify.DataStore.save(_user).onError((error, stackTrace) => null);

    return _user;
  }

  Future<User?> getUser({String? email, String? username}) async {
    String? _userId = await _getCurrentAuthenticatedUserId();

    if (_userId == null) {
      return null;
    }

    try {
      return await Amplify.DataStore.query(User.classType,
              where: User.ID.eq(_userId))
          .then((value) => value.first);
    } catch (e) {
      return createNewUser(username: username ?? '', email: email ?? '');
    }
  }

  Future<User?> updateUser(
    String userId, {
    String? username,
    String? email,
    Profile? profile,
    bool? isProfileComplete,
    List<TemporalDateTime>? logins,
    List<ActivityLog>? activityLogs,
  }) async {
    User? _user = await getUser();

    if (_user is! User) {
      return null;
    }

    ActivityLog _log = ActivityLog(
      id: UUID.getUUID(),
      type: ActivityType.UPDATED_USER,
      timestamp: TemporalDateTime.now(),
    );

    List<ActivityLog>? _userActivityLogs = [
      ..._user.activityLogs ?? [],
      ...activityLogs ?? []
    ];

    _userActivityLogs.add(_log);

    User _updatedUser = _user.copyWith(
      username: username,
      email: email,
      profile: profile,
      isProfileComplete: isProfileComplete,
      logins: logins,
      activityLogs: _userActivityLogs,
    );

    Amplify.DataStore.save(_updatedUser)
        .onError((error, stackTrace) => null)
        .then((value) => value);

    return _updatedUser;
  }

  Future<User?> updateUserProfile(
    String userId, {
    String? firstname,
    String? lastname,
    TemporalDate? dateOfBirth,
    Gender? gender,
    City? location,
    UserGym? gym,
    List<String>? friends,
  }) async {
    User? _user = await getUser();

    if (_user is! User) {
      return null;
    }

    Profile _profile = _user.profile!.copyWith(
      firstName: firstname,
      lastName: lastname,
      dateOfBirth: dateOfBirth,
      gender: gender,
      location: location,
      gym: gym,
      friends: friends,
    );

    ActivityLog _log = ActivityLog(
      id: UUID.getUUID(),
      type: ActivityType.UPDATED_PROFILE,
      desc: 'User updated profile',
      timestamp: TemporalDateTime.now(),
    );

    return await updateUser(
      userId,
      profile: _profile,
      activityLogs: [_log],
    );
  }

  Future<bool> _checkProfileComplete({Profile? profile, String? userId}) async {
    Profile? _profile = profile;

    if (userId != null) {
      User? _user = await getUser();

      if (_user is! User) {
        return false;
      }

      if (_user.profile == null) {
        return false;
      }

      _profile = _user.profile!;
    }

    if (_profile == null) {
      return false;
    }

    if (_profile.firstName == null ||
        _profile.lastName == null ||
        _profile.dateOfBirth == null ||
        _profile.gender == null ||
        _profile.location == null ||
        _profile.gym == null) {
      return false;
    }

    return true;
  }
}
