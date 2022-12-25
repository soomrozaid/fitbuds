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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the UserGym type in your schema. */
@immutable
class UserGym {
  final String? _gymId;
  final String? _location;
  final String? _membershipPlan;

  String? get gymId {
    return _gymId;
  }
  
  String? get location {
    return _location;
  }
  
  String? get membershipPlan {
    return _membershipPlan;
  }
  
  const UserGym._internal({gymId, location, membershipPlan}): _gymId = gymId, _location = location, _membershipPlan = membershipPlan;
  
  factory UserGym({String? gymId, String? location, String? membershipPlan}) {
    return UserGym._internal(
      gymId: gymId,
      location: location,
      membershipPlan: membershipPlan);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserGym &&
      _gymId == other._gymId &&
      _location == other._location &&
      _membershipPlan == other._membershipPlan;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserGym {");
    buffer.write("gymId=" + "$_gymId" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("membershipPlan=" + "$_membershipPlan");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserGym copyWith({String? gymId, String? location, String? membershipPlan}) {
    return UserGym._internal(
      gymId: gymId ?? this.gymId,
      location: location ?? this.location,
      membershipPlan: membershipPlan ?? this.membershipPlan);
  }
  
  UserGym.fromJson(Map<String, dynamic> json)  
    : _gymId = json['gymId'],
      _location = json['location'],
      _membershipPlan = json['membershipPlan'];
  
  Map<String, dynamic> toJson() => {
    'gymId': _gymId, 'location': _location, 'membershipPlan': _membershipPlan
  };
  
  Map<String, Object?> toMap() => {
    'gymId': _gymId, 'location': _location, 'membershipPlan': _membershipPlan
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserGym";
    modelSchemaDefinition.pluralName = "UserGyms";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'gymId',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'location',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'membershipPlan',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}