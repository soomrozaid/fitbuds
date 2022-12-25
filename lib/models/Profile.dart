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

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Profile type in your schema. */
@immutable
class Profile {
  final String? _firstName;
  final String? _lastName;
  final TemporalDate? _dateOfBirth;
  final Gender? _gender;
  final City? _location;
  final UserGym? _gym;
  final List<String>? _friends;

  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  TemporalDate? get dateOfBirth {
    return _dateOfBirth;
  }
  
  Gender? get gender {
    return _gender;
  }
  
  City? get location {
    return _location;
  }
  
  UserGym? get gym {
    return _gym;
  }
  
  List<String>? get friends {
    return _friends;
  }
  
  const Profile._internal({firstName, lastName, dateOfBirth, gender, location, gym, friends}): _firstName = firstName, _lastName = lastName, _dateOfBirth = dateOfBirth, _gender = gender, _location = location, _gym = gym, _friends = friends;
  
  factory Profile({String? firstName, String? lastName, TemporalDate? dateOfBirth, Gender? gender, City? location, UserGym? gym, List<String>? friends}) {
    return Profile._internal(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      location: location,
      gym: gym,
      friends: friends != null ? List<String>.unmodifiable(friends) : friends);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _dateOfBirth == other._dateOfBirth &&
      _gender == other._gender &&
      _location == other._location &&
      _gym == other._gym &&
      DeepCollectionEquality().equals(_friends, other._friends);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("dateOfBirth=" + (_dateOfBirth != null ? _dateOfBirth!.format() : "null") + ", ");
    buffer.write("gender=" + (_gender != null ? enumToString(_gender)! : "null") + ", ");
    buffer.write("location=" + (_location != null ? enumToString(_location)! : "null") + ", ");
    buffer.write("gym=" + (_gym != null ? _gym!.toString() : "null") + ", ");
    buffer.write("friends=" + (_friends != null ? _friends!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({String? firstName, String? lastName, TemporalDate? dateOfBirth, Gender? gender, City? location, UserGym? gym, List<String>? friends}) {
    return Profile._internal(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      gym: gym ?? this.gym,
      friends: friends ?? this.friends);
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : _firstName = json['firstName'],
      _lastName = json['lastName'],
      _dateOfBirth = json['dateOfBirth'] != null ? TemporalDate.fromString(json['dateOfBirth']) : null,
      _gender = enumFromString<Gender>(json['gender'], Gender.values),
      _location = enumFromString<City>(json['location'], City.values),
      _gym = json['gym']?['serializedData'] != null
        ? UserGym.fromJson(new Map<String, dynamic>.from(json['gym']['serializedData']))
        : null,
      _friends = json['friends']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'firstName': _firstName, 'lastName': _lastName, 'dateOfBirth': _dateOfBirth?.format(), 'gender': enumToString(_gender), 'location': enumToString(_location), 'gym': _gym?.toJson(), 'friends': _friends
  };
  
  Map<String, Object?> toMap() => {
    'firstName': _firstName, 'lastName': _lastName, 'dateOfBirth': _dateOfBirth, 'gender': _gender, 'location': _location, 'gym': _gym, 'friends': _friends
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'firstName',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'lastName',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'dateOfBirth',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'gender',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'location',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'gym',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'UserGym')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'friends',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}