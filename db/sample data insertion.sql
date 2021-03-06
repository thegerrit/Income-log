INSERT INTO "DEPORTE" (
  "nombre"
)
    VALUES (
      'Carrera de Fondo'
    ),(
      'Ciclismo'
    ),(
      'Triatlón'
    );

INSERT INTO "ENTRENADOR" (
  "nombre",
  "apellidos",
  "email"
)
    VALUES (
      'Jennifer',
      'Aniston',
      'jennifer@sample.com'
    ),(
      'Courtney',
      'Cox',
      'courtney@sample.com'
    ),(
      'Matthew',
      'Perry',
      'matthew@sample.com'
    ),(
      'Lisa',
      'Kudrow',
      'lisa@sample.com'
    ),(
      'David',
      'Schwimmer',
      'david@sample.com'
    ),(
      'Matt',
      'LeBlanc',
      'matt@sample.com'
    );

INSERT INTO "PATROCINADOR" (
  "organizacion",
  "nombre",
  "email"
)
    VALUES (
      TRUE,
      'How I Met Your Mother',
      'HIMYM@sample.com'
    ),(
      FALSE,
      'Cobie Smolders',
      'cobie@sample.com'
    ),(
      FALSE,
      'Josh Radnor',
      'josh@sample.com'
    );

INSERT INTO "PAQUETE" (
  "nombre",
  "precio",
  "deporte",
  "id_entrenador"
)
    VALUES (
      'Bronce',
      '37000',
      'Carrera de Fondo',
      '1'
    ),(
      'Plata',
      '45000',
      'Carrera de Fondo',
      '1'
    ),(
      'Bronce',
      '37000',
      'Carrera de Fondo',
      '2'
    ),(
      'Bronce',
      '38000',
      'Ciclismo',
      '3'
    ),(
      'Plata',
      '48000',
      'Ciclismo',
      '4'
    ),(
      'Bronce',
      '40000',
      'Triatlón',
      '5'
    ),(
      'Plata',
      '55000',
      'Triatlón',
      '6'
    );

INSERT INTO "ATLETA" (
  "cedula",
  "nombre",
  "apellidos",
  "email",
  "id_paquete",
  "id_patrocinador"
)
    VALUES (
      '123456789',
      'Michael',
      'Richards',
      'Michael@sample',
      '1',
      '1'
    ),(
      '234567891',
      'Jerry',
      'Seinfeld',
      'jerry@sample',
      '1',
      '1'
    ),(
      '345678912',
      'Larry',
      'David',
      'larry@sample',
      '2',
      '1'
    ),(
      '456789123',
      'Julia',
      'Louis-Dreyfus',
      'julia@sample',
      '3',
      '2'
    ),(
      '567891234',
      'Jason',
      'Alexander',
      'jason@sample',
      '3',
      '2'
    ),(
      '678912345',
      'Wayne',
      'Knight',
      'wayne@sample',
      '4',
      NULL
    ),(
      '789123456',
      'Jerry',
      'Stiller',
      'jerry@sample',
      '5',
      '3'
    ),(
      '891234567',
      'Marisa',
      'Tomei',
      'marisa@sample',
      '6',
      NULL
    );

INSERT INTO "PAGO" (
  "cedula_atleta",
  "id_paquete",
  "id_patrocinador",
  "fecha_pago",
  "fecha_creacion",
  "mes_cancelado",
  "año_cancelado",
  "monto",
  "diferencia"
)
    VALUES (
      '123456789',
      '1',
      '3',
      '5-28-2018',
      '5-28-2018',
      '4',
      '2018',
      '40000',
      '3000'
    ),(
      '123456789',
      '1',
      '3',
      '5-28-2018',
      '5-28-2018',
      '5',
      '2018',
      '37000',
      '0'
    ),(
      '234567891',
      '2',
      NULL,
      '4-24-2018',
      '4-22-2018',
      '5',
      '2018',
      '45000',
      '0'
    ),(
      '234567891',
      '2',
      '1',
      '3-23-2018',
      '3-23-2018',
      '4',
      '2018',
      '50000',
      '5000'
    ),(
      '345678912',
      '6',
      '2',
      '4-5-2018',
      '4-5-2018',
      '4',
      '2018',
      '40000',
      '0'
    ),(
      '456789123',
      '6',
      '3',
      '4-6-2018',
      '4-5-2018',
      '4',
      '2017',
      '50000',
      '10000'
    ),(
      '456789123',
      '4',
      NULL,
      '2-1-2018',
      '2-1-2018',
      '2',
      '2018',
      '40000',
      '2000'
    );
