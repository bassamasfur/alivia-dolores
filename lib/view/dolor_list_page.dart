import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/dolor_controller.dart';
import 'dolor_detail_page.dart';

class DolorListPage extends StatefulWidget {
  const DolorListPage({super.key});

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
      case 'acidez-reflujo':
        return '🔥';
      case 'ansiedad-nervios-en-guata':
        return '😰';
      case 'calambres-nocturnos':
        return '🦵';
      case 'cana-resaca':
        return '🍺';
      case 'dolor-de-articulaciones':
        return '🦴';
      case 'dolor-de-cabeza-tensional':
        return '🤕';
      case 'dolor-de-garganta':
        return '🗣️';
      case 'dolor-de-muela-leve-esperando-dentista':
        return '🦷';
      case 'dolor-menstrual-colicos':
        return '🩸';
      case 'dolor-muscular-post-gym':
        return '💪';
      case 'estrenimiento':
        return '🚽';
      case 'fatiga-falta-energia':
        return '😴';
      case 'hinchazon-abdominal-gases':
        return '🫃';
      case 'nauseas-malestar-estomago':
        return '🤢';
      case 'resfrio-congestion':
        return '🤧';
      default:
        return '💊';
    }
  }

  // Obtener color de fondo según el tipo de dolencia
  Color _getColorForDolencia(String id) {
    switch (id) {
      case 'acidez-reflujo':
        return const Color(0xFFFFE4CC);
      case 'ansiedad-nervios-en-guata':
        return const Color(0xFFFFF3CC);
      case 'calambres-nocturnos':
        return const Color(0xFFFFDED4);
      case 'cana-resaca':
        return const Color(0xFFD4E7FF);
      case 'dolor-de-articulaciones':
        return const Color(0xFFFFE5D4);
      case 'dolor-de-cabeza-tensional':
        return const Color(0xFFD4E4FF);
      case 'dolor-de-garganta':
        return const Color(0xFFD4E7FF);
      case 'dolor-de-muela-leve-esperando-dentista':
        return const Color(0xFFE4DAFF);
      case 'dolor-menstrual-colicos':
        return const Color(0xFFFFD4E7);
      case 'dolor-muscular-post-gym':
        return const Color(0xFFFFE4CC);
      case 'estrenimiento':
        return const Color(0xFFE5F3FF);
      case 'fatiga-falta-energia':
        return const Color(0xFFFFF9D4);
      case 'hinchazon-abdominal-gases':
        return const Color(0xFFD4FFE7);
      case 'nauseas-malestar-estomago':
        return const Color(0xFFE5FFE4);
      case 'resfrio-congestion':
        return const Color(0xFFD4F5FF);
      default:
        return const Color(0xFFE8E8FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DolorController>(context);
    final dolores = controller.dolores;
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
            children: const [
              Text(
                'AliviaDol',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF6D5BFF),
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Dolencias comunes',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF2D2D2D),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white.withOpacity(0.85),
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
                  'No hay dolencias disponibles',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.80,
                ),
                itemCount: dolores.length,
                itemBuilder: (context, index) {
                  final dolor = dolores[index];
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
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
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              dolor.nombre,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 11.5,
                                color: Color(0xFF2D2D2D),
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
