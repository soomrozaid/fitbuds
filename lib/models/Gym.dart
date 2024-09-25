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


/** This is an auto generated class representing the Gym type in your schema. */
class Gym extends amplify_core.Model {
  static const classType = const _GymModelType();
  final String id;
  final String? _name;
  final List<String>? _locations;
  final String? _website;
  final String? _contact;
  final List<Equipment>? _equipment;
  final List<String>? _membershipsPlans;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  List<String>? get locations {
    return _locations;
  }
  
  String? get website {
    return _website;
  }
  
  String? get contact {
    return _contact;
  }
  
  List<Equipment>? get equipment {
    return _equipment;
  }
  
  List<String>? get membershipsPlans {
    return _membershipsPlans;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Gym._internal({required this.id, name, locations, website, contact, equipment, membershipsPlans, createdAt, updatedAt}): _name = name, _locations = locations, _website = website, _contact = contact, _equipment = equipment, _membershipsPlans = membershipsPlans, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Gym({String? id, String? name, List<String>? locations, String? website, String? contact, List<Equipment>? equipment, List<String>? membershipsPlans}) {
    return Gym._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      locations: locations != null ? List<String>.unmodifiable(locations) : locations,
      website: website,
      contact: contact,
      equipment: equipment != null ? List<Equipment>.unmodifiable(equipment) : equipment,
      membershipsPlans: membershipsPlans != null ? List<String>.unmodifiable(membershipsPlans) : membershipsPlans);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gym &&
      id == other.id &&
      _name == other._name &&
      DeepCollectionEquality().equals(_locations, other._locations) &&
      _website == other._website &&
      _contact == other._contact &&
      DeepCollectionEquality().equals(_equipment, other._equipment) &&
      DeepCollectionEquality().equals(_membershipsPlans, other._membershipsPlans);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Gym {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("locations=" + (_locations != null ? _locations!.toString() : "null") + ", ");
    buffer.write("website=" + "$_website" + ", ");
    buffer.write("contact=" + "$_contact" + ", ");
    buffer.write("equipment=" + (_equipment != null ? _equipment!.map((e) => amplify_core.enumToString(e)).toString() : "null") + ", ");
    buffer.write("membershipsPlans=" + (_membershipsPlans != null ? _membershipsPlans!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Gym copyWith({String? id, String? name, List<String>? locations, String? website, String? contact, List<Equipment>? equipment, List<String>? membershipsPlans}) {
    return Gym._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      locations: locations ?? this.locations,
      website: website ?? this.website,
      contact: contact ?? this.contact,
      equipment: equipment ?? this.equipment,
      membershipsPlans: membershipsPlans ?? this.membershipsPlans);
  }
  
  Gym copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? name,
    ModelFieldValue<List<String>?>? locations,
    ModelFieldValue<String?>? website,
    ModelFieldValue<String?>? contact,
    ModelFieldValue<List<Equipment>?>? equipment,
    ModelFieldValue<List<String>?>? membershipsPlans
  }) {
    return Gym._internal(
      id: id == null ? this.id : id.value,
      name: name == null ? this.name : name.value,
      locations: locations == null ? this.locations : locations.value,
      website: website == null ? this.website : website.value,
      contact: contact == null ? this.contact : contact.value,
      equipment: equipment == null ? this.equipment : equipment.value,
      membershipsPlans: membershipsPlans == null ? this.membershipsPlans : membershipsPlans.value
    );
  }
  
  Gym.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _locations = json['locations']?.cast<String>(),
      _website = json['website'],
      _contact = json['contact'],
      _equipment = json['equipment'] is List
        ? (json['equipment'] as List)
          .map((e) => amplify_core.enumFromString<Equipment>(e, Equipment.values)!)
          .toList()
        : null,
      _membershipsPlans = json['membershipsPlans']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'locations': _locations, 'website': _website, 'contact': _contact, 'equipment': _equipment?.map((e) => amplify_core.enumToString(e)).toList(), 'membershipsPlans': _membershipsPlans, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'locations': _locations,
    'website': _website,
    'contact': _contact,
    'equipment': _equipment,
    'membershipsPlans': _membershipsPlans,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final LOCATIONS = amplify_core.QueryField(fieldName: "locations");
  static final WEBSITE = amplify_core.QueryField(fieldName: "website");
  static final CONTACT = amplify_core.QueryField(fieldName: "contact");
  static final EQUIPMENT = amplify_core.QueryField(fieldName: "equipment");
  static final MEMBERSHIPSPLANS = amplify_core.QueryField(fieldName: "membershipsPlans");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Gym";
    modelSchemaDefinition.pluralName = "Gyms";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.LOCATIONS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.WEBSITE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.CONTACT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.EQUIPMENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.enumeration.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Gym.MEMBERSHIPSPLANS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
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

class _GymModelType extends amplify_core.ModelType<Gym> {
  const _GymModelType();
  
  @override
  Gym fromJson(Map<String, dynamic> jsonData) {
    return Gym.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Gym';
  }
}