import 'package:flutter/material.dart';
import '../model/dolor_model.dart';
import '../services/dolor_service.dart';

class DolorController extends ChangeNotifier {
  final DolorService _service = DolorService();
  List<Dolor> _dolores = [];
  bool _isLoading = false;
  String? _error;

  List<Dolor> get dolores => _dolores;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> cargarDolencias() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dolores = await _service.obtenerDolencias();
      _error = null;
    } catch (e) {
      _error = 'Error al cargar las dolencias. Por favor, intenta nuevamente.';
      _dolores = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
