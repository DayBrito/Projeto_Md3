--CRIAÇÃO DAS TABELAS--
CREATE TABLE "facilitadores" (
  "id_facilitador" int PRIMARY KEY,
    "id_departamento_fk" int,
    "nome_facilitador" varchar(100),
     "matricula_facilitador" int
);

CREATE TABLE "departamentos" (
    "id_departamento" int PRIMARY KEY,
  "tipo_de_departamento" varchar(100)   
);

CREATE TABLE "modulos_developer" (
  "id_modulo_developer" int PRIMARY KEY,
  "conteudo_hard_skills" varchar(1000),
  "conteudo_soft_skills" varchar(1000),
  "id_facilitador_hard_fk" int,
  "id_facilitador_soft_fk" int,
  "id_curso_fk" int,
  "quantidade_de_aulas" int
);

CREATE TABLE "modulos_data" (
  "id_modulo_data_science" int PRIMARY KEY,
  "conteudo_hard_skills" varchar(1000),
  "conteudo_soft_skills" varchar(1000),
  "id_facilitador_hard_fk" int,
  "id_facilitador_soft_fk" int,
  "id_curso_fk" int,
  "quantidade_de_aulas" int
);

CREATE TABLE "cursos" (
  "id_curso" int  PRIMARY KEY,
  "curso" varchar(100)
);

CREATE TABLE "turma" (
  "id_turma" int  PRIMARY KEY,
  "id_facilitador_soft" int,
  "id_facilitador_tech" int,
  "id_curso_fk8" int,
  "id_modulo_developer_fk" int,
  "id_modulo_data_science_fk" int 
);

CREATE TABLE "aluno" (
  "id_aluno" int  PRIMARY KEY,
  "nome_do_aluno" varchar(100),
  "idade_aluno" int ,
  "estado_do_aluno" varchar(100),
  "matricula_aluno" int ,
  "id_curso_fk2" int ,
  "id_turma_fk" int 
);

CREATE TABLE "cadastro" (
  "id_cadastro" int  PRIMARY KEY,
  "id_aluno_fk" int,
  "id_facilitador_fk" int,
  "id_curso_fk3" int
);

--REFERENCIANDO AS CHAVES ESTRANGEIRAS--
ALTER TABLE "aluno" ADD FOREIGN KEY ("id_curso_fk2") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_facilitador_soft") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_facilitador_tech") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "aluno" ADD FOREIGN KEY ("id_turma_fk") REFERENCES "turma" ("id_turma");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_aluno_fk") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_facilitador_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_curso_fk3") REFERENCES "cursos" ("id_curso");

ALTER TABLE "facilitadores" ADD FOREIGN KEY ("id_departamento_fk") REFERENCES "departamentos" ("id_departamento");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_facilitador_hard_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_facilitador_soft_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_curso_fk") REFERENCES "cursos" ("id_curso");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_facilitador_hard_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_facilitador_soft_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_curso_fk") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_curso_fk8") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_modulo_developer_fk") REFERENCES "modulos_developer" ("id_modulo_developer");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_modulo_data_science_fk") REFERENCES "modulos_data" ("id_modulo_data_science");

--INSERINDO DADOS NA TABELA DEPARTAMENTO--
INSERT INTO departamentos (id_departamento, tipo_de_departamento) values (1, 'Soft Skills');
INSERT INTO departamentos (id_departamento, tipo_de_departamento) values (2, 'Hard Skills');


--INSERINDO DADOS NA TABELA FACILITADOES--
INSERT INTO facilitadores (id_facilitador, id_departamento_fk, 
                           nome_facilitador, matricula_facilitador) values (1, 1, 'Esli', 202241),
                                                                           (2, 2, 'Marisa', 202250)
                                                                           (3, 2, 'Dayson', 202281),
                                                                           (4, 2, 'Rafael', 202271),
                                                                           (5, 2, 'Guilherme', 2022101),
                                                                           (6, 2, 'Valentina',202225),
                                                                           (7, 2, 'Maria', 202288),
                                                                           (8, 1, 'André', 2022746),
                                                                           (9, 2, 'Vagner', 2022789),
                                                                           (10, 2, 'Ana', 2021963);

