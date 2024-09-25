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


/** This is an auto generated class representing the ActivityLog type in your schema. */
class ActivityLog {
  final String id;
  final ActivityType? _type;
  final String? _desc;
  final amplify_core.TemporalDateTime? _timestamp;

  ActivityType? get type {
    return _type;
  }
  
  String? get desc {
    return _desc;
  }
  
  amplify_core.TemporalDateTime? get timestamp {
    return _timestamp;
  }
  
  const ActivityLog._internal({required this.id, type, desc, timestamp}): _type = type, _desc = desc, _timestamp = timestamp;
  
  factory ActivityLog({String? id, ActivityType? type, String? desc, amplify_core.TemporalDateTime? timestamp}) {
    return ActivityLog._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      type: type,
      desc: desc,
      timestamp: timestamp);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityLog &&
      id == other.id &&
      _type == other._type &&
      _desc == other._desc &&
      _timestamp == other._timestamp;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ActivityLog {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("type=" + (_type != null ? amplify_core.enumToString(_type)! : "null") + ", ");
    buffer.write("desc=" + "$_desc" + ", ");
    buffer.write("timestamp=" + (_timestamp != null ? _timestamp!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ActivityLog copyWith({String? id, ActivityType? type, String? desc, amplify_core.TemporalDateTime? timestamp}) {
    return ActivityLog._internal(
      id: id ?? this.id,
      type: type ?? this.type,
      desc: desc ?? this.desc,
      timestamp: timestamp ?? this.timestamp);
  }
  
  ActivityLog copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<ActivityType?>? type,
    ModelFieldValue<String?>? desc,
    ModelFieldValue<amplify_core.TemporalDateTime?>? timestamp
  }) {
    return ActivityLog._internal(
      id: id == null ? this.id : id.value,
      type: type == null ? this.type : type.value,
      desc: desc == null ? this.desc : desc.value,
      timestamp: timestamp == null ? this.timestamp : timestamp.value
    );
  }
  
  ActivityLog.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _type = amplify_core.enumFromString<ActivityType>(json['type'], ActivityType.values),
      _desc = json['desc'],
      _timestamp = json['timestamp'] != null ? amplify_core.TemporalDateTime.fromString(json['timestamp']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'type': amplify_core.enumToString(_type), 'desc': _desc, 'timestamp': _timestamp?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'type': _type,
    'desc': _desc,
    'timestamp': _timestamp
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ActivityLog";
    modelSchemaDefinition.pluralName = "ActivityLogs";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'desc',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'timestamp',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}