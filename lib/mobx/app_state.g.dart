// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$promotionsAtom =
      Atom(name: '_AppState.promotions', context: context);

  @override
  ObservableList<String> get promotions {
    _$promotionsAtom.reportRead();
    return super.promotions;
  }

  @override
  set promotions(ObservableList<String> value) {
    _$promotionsAtom.reportWrite(value, super.promotions, () {
      super.promotions = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AppState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addPromotionAsyncAction =
      AsyncAction('_AppState.addPromotion', context: context);

  @override
  Future<void> addPromotion(String promotion) {
    return _$addPromotionAsyncAction.run(() => super.addPromotion(promotion));
  }

  late final _$removePromotionAsyncAction =
      AsyncAction('_AppState.removePromotion', context: context);

  @override
  Future<void> removePromotion(String promotion) {
    return _$removePromotionAsyncAction
        .run(() => super.removePromotion(promotion));
  }

  late final _$loadPromotionsAsyncAction =
      AsyncAction('_AppState.loadPromotions', context: context);

  @override
  Future<void> loadPromotions() {
    return _$loadPromotionsAsyncAction.run(() => super.loadPromotions());
  }

  @override
  String toString() {
    return '''
promotions: ${promotions},
isLoading: ${isLoading}
    ''';
  }
}
