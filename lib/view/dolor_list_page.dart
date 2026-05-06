import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/dolor_controller.dart';
import 'dolor_detail_page.dart';
import 'info_page.dart';

class DolorListPage extends StatefulWidget {
  final String? categoria;

  const DolorListPage({super.key, this.categoria});

  @override
  State<DolorListPage> createState() => _DolorListPageState();
}

class _DolorListPageState extends State<DolorListPage> {
  @override
  void initState() {
    super.initState();
    // Cargar dolencias al iniciar la página
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DolorController>(context, listen: false).cargarDolencias();
    });
  }

  // Obtener emoji específico según el tipo de dolencia
  String _getEmojiForDolencia(String id) {
    switch (id) {
      // IDs actualizados (mantienen funcionalidad)
      case 'acidez-estomacal':
        return '🔥';
      case 'alergia-estacional':
        return '🌸';
      case 'ansiedad-leve':
        return '😰';
      case 'calambres-nocturnos':
        return '🦵';
      case 'colesterol-alto':
        return '❤️';
      case 'diarrea-leve':
        return '💧';
      case 'dolor-de-articulaciones':
        return '🦴';
      case 'dolor-de-cabeza-tensional':
        return '🤕';
      case 'dolor-de-garganta':
        return '🗣️';
      case 'dolor-dental-leve':
        return '🦷';
      case 'dolor-lumbar':
        return '🔙';
      case 'dolor-menstrual':
        return '🩸';
      case 'dolor-muscular-post-ejercicio':
        return '💪';
      case 'estrenimiento':
        return '🚽';
      case 'fatiga':
        return '😴';
      case 'hemorroides':
        return '🔴';
      case 'herpes-labial':
        return '👄';
      case 'hinchazon-abdominal':
        return '🫃';
      case 'infeccion-urinaria-leve':
        return '💦';
      case 'insomnio':
        return '🌙';
      case 'mal-aliento':
        return '😮';
      case 'mareos-leves':
        return '😵';
      case 'migrana':
        return '⚡';
      case 'nauseas':
        return '🤢';
      case 'presion-arterial-alta':
        return '🩺';
      case 'quemadura-solar-leve':
        return '☀️';
      case 'resaca':
        return '🍺';
      case 'resfriado-comun':
        return '🤧';
      case 'retencion-de-liquidos':
        return '💧';
      case 'tos-seca':
        return '🫁';
      default:
        return '💊';
    }
  }

  // Obtener color de fondo según el tipo de dolencia
  Color _getColorForDolencia(String id) {
    switch (id) {
      // IDs actualizados y nuevas dolencias
      case 'acidez-estomacal':
        return const Color(0xFFFFE4CC);
      case 'alergia-estacional':
        return const Color(0xFFFFF3E0);
      case 'ansiedad-leve':
        return const Color(0xFFFFF3CC);
      case 'calambres-nocturnos':
        return const Color(0xFFFFDED4);
      case 'colesterol-alto':
        return const Color(0xFFFFCDD2);
      case 'diarrea-leve':
        return const Color(0xFFE1F5FE);
      case 'dolor-de-articulaciones':
        return const Color(0xFFFFE5D4);
      case 'dolor-de-cabeza-tensional':
        return const Color(0xFFD4E4FF);
      case 'dolor-de-garganta':
        return const Color(0xFFD4E7FF);
      case 'dolor-dental-leve':
        return const Color(0xFFE4DAFF);
      case 'dolor-lumbar':
        return const Color(0xFFFFECB3);
      case 'dolor-menstrual':
        return const Color(0xFFFFD4E7);
      case 'dolor-muscular-post-ejercicio':
        return const Color(0xFFFFE4CC);
      case 'estrenimiento':
        return const Color(0xFFE5F3FF);
      case 'fatiga':
        return const Color(0xFFFFF9D4);
      case 'hemorroides':
        return const Color(0xFFFFE0B2);
      case 'herpes-labial':
        return const Color(0xFFF8BBD0);
      case 'hinchazon-abdominal':
        return const Color(0xFFD4FFE7);
      case 'infeccion-urinaria-leve':
        return const Color(0xFFE0F7FA);
      case 'insomnio':
        return const Color(0xFFE8EAF6);
      case 'mal-aliento':
        return const Color(0xFFDCEDC8);
      case 'mareos-leves':
        return const Color(0xFFF3E5F5);
      case 'migrana':
        return const Color(0xFFFFE082);
      case 'nauseas':
        return const Color(0xFFE5FFE4);
      case 'presion-arterial-alta':
        return const Color(0xFFFFCCBC);
      case 'quemadura-solar-leve':
        return const Color(0xFFFFE0B2);
      case 'resaca':
        return const Color(0xFFD4E7FF);
      case 'resfriado-comun':
        return const Color(0xFFD4F5FF);
      case 'retencion-de-liquidos':
        return const Color(0xFFB3E5FC);
      case 'tos-seca':
        return const Color(0xFFE1BEE7);
      default:
        return const Color(0xFFE8E8FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DolorController>(context);
    // Filtrar dolores por categoría si se especificó
    final dolores = widget.categoria != null
        ? controller.dolores
              .where((dolor) => dolor.categoria == widget.categoria)
              .toList()
        : controller.dolores;
    final isLoading = controller.isLoading;
    final error = controller.error;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6D5BFF), Color(0xFF46C2CB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 90,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'AliviaDol',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF6D5BFF),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.categoria ?? 'Malestares cotidianos',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF2D2D2D),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white.withValues(alpha: 0.85),
          elevation: 8,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : error != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        error,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.cargarDolencias();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reintentar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6D5BFF),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : dolores.isEmpty
            ? const Center(
                child: Text(
                  'No hay información disponible',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Grid de dolencias
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: dolores.map((dolor) {
                          final screenWidth = MediaQuery.of(context).size.width;
                          final itemWidth = (screenWidth - 32 - 24) / 3;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DolorDetailPage(dolor: dolor),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: itemWidth,
                              height: itemWidth * 1.25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Emoji grande en contenedor de color
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: _getColorForDolencia(dolor.id),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _getEmojiForDolencia(dolor.id),
                                        style: const TextStyle(fontSize: 34),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Nombre de la dolencia
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: Text(
                                      dolor.nombre,
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.5,
                                        color: Color(0xFF2D2D2D),
                                        height: 1.2,
                                      ),
                                      textAlign: TextAlign.justify,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Botón de información
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFFF5F5F5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const InfoPage(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFF6D5BFF,
                                    ).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.info_outline,
                                    color: Color(0xFF6D5BFF),
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Información importante',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFF6D5BFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
