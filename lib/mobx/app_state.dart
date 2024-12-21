import 'package:mobx/mobx.dart';
part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  // Состояние для акций
  @observable
  ObservableList<String> promotions = ObservableList<String>();

  // Состояние загрузки
  @observable
  bool isLoading = false; // Состояние загрузки

  // Добавление акции
  @action
  Future<void> addPromotion(String promotion) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); // Эмуляция задержки
    promotions.add(promotion); // Добавление новой акции
    isLoading = false;
  }

  // Удаление акции
  @action
  Future<void> removePromotion(String promotion) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1)); // Эмуляция задержки
    promotions.remove(promotion); // Удаление акции
    isLoading = false;
  }

  // Загрузка данных акций
  @action
  Future<void> loadPromotions() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2)); // Симуляция задержки
    promotions.addAll(['Скидка 20%', 'Подарок при покупке', '1+1=3']);
    isLoading = false;
  }
}