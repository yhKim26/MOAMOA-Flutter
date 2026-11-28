// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_reads_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeReadsInfo {

 int get readCount; int get totalCount; List<NoticeReadMemberModel> get readMembers; List<NoticeReadMemberModel> get unreadMembers;
/// Create a copy of NoticeReadsInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeReadsInfoCopyWith<NoticeReadsInfo> get copyWith => _$NoticeReadsInfoCopyWithImpl<NoticeReadsInfo>(this as NoticeReadsInfo, _$identity);

  /// Serializes this NoticeReadsInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticeReadsInfo&&(identical(other.readCount, readCount) || other.readCount == readCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.readMembers, readMembers)&&const DeepCollectionEquality().equals(other.unreadMembers, unreadMembers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readCount,totalCount,const DeepCollectionEquality().hash(readMembers),const DeepCollectionEquality().hash(unreadMembers));

@override
String toString() {
  return 'NoticeReadsInfo(readCount: $readCount, totalCount: $totalCount, readMembers: $readMembers, unreadMembers: $unreadMembers)';
}


}

/// @nodoc
abstract mixin class $NoticeReadsInfoCopyWith<$Res>  {
  factory $NoticeReadsInfoCopyWith(NoticeReadsInfo value, $Res Function(NoticeReadsInfo) _then) = _$NoticeReadsInfoCopyWithImpl;
@useResult
$Res call({
 int readCount, int totalCount, List<NoticeReadMemberModel> readMembers, List<NoticeReadMemberModel> unreadMembers
});




}
/// @nodoc
class _$NoticeReadsInfoCopyWithImpl<$Res>
    implements $NoticeReadsInfoCopyWith<$Res> {
  _$NoticeReadsInfoCopyWithImpl(this._self, this._then);

  final NoticeReadsInfo _self;
  final $Res Function(NoticeReadsInfo) _then;

/// Create a copy of NoticeReadsInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readCount = null,Object? totalCount = null,Object? readMembers = null,Object? unreadMembers = null,}) {
  return _then(NoticeReadsInfo(
readCount: null == readCount ? _self.readCount : readCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,readMembers: null == readMembers ? _self.readMembers : readMembers // ignore: cast_nullable_to_non_nullable
as List<NoticeReadMemberModel>,unreadMembers: null == unreadMembers ? _self.unreadMembers : unreadMembers // ignore: cast_nullable_to_non_nullable
as List<NoticeReadMemberModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticeReadsInfo].
extension NoticeReadsInfoPatterns on NoticeReadsInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticeReadsInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticeReadsInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticeReadsInfo value)  $default,){
final _that = this;
switch (_that) {
case _NoticeReadsInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticeReadsInfo value)?  $default,){
final _that = this;
switch (_that) {
case _NoticeReadsInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int readCount,  int totalCount,  List<NoticeReadMemberModel> readMembers,  List<NoticeReadMemberModel> unreadMembers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticeReadsInfo() when $default != null:
return $default(_that.readCount,_that.totalCount,_that.readMembers,_that.unreadMembers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int readCount,  int totalCount,  List<NoticeReadMemberModel> readMembers,  List<NoticeReadMemberModel> unreadMembers)  $default,) {final _that = this;
switch (_that) {
case _NoticeReadsInfo():
return $default(_that.readCount,_that.totalCount,_that.readMembers,_that.unreadMembers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int readCount,  int totalCount,  List<NoticeReadMemberModel> readMembers,  List<NoticeReadMemberModel> unreadMembers)?  $default,) {final _that = this;
switch (_that) {
case _NoticeReadsInfo() when $default != null:
return $default(_that.readCount,_that.totalCount,_that.readMembers,_that.unreadMembers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoticeReadsInfo implements NoticeReadsInfo {
  const _NoticeReadsInfo({required this.readCount, required this.totalCount, required  List<NoticeReadMemberModel> readMembers, required  List<NoticeReadMemberModel> unreadMembers}): _readMembers = readMembers,_unreadMembers = unreadMembers;
  factory _NoticeReadsInfo.fromJson(Map<String, dynamic> json) => _$NoticeReadsInfoFromJson(json);

@override final  int readCount;
@override final  int totalCount;
 final  List<NoticeReadMemberModel> _readMembers;
@override List<NoticeReadMemberModel> get readMembers {
  if (_readMembers is EqualUnmodifiableListView) return _readMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readMembers);
}

 final  List<NoticeReadMemberModel> _unreadMembers;
@override List<NoticeReadMemberModel> get unreadMembers {
  if (_unreadMembers is EqualUnmodifiableListView) return _unreadMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unreadMembers);
}


/// Create a copy of NoticeReadsInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeReadsInfoCopyWith<_NoticeReadsInfo> get copyWith => __$NoticeReadsInfoCopyWithImpl<_NoticeReadsInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticeReadsInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeReadsInfo&&(identical(other.readCount, readCount) || other.readCount == readCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._readMembers, _readMembers)&&const DeepCollectionEquality().equals(other._unreadMembers, _unreadMembers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readCount,totalCount,const DeepCollectionEquality().hash(_readMembers),const DeepCollectionEquality().hash(_unreadMembers));

@override
String toString() {
  return 'NoticeReadsInfo(readCount: $readCount, totalCount: $totalCount, readMembers: $readMembers, unreadMembers: $unreadMembers)';
}


}

/// @nodoc
abstract mixin class _$NoticeReadsInfoCopyWith<$Res> implements $NoticeReadsInfoCopyWith<$Res> {
  factory _$NoticeReadsInfoCopyWith(_NoticeReadsInfo value, $Res Function(_NoticeReadsInfo) _then) = __$NoticeReadsInfoCopyWithImpl;
@override @useResult
$Res call({
 int readCount, int totalCount, List<NoticeReadMemberModel> readMembers, List<NoticeReadMemberModel> unreadMembers
});




}
/// @nodoc
class __$NoticeReadsInfoCopyWithImpl<$Res>
    implements _$NoticeReadsInfoCopyWith<$Res> {
  __$NoticeReadsInfoCopyWithImpl(this._self, this._then);

  final _NoticeReadsInfo _self;
  final $Res Function(_NoticeReadsInfo) _then;

/// Create a copy of NoticeReadsInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readCount = null,Object? totalCount = null,Object? readMembers = null,Object? unreadMembers = null,}) {
  return _then(_NoticeReadsInfo(
readCount: null == readCount ? _self.readCount : readCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,readMembers: null == readMembers ? _self._readMembers : readMembers // ignore: cast_nullable_to_non_nullable
as List<NoticeReadMemberModel>,unreadMembers: null == unreadMembers ? _self._unreadMembers : unreadMembers // ignore: cast_nullable_to_non_nullable
as List<NoticeReadMemberModel>,
  ));
}


}

// dart format on
