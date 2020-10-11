/// Abstract class to implement mappers like network mapper or database mapper
/// E -> Entity , M -> Model
abstract class Mapper<E, M> {
  M mapEntityToModel(E entity);

  E mapModelToEntity(M model);
}
