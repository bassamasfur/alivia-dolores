import 'package:flutter/material.dart';

class Categoria {
  final String id;
  final String nombre;
  final String descripcion;
  final IconData icono;
  final Color color;
  final String emoji;

  Categoria({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.icono,
    required this.color,
    required this.emoji,
  });
}

// Categorías disponibles
final List<Categoria> categorias = [
  Categoria(
    id: 'Digestivo',
    nombre: 'Digestivo',
    descripcion: 'Molestias del sistema digestivo',
    icono: Icons.restaurant,
    color: const Color(0xFFFFE4CC),
    emoji: '🍽️',
  ),
  Categoria(
    id: 'Respiratorio',
    nombre: 'Respiratorio',
    descripcion: 'Molestias respiratorias',
    icono: Icons.air,
    color: const Color(0xFFD4F5FF),
    emoji: '🫁',
  ),
  Categoria(
    id: 'Dolor y Musculatura',
    nombre: 'Dolor y Musculatura',
    descripcion: 'Dolores musculares y articulares',
    icono: Icons.fitness_center,
    color: const Color(0xFFFFDED4),
    emoji: '💪',
  ),
  Categoria(
    id: 'Neurológico y Bienestar Mental',
    nombre: 'Neurológico y Mental',
    descripcion: 'Bienestar mental y neurológico',
    icono: Icons.psychology,
    color: const Color(0xFFE8EAF6),
    emoji: '🧠',
  ),
  Categoria(
    id: 'Cardiovascular y Metabólico',
    nombre: 'Cardiovascular',
    descripcion: 'Salud cardiovascular y metabólica',
    icono: Icons.favorite,
    color: const Color(0xFFFFCDD2),
    emoji: '❤️',
  ),
  Categoria(
    id: 'Piel y Otros',
    nombre: 'Piel y Otros',
    descripcion: 'Cuidado de la piel y más',
    icono: Icons.health_and_safety,
    color: const Color(0xFFF8BBD0),
    emoji: '🩹',
  ),
];
