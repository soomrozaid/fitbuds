/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _username;
  final String? _email;
  final Profile? _profile;
  final bool? _isProfileComplete;
  final List<amplify_core.TemporalDateTime>? _updates;
  final List<amplify_core.TemporalDateTime>? _logins;
  final List<ActivityLog>? _activityLogs;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get username {
    return _username;
  }
  
  String? get email {
    return _email;
  }
  
  Profile? get profile {
    return _profile;
  }
  
  bool? get isProfileComplete {
    return _isProfileComplete;
  }
  
  List<amplify_core.TemporalDateTime>? get updates {
    return _updates;
  }
  
  List<amplify_core.TemporalDateTime>? get logins {
    return _logins;
  }
  
  List<ActivityLog>? get activityLogs {
    return _activityLogs;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, username, email, profile, isProfileComplete, updates, logins, activityLogs, createdAt, updatedAt}): _username = username, _email = email, _profile = profile, _isProfileComplete = isProfileComplete, _updates = updates, _logins = logins, _activityLogs = activityLogs, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? username, String? email, Profile? profile, bool? isProfileComplete, List<amplify_core.TemporalDateTime>? updates, List<amplify_core.TemporalDateTime>? logins, List<ActivityLog>? activityLogs, amplify_core.TemporalDateTime? createdAt}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      email: email,
      profile: profile,
      isProfileComplete: isProfileComplete,
      updates: updates != null ? List<amplify_core.TemporalDateTime>.unmodifiable(updates) : updates,
      logins: logins != null ? List<amplify_core.TemporalDateTime>.unmodifiable(logins) : logins,
      activityLogs: activityLogs != null ? List<ActivityLog>.unmodifiable(activityLogs) : activityLogs,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _username == other._username &&
      _email == other._email &&
      _profile == other._profile &&
      _isProfileComplete == other._isProfileComplete &&
      DeepCollectionEquality().equals(_updates, other._updates) &&
      DeepCollectionEquality().equals(_logins, other._logins) &&
      DeepCollectionEquality().equals(_activityLogs, other._activityLogs) &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("isProfileComplete=" + (_isProfileComplete != null ? _isProfileComplete!.toString() : "null") + ", ");
    buffer.write("updates=" + (_updates != null ? _updates!.toString() : "null") + ", ");
    buffer.write("logins=" + (_logins != null ? _logins!.toString() : "null") + ", ");
    buffer.write("activityLogs=" + (_activityLogs != null ? _activityLogs!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? username, String? email, Profile? profile, bool? isProfileComplete, List<amplify_core.TemporalDateTime>? updates, List<amplify_core.TemporalDateTime>? logins, List<ActivityLog>? activityLogs, amplify_core.TemporalDateTime? createdAt}) {
    return User._internal(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      profile: profile ?? this.profile,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      updates: updates ?? this.updates,
      logins: logins ?? this.logins,
      activityLogs: activityLogs ?? this.activityLogs,
      createdAt: createdAt ?? this.createdAt);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? username,
    ModelFieldValue<String?>? email,
    ModelFieldValue<Profile?>? profile,
    ModelFieldValue<bool?>? isProfileComplete,
    ModelFieldValue<List<amplify_core.TemporalDateTime>?>? updates,
    ModelFieldValue<List<amplify_core.TemporalDateTime>?>? logins,
    ModelFieldValue<List<ActivityLog>?>? activityLogs,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt
  }) {
    return User._internal(
      id: id == null ? this.id : id.value,
      username: username == null ? this.username : username.value,
      email: email == null ? this.email : email.value,
      profile: profile == null ? this.profile : profile.value,
      isProfileComplete: isProfileComplete == null ? this.isProfileComplete : isProfileComplete.value,
      updates: updates == null ? this.updates : updates.value,
      logins: logins == null ? this.logins : logins.value,
      activityLogs: activityLogs == null ? this.activityLogs : activityLogs.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _email = json['email'],
      _profile = json['profile'] != null
          ? json['profile']['serializedData'] != null
              ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']['serializedData']))
              : Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _isProfileComplete = json['isProfileComplete'],
      _updates = (json['updates'] as List?)?.map((e) => amplify_core.TemporalDateTime.fromString(e)).toList(),
      _logins = (json['logins'] as List?)?.map((e) => amplify_core.TemporalDateTime.fromString(e)).toList(),
      _activityLogs = json['activityLogs'] is List
        ? (json['activityLogs'] as List)
          .where((e) => e != null)
          .map((e) => ActivityLog.fromJson(new Map<String, dynamic>.from(e['serializedData'] ?? e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'email': _email, 'profile': _profile?.toJson(), 'isProfileComplete': _isProfileComplete, 'updates': _updates?.map((e) => e.format()).toList(), 'logins': _logins?.map((e) => e.format()).toList(), 'activityLogs': _activityLogs?.map((ActivityLog? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'email': _email,
    'profile': _profile,
    'isProfileComplete': _isProfileComplete,
    'updates': _updates,
    'logins': _logins,
    'activityLogs': _activityLogs,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final PROFILE = amplify_core.QueryField(fieldName: "profile");
  static final ISPROFILECOMPLETE = amplify_core.QueryField(fieldName: "isProfileComplete");
  static final UPDATES = amplify_core.QueryField(fieldName: "updates");
  static final LOGINS = amplify_core.QueryField(fieldName: "logins");
  static final ACTIVITYLOGS = amplify_core.QueryField(fieldName: "activityLogs");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'profile',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Profile')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISPROFILECOMPLETE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.UPDATES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.dateTime.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LOGINS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.dateTime.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'activityLogs',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'ActivityLog')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}