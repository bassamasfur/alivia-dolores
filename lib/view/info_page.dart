import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF5F7FA), Color(0xFFE8EAF6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Información',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF6D5BFF),
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header principal
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEEE9FF), Color(0xFFE3F7FA)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF6D5BFF).withValues(alpha: 0.2),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6D5BFF).withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF6D5BFF,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.medical_information_rounded,
                          color: Color(0xFF6D5BFF),
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AliviaDol',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFF6D5BFF),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Información importante sobre el uso de la aplicación',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: Color(0xFF424242),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Disclaimer informativo
                _buildInfoSection(
                  icon: Icons.info_outline,
                  iconColor: const Color(0xFF6D5BFF),
                  backgroundColor: const Color(0xFFF5F5F5),
                  borderColor: const Color(0xFFBDBDBD),
                  title: 'Solo información general',
                  content:
                      'Esta aplicación proporciona información nutricional general de carácter educativo. NO es una aplicación médica y NO proporciona diagnósticos, tratamientos ni consejos médicos profesionales. La información presentada está basada en fuentes públicas reconocidas. Siempre consulta a un profesional de la salud calificado para cualquier condición médica o antes de realizar cambios significativos en tu dieta.',
                ),

                const SizedBox(height: 16),

                // Fuentes de información
                _buildInfoSection(
                  icon: Icons.menu_book_rounded,
                  iconColor: const Color(0xFF1976D2),
                  backgroundColor: const Color(0xFFE3F2FD),
                  borderColor: const Color(0xFF42A5F5),
                  title: 'Fuentes de información',
                  content: '',
                  customContent: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Las sugerencias nutricionales están basadas en información de instituciones médicas reconocidas internacionalmente:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Color(0xFF424242),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSourceItem(
                        emoji: '🏥',
                        title: 'Mayo Clinic',
                        subtitle: 'Estados Unidos',
                        description:
                            'Organización médica sin fines de lucro. Una de las instituciones más prestigiosas del mundo en investigación y práctica clínica.',
                        website: 'mayoclinic.org',
                      ),
                      const SizedBox(height: 12),
                      _buildSourceItem(
                        emoji: '🎓',
                        title: 'Harvard Health Publishing',
                        subtitle: 'Universidad de Harvard',
                        description:
                            'Publicaciones de la Escuela de Medicina de Harvard. Divulgación científica basada en evidencia.',
                        website: 'health.harvard.edu',
                      ),
                      const SizedBox(height: 12),
                      _buildSourceItem(
                        emoji: '🏛️',
                        title: 'NHS (National Health Service)',
                        subtitle: 'Reino Unido',
                        description:
                            'Servicio Nacional de Salud británico. Sistema público con guías clínicas oficiales.',
                        website: 'nhs.uk',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.verified_outlined,
                              color: Color(0xFF1976D2),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Información verificada y respaldada por la comunidad médica internacional.',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 11,
                                  color: Color(0xFF424242),
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Consejos de bienestar
                _buildInfoSection(
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

                const SizedBox(height: 24),

                // Footer con versión
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'AliviaDol',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF6D5BFF),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Versión 1.0.1',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Color borderColor,
    required String title,
    String content = '',
    Widget? customContent,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor.withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
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
                    fontSize: 16,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          if (content.isNotEmpty || customContent != null)
            const SizedBox(height: 12),
          if (customContent != null)
            customContent
          else if (content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: Color(0xFF424242),
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSourceItem({
    required String emoji,
    required String title,
    required String subtitle,
    required String description,
    required String website,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF90CAF9).withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 11,
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: Color(0xFF424242),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.language, size: 14, color: Color(0xFF1976D2)),
              const SizedBox(width: 6),
              Text(
                website,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
