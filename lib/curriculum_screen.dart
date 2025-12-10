import 'package:flutter/material.dart';
import 'models.dart';

class CurriculumScreen extends StatelessWidget {
  final Curriculum curriculum;
  // No arquivo curriculum_screen.dart, dentro da classe CurriculumScreen

Widget _buildProfileSection(BuildContext context) {
  return Column(
    children: [
      // Foto de Perfil
      ClipOval(
        child: Image.asset(
          curriculum.imagePath,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 150,
              height: 150,
              color: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.grey[600],
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 12.0),
      // Nome
      Text(
        curriculum.name,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
      ),
      const Divider(height: 30, thickness: 1),
    ],
  );
}
// No arquivo curriculum_screen.dart, dentro da classe CurriculumScreen

Widget _buildExperienceList(List<Experience> experiences) {
  // Retorna um Column que contém a lista de ExperienceCards
  return Column(
    // Usa List.generate para mapear cada objeto Experience para um widget
    children: List.generate(experiences.length, (index) {
      final experience = experiences[index];
      
      // Formata a data de início e fim
      final start = '${experience.startDate.month}/${experience.startDate.year}';
      final end = experience.endDate == null 
                  ? 'Presente' 
                  : '${experience.endDate!.month}/${experience.endDate!.year}';

      return Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 120),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                experience.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(experience.organization, style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 4),
              Text('$start - $end', style: const TextStyle(fontStyle: FontStyle.italic)),
              if (experience.observation != null && experience.observation!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(experience.observation!),
                ),
            ],
          ),
        ),
      );
    }),
  );
}
// No arquivo curriculum_screen.dart, dentro da classe CurriculumScreen

Widget _buildProjectList(BuildContext context) {
  return Column(
    children: List.generate(curriculum.projects.length, (index) {
      final project = curriculum.projects[index];
      
      return Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem do Projeto
            if (project.imagePath != null)
              Image.asset(
                project.imagePath!,
                fit: BoxFit.cover,
                height: 200, // Altura fixa para a imagem do projeto
                // Adicione um placeholder ou tratamento de erro se necessário
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}

  // O construtor espera receber um objeto Curriculum
  const CurriculumScreen({
    Key? key,
    required this.curriculum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. O Scaffold fornece a estrutura básica da página (AppBar, Body, etc.)
    return Scaffold(
      appBar: AppBar(
        title: Text('Currículo Digital - ${curriculum.name}'),
        centerTitle: true,
      ),
      // 2. O SingleChildScrollView permite que a tela role
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // 3. O Column é o widget principal que organiza os elementos verticalmente
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os elementos na largura
          children: <Widget>[
            // Chama os métodos para construir as seções:
            _buildProfileSection(context),
            const SizedBox(height: 32.0), // Espaço entre as seções

            _buildSectionTitle('📚 Experiência Educacional'),
            _buildExperienceList(curriculum.educationalExperiences),
            const SizedBox(height: 32.0),

            _buildSectionTitle('💼 Experiência Profissional'),
            _buildExperienceList(curriculum.professionalExperiences),
            const SizedBox(height: 32.0),

            _buildSectionTitle('🚀 Projetos de Destaque'),
            _buildProjectList(context),

          ],
        ),
      ),
    );
  }

  // Métodos de construção de UI
    
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}