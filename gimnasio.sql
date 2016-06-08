

CREATE TABLE cargo (
  cod_cargo tinyint(4) NOT NULL,
  des_cargo varchar(50) NOT NULL
) ;

--
-- Volcado de datos para la tabla cargo
--

INSERT INTO cargo (cod_cargo, des_cargo) VALUES
(1, 'Cajero'),
(2, 'Preparador Físico');

--
-- Estructura de tabla para la tabla cliente
--

CREATE TABLE cliente (
  rut_cli varchar(10) NOT NULL,
  nombre_cli varchar(15) NOT NULL,
  apellido_cli varchar(15) NOT NULL,
  email varchar(60) DEFAULT NULL,
  telefono_cli varchar(9) DEFAULT NULL,
  fecha_nac date NOT NULL,
  cod_sexo char(1) NOT NULL,
  estatura decimal(3,2) NOT NULL,
  peso_ini decimal(4,1) NOT NULL,
  imc_ini decimal(3,1) NOT NULL
);
--
-- Volcado de datos para la tabla cliente
--

INSERT INTO cliente (rut_cli, nombre_cli, apellido_cli, email, telefono_cli, fecha_nac, cod_sexo, estatura, peso_ini, imc_ini) VALUES
('13234234-5', 'Fernanda', 'Fernandez', 'f.fernandez@gmail.com', '987876565', '1979-01-12', 'f', 1.65, 59.5, 21.8),
('19876876-6', 'Alam', 'Brito', 'a.brito@gmail.com', '974860709', '1996-09-09', 'm', 1.90, 86.3, 23.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla funcionario
--

CREATE TABLE funcionario (
  rut_func varchar(10) NOT NULL,
  nombre_func varchar(15) NOT NULL,
  apellido_func varchar(15) NOT NULL,
  correo varchar(60) DEFAULT NULL,
  telefono varchar(9) DEFAULT NULL,
  fecha_contrato date NOT NULL,
  cod_cargo tinyint(4) NOT NULL,
  passwd varchar(20) NOT NULL
) ;
--
-- Volcado de datos para la tabla funcionario
--

INSERT INTO funcionario (rut_func, nombre_func, apellido_func, correo, telefono, fecha_contrato, cod_cargo, passwd) VALUES
('11222333-4', 'Roberto', 'Robertini', 'r.robertini@gymcenter.cl', '987654321', '2010-03-23', 1, '123'),
('17123123-4', 'Mariana', 'Marino', 'm.marino@gymcenter.cl', '986745624', '2012-03-21', 2, '234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla sexo
--

CREATE TABLE sexo (
  cod_sexo varchar(1) NOT NULL,
  desc_sexo varchar(9) NOT NULL
);

--
-- Volcado de datos para la tabla sexo
--

INSERT INTO sexo (cod_sexo, desc_sexo) VALUES
('f', 'Femenino'),
('m', 'Masculino');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla cargo
--
ALTER TABLE cargo
  ADD PRIMARY KEY (cod_cargo);

--
-- Indices de la tabla cliente
--
ALTER TABLE cliente
  ADD PRIMARY KEY (rut_cli),
  ADD KEY fk_sex (cod_sexo);

--
-- Indices de la tabla funcionario
--
ALTER TABLE funcionario
  ADD PRIMARY KEY (rut_func),
  ADD KEY fk_cargo (cod_cargo);

--
-- Indices de la tabla sexo
--
ALTER TABLE sexo
  ADD PRIMARY KEY (cod_sexo);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla cliente
--
ALTER TABLE cliente
  ADD CONSTRAINT fk_sex FOREIGN KEY (cod_sexo) REFERENCES sexo (cod_sexo);

--
-- Filtros para la tabla funcionario
--
ALTER TABLE funcionario
  ADD CONSTRAINT fk_cargo FOREIGN KEY (cod_cargo) REFERENCES cargo (cod_cargo);