--INSERINDO DADOS NA TABELA CURSOS--
INSERT INTO cursos (id_curso, curso) values (1, 'Data Science'),
                                            (2, 'Web Developer');

--INSERINDO DADOS NA TABELA MODULOS REFERENTE AO CURSO DE DATA SCIENCE--
INSERT INTO modulos_data (id_modulo_data_science, conteudo_hard_skills, conteudo_soft_skills, id_facilitador_hard_fk,
            id_facilitador_soft_fk,
            id_curso_fk, quantidade_de_aulas) values (1, 'Introdução à programação, algoritmo e pensamento computacional e 
                                                      lógica de programação',
                                                      'Mindset de crescimento, aprender a aprender e 
                                                      gestão de tempo', 2, 1, 1, 20),

                                                      (2, 'Estrutura de dados: listas, dicionários; funções, procedimentos e 
                                                      métodos e bibliotecas',
                                                      'Inteligência emocional, gestão de conflitos, relacionamento interpessoal, 
                                                      trabalho em equipe', 3, 1, 1, 19),

                                                      (3, 'Análise de dados, banco dados relacionais, 
                                                      banco de dados não-relacionais
                                                      consultas recorrentes com SQL','Capacidade investigativa e metodologias ágeis', 4, 1, 1, 25),

                                                      (4, 'Pandas, Google Colab, estatística descritiva, 
                                                      visualização de dados', 'Postura profissional, visão de negócios e clientes, inovação e criatividade', 6, 1, 1, 20),

                                                      (5, 'Introdução a mineração de dados, análise e tratamento de dados
                                                      , introdução ao storytelling', 'Capacidade investigativa, pensamento crítico, ética e privacidade', 10, 1, 1, 22),

                                                      (6, 'Introdução ao Tableau, funcionalidades úteis e operações em tabelas
                                                      ', 'Empregabilidade e postura em processos seletivos', 10, 1, 1, 20);

--INSERINDO DADOS NA TABELA MODULOS REFERENTE AO CURSO DE WEB DEVELOPER--
INSERT INTO modulos_developer (id_modulo_developer, conteudo_hard_skills, 
            conteudo_soft_skills, id_facilitador_hard_fk,
            id_facilitador_soft_fk,
            id_curso_fk, quantidade_de_aulas) values (1, 'HTML5, CSS3, lógica de programação, Javascript, git e github',
                                                      'Praticar competências e hábitos comportamentais', 5, 8, 2, 21),

                                                      (2, 'Criação de págias dinâmicas, orietação a objetos e requisições à APIs',
                                                      'Lidar com suas emoções, manter equilíbrioemocional sob pressão e estresse, trabalhar em
                                                      equipe com uma boa comunicação para gerir os conflitos interpessoais.', 5, 8, 2, 26),

                                                      (3, 'Modelar banco de dados, realizar operações de
                                                      escrita, leitura, atualização e consultas avançadas nos bancos de dados, focadas em Business Intelligence.', 
                                                      'Utilizar de metodologias ágeis para entregar continuamente valor ao cliente, priorizar demandas, adaptar às mudanças e aplicar o framework SCRUM 
                                                      para a realização de projetos.', 4, 8, 2, 27), 

                                                      (4, 'Criar APIs para interagir com o banco de dados, permitindo que diversos sistemas possam consumir e interagir com os dados da aplicação.',
                                                      'Adotar postura profissional esperada pelo mercado, aplicando ferramentas de criatividade e inovação para propor ideias e fazer perguntas inteligentes.',
                                                      7, 8, 2, 22),      

                                                      (5, 'Criar interfaces e componentes com React, usando abordagem de classes e funcional. Estará criando seus próprios Hooks customizados. e conhecendo as 
                                                      bibliotecas de estilização mais utilizadas no mercado.', 'Conhecer seus objetivos pessoais e de carreira, aofinal da jornada você se preparar para processos
                                                      seletivos de Desenvolvedor Jr e encontrar sua empresa.', 9, 8, 2, 20);

--INSERIR OS DADOS NA TABELA TURMA E ALUNOS--

