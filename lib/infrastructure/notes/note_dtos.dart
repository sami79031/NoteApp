import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_taking_app/domain/core/value.objects.dart';
import 'package:note_taking_app/domain/notes/todo_item.dart';
import 'package:note_taking_app/domain/notes/value_objects.dart';

part 'note_dtos.freezed.dart';

part 'note_dtos.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {

  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todos,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => _NoteDtoFromJson(json);
}


@freezed
abstract class TodoItemDto implements _$TodoItemDto {

  const TodoItemDto._();

  const factory TodoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
        id: todoItem.id.getOrCrash(),
        name: todoItem.name.getOrCrash(),
        done: todoItem.done);
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueID.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) => _TodoItemDtoFromJson(json);

}
