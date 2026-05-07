import 'package:flutter/material.dart';
import '../model/dolor_model.dart';
import '../services/dolor_service.dart';

class DolorController extends ChangeNotifier {
  final DolorService _service = DolorService();
  List<Dolor> _dolores = [];
  bool _isLoading = false;
  String? _error;
  bool _isDataLoaded = false;

  List<Dolor> get dolores => _dolores;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isDataLoaded => _isDataLoaded;

  Future<void> cargarDolencias({bool forceReload = false}) async {
    // Si ya hay datos y no es recarga forzada, no hacer nada
    if (_isDataLoaded && !forceReload) {
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dolores = await _service.obtenerDolencias();
      _error = null;
      _isDataLoaded = true;
    } catch (e) {
      _error = 'Error al cargar las dolencias. Por favor, intenta nuevamente.';
      _dolores = [];
      _isDataLoaded = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
