import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sistema_peccioli_2/responses/home_response.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final HomeResponse? response;

  HomeLoadedState(this.response);

  @override
  List<Object?> get props => [response];
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
