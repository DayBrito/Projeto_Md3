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

CREATE TABLE "turma"(
  "id_turma" int  PRIMARY KEY,
  "id_aluno_fk" int,
  "id_facilitador_fk" int, 
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


ALTER TABLE "turma" ADD FOREIGN KEY ("id_aluno_fk") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "aluno" ADD FOREIGN KEY ("id_curso_fk2") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_facilitador_fk") REFERENCES "facilitadores" ("id_facilitador");

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

