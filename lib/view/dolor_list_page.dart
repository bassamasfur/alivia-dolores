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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _mostrarDisclaimerDialog(context),
          icon: const Icon(Icons.info_outline, size: 22),
          label: const Text(
            'Información',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF6D5BFF),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _mostrarDisclaimerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header con degradado
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6D5BFF), Color(0xFF46C2CB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.medical_information_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AliviaDol',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Información importante',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              // Contenido scrolleable
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Disclaimer médico
                      _buildDialogSection(
                        icon: Icons.medical_information_outlined,
                        iconColor: const Color(0xFF6D5BFF),
                        backgroundColor: const Color(0xFFF5F5F5),
                        borderColor: const Color(0xFFBDBDBD),
                        title: 'Información importante',
                        content:
                            'Este contenido es informativo y complementario. Las sugerencias nutricionales aquí presentadas NO sustituyen el diagnóstico, tratamiento o consejo de un profesional de la salud. Siempre consulta a tu médico antes de realizar cambios en tu dieta o rutina, especialmente si tienes condiciones médicas preexistentes.',
                      ),
                      const SizedBox(height: 16),
                      // Fuentes de información
                      _buildDialogSection(
                        icon: Icons.menu_book_rounded,
                        iconColor: const Color(0xFF1976D2),
                        backgroundColor: const Color(0xFFE3F2FD),
                        borderColor: const Color(0xFF42A5F5),
                        title: 'Fuentes de información',
                        content:
                            'Las sugerencias nutricionales están basadas en información de instituciones médicas reconocidas internacionalmente:\n\n'
                            '🏥 Mayo Clinic (Estados Unidos)\n'
                            'Organización médica sin fines de lucro. Una de las instituciones más prestigiosas del mundo.\n'
                            'Web: mayoclinic.org\n\n'
                            '🎓 Harvard Health Publishing\n'
                            'Publicaciones de la Escuela de Medicina de Harvard. Divulgación científica basada en evidencia.\n'
                            'Web: health.harvard.edu\n\n'
                            '🏛️ NHS (National Health Service, Reino Unido)\n'
                            'Servicio Nacional de Salud británico. Sistema público con guías clínicas oficiales.\n'
                            'Web: nhs.uk',
                      ),
                      const SizedBox(height: 16),
                      // Consejos de bienestar
                      _buildDialogSection(
                        icon: Icons.favorite_rounded,
                        iconColor: const Color(0xFF66BB6A),
                        backgroundColor: const Color(0xFFE8F5E9),
                        borderColor: const Color(0xFF81C784),
                        title: 'Para tu bienestar general',
                        content:
                            '💧 Mantén una hidratación adecuada (2-3 litros de agua al día)\n\n'
                            '😴 Duerme 7-8 horas diarias para una recuperación óptima\n\n'
                            '🏃 Realiza actividad física moderada regularmente\n\n'
                            '🧘 Gestiona el estrés con técnicas de relajación',
                      ),
                    ],
                  ),
                ),
              ),
              // Footer
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.verified_outlined,
                      color: Color(0xFF6D5BFF),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: const Text(
                        'Información verificada y respaldada por la comunidad médica',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 11,
                          color: Color(0xFF424242),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogSection({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Color borderColor,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor.withOpacity(0.4), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: Color(0xFF424242),
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
