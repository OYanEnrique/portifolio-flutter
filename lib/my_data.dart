import 'models.dart';

// ----------------------------------------------------
// 1. Defina Seus Projetos
// Ex: assets/images/project1.png
// ----------------------------------------------------
final List<Project> myProjects = [
  Project(
    title: 'Aplicativo de Tarefas Flutter',
    description: 'Um app To-Do list completo com gerenciamento de estado (Provider/Riverpod). Permite adicionar, editar e excluir tarefas.',
  ),
  Project(
    title: 'Site Responsivo com HTML/CSS',
    description: 'Desenvolvimento de um website de portfólio pessoal utilizando Grid e Flexbox para garantir layout responsivo em todos os dispositivos.',
  ),
  // Adicione mais projetos aqui
];

// ----------------------------------------------------
// 2. Defina Suas Experiências
// ----------------------------------------------------

final List<Experience> myEducation = [
  Experience(
    title: 'Bacharelado em Ciência da Computação',
    organization: 'Universidade Fictícia do Código',
    startDate: DateTime(2020, 3, 1),
    endDate: DateTime(2024, 12, 15),
    observation: 'Foco em Desenvolvimento Mobile e Arquitetura de Software.',
  ),
  Experience(
    title: 'Curso Intensivo de Dart e Flutter',
    organization: 'Bootcamp Fictício Dev',
    startDate: DateTime(2025, 1, 10),
    endDate: null, // Ainda em andamento!
  ),
];

final List<Experience> myProfessional = [
  Experience(
    title: 'Estágio em Desenvolvimento Front-end',
    organization: 'Tech Solutions Ltda.',
    startDate: DateTime(2024, 6, 1),
    endDate: DateTime(2025, 6, 1),
  ),
  // Adicione mais experiências profissionais
];

// ----------------------------------------------------
// 3. Crie a Instância Final do Currículo
// ----------------------------------------------------

final Curriculum myCurriculumData = Curriculum(
  name: 'Yan Enrique Costa Silva dos Santos',
  imagePath: 'assets/images/profile.jpg', // Seu caminho de foto de perfil
  educationalExperiences: myEducation,
  professionalExperiences: myProfessional,
  projects: myProjects,
);