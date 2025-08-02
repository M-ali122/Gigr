abstract class EarnEvent {}

class FetchSkills extends EarnEvent {}

class DeleteSkill extends EarnEvent {
  final int id;
  DeleteSkill(this.id);
}
