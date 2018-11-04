drop database if exists rwdatabase;
create database rwdatabase;
use rwdatabase;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `obra` (
  `idObra` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `consejos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES; 	

CREATE TABLE `tipoobra` (
  `idTipoObra` int(11) NOT NULL AUTO_INCREMENT,
  `TipoObra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `tipoobra` WRITE;
/*!40000 ALTER TABLE `tipoobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoobra` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relobratipoobra` (
  `idRelObraTipoobra` int(11) NOT NULL AUTO_INCREMENT,
  `idObraa` int(11) DEFAULT NULL,
  `idTipoObra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelObraTipoobra`),
  KEY `idObraa_idx` (`idObraa`),
  KEY `idTipoObra_idx` (`idTipoObra`),
  CONSTRAINT `idObraa` FOREIGN KEY (`idObraa`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipoObra` FOREIGN KEY (`idTipoObra`) REFERENCES `tipoobra` (`idTipoObra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relobratipoobra` WRITE;
/*!40000 ALTER TABLE `relobratipoobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `relobratipoobra` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `personaje` (
  `idPersonaje` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `personalidad` text,
  `apariencia` varchar(200) DEFAULT NULL,
  `motivaciones` varchar(220) DEFAULT NULL,
  `habitos` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`idPersonaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `personaje` WRITE;
/*!40000 ALTER TABLE `personaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaje` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `actos` (
  `idActos` int(11) NOT NULL AUTO_INCREMENT,
  `Escenario` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idActos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `actos` WRITE;
/*!40000 ALTER TABLE `actos` DISABLE KEYS */;
/*!40000 ALTER TABLE `actos` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `referencias` (
  `idReferencias` int(11) NOT NULL AUTO_INCREMENT,
  `tipoRef` varchar(45) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `año` varchar(45) DEFAULT NULL,
  `fechaConsulta` date DEFAULT NULL,
  `datos` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idReferencias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `referencias` WRITE;
/*!40000 ALTER TABLE `referencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencias` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `dramatico` (
  `idDramatico` int(11) NOT NULL AUTO_INCREMENT,
  `idActos` int(11) DEFAULT NULL,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDramatico`),
  KEY `idActoss_idx` (`idActos`),
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`),
  CONSTRAINT `idActoss` FOREIGN KEY (`idActos`) REFERENCES `actos` (`idActos`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `dramatico` WRITE;
/*!40000 ALTER TABLE `dramatico` DISABLE KEYS */;
/*!40000 ALTER TABLE `dramatico` ENABLE KEYS */;
UNLOCK TABLES; 

CREATE TABLE `ensayo` (
  `idEnsayo` int(11) NOT NULL AUTO_INCREMENT,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  `intro` text,
  `desarrollo` text,
  `conclusion` text,
  PRIMARY KEY (`idEnsayo`),
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `ensayo` WRITE;
/*!40000 ALTER TABLE `ensayo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensayo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `apendices` (
  `idApendices` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` text,
  PRIMARY KEY (`idApendices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;LOCK TABLES `apendices` WRITE;
/*!40000 ALTER TABLE `apendices` DISABLE KEYS */;
/*!40000 ALTER TABLE `apendices` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `articulo` (
  `idArticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  `resumen` text,
  `autores` text,
  `materiales` text,
  `metodos` text,
  `resultados` text,
  `discusion` text,
  `conclusiones` text,
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`),
  PRIMARY KEY (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `dialogos` (
  `idDialogos` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `acotaciones` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`idDialogos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `dialogos` WRITE;
/*!40000 ALTER TABLE `dialogos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialogos` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `estrofa` (
  `idEstrofa` int(11) NOT NULL AUTO_INCREMENT,
  `versos` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idEstrofa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `estrofa` WRITE;
/*!40000 ALTER TABLE `estrofa` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrofa` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `lirico` (
  `idLirico` int(11) NOT NULL AUTO_INCREMENT,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  `idEstrofa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLirico`),
  KEY `idEstrof_idx` (`idEstrofa`),
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`),
  CONSTRAINT `idEstrof` FOREIGN KEY (`idEstrofa`) REFERENCES `estrofa` (`idEstrofa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `lirico` WRITE;
/*!40000 ALTER TABLE `lirico` DISABLE KEYS */;
/*!40000 ALTER TABLE `lirico` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `narrativo` (
  `idNarrativo` int(11) NOT NULL AUTO_INCREMENT,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  `exposicion` text,
  `desarrollo` text,
  `desenlace` text,
  `climax` text,
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`),
  PRIMARY KEY (`idNarrativo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `narrativo` WRITE;
/*!40000 ALTER TABLE `narrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `narrativo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL AUTO_INCREMENT,
  `idRelObraTipoobra` int(11) DEFAULT NULL,
  `contenido` text,
  `claves` varchar(45) DEFAULT NULL,
  `idReferencias` int(11) DEFAULT NULL,
  FOREIGN KEY (`idRelObraTipoobra`) REFERENCES `relObraTipoobra` (`idRelObraTipoobra`),
  PRIMARY KEY (`idResumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `resumen` WRITE;
/*!40000 ALTER TABLE `resumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `numVersos` int(11) DEFAULT NULL,
  `rima` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relresurefe` (
  `idRelResuRefe` int(11) NOT NULL AUTO_INCREMENT,
  `idRefere` int(11) DEFAULT NULL,
  `idResumen` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelResuRefe`),
  KEY `idRefere_idx` (`idRefere`),
  KEY `idResumen_idx` (`idResumen`),
  CONSTRAINT `idRefere` FOREIGN KEY (`idRefere`) REFERENCES `referencias` (`idReferencias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idResumen` FOREIGN KEY (`idResumen`) REFERENCES `resumen` (`idResumen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relresurefe` WRITE;
/*!40000 ALTER TABLE `relresurefe` DISABLE KEYS */;
/*!40000 ALTER TABLE `relresurefe` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relusuobra` (
  `idRelUSuObra` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idObra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelUSuObra`),
  KEY `idObra_idx` (`idObra`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idObra` FOREIGN KEY (`idObra`) REFERENCES `obra` (`idObra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relusuobra` WRITE;
/*!40000 ALTER TABLE `relusuobra` DISABLE KEYS */;
/*!40000 ALTER TABLE `relusuobra` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relactodialo` (
  `idRelActoDialo` int(11) NOT NULL AUTO_INCREMENT,
  `idActos` int(11) DEFAULT NULL,
  `idDialogo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelActoDialo`),
  KEY `idActos_idx` (`idActos`),
  KEY `idDialogos_idx` (`idDialogo`),
  CONSTRAINT `idActos` FOREIGN KEY (`idActos`) REFERENCES `actos` (`idActos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idDialogo` FOREIGN KEY (`idDialogo`) REFERENCES `dialogos` (`idDialogos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relactodialo` WRITE;
/*!40000 ALTER TABLE `relactodialo` DISABLE KEYS */;
/*!40000 ALTER TABLE `relactodialo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relapendiarti` (
  `idRelApendiArti` int(11) NOT NULL AUTO_INCREMENT,
  `idArticulo` int(11) DEFAULT NULL,
  `idApendice` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelApendiArti`),
  KEY `idArticulo_idx` (`idArticulo`),
  KEY `idApendice_idx` (`idApendice`),
  CONSTRAINT `idApendice` FOREIGN KEY (`idApendice`) REFERENCES `apendices` (`idApendices`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relapendiarti` WRITE;
/*!40000 ALTER TABLE `relapendiarti` DISABLE KEYS */;
/*!40000 ALTER TABLE `relapendiarti` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `reldialogopersona` (
  `idrelDialogoPersona` int(11) NOT NULL AUTO_INCREMENT,
  `idDialogos` int(11) DEFAULT NULL,
  `idPersonaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrelDialogoPersona`),
  KEY `idDialogos_idx` (`idDialogos`),
  KEY `idPersonaje_idx` (`idPersonaje`),
  CONSTRAINT `idDialogos` FOREIGN KEY (`idDialogos`) REFERENCES `dialogos` (`idDialogos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPersonaje` FOREIGN KEY (`idPersonaje`) REFERENCES `personaje` (`idPersonaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `reldialogopersona` WRITE;
/*!40000 ALTER TABLE `reldialogopersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `reldialogopersona` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relestrofatipo` (
  `idRelEstrofaTipo` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo` int(11) DEFAULT NULL,
  `idEstrofa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelEstrofaTipo`),
  KEY `idTipo_idx` (`idTipo`),
  KEY `idEstrofa_idx` (`idEstrofa`),
  CONSTRAINT `idEstrofa` FOREIGN KEY (`idEstrofa`) REFERENCES `estrofa` (`idEstrofa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relestrofatipo` WRITE;
/*!40000 ALTER TABLE `relestrofatipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `relestrofatipo` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relnarraperson` (
  `idRelNarraPerson` int(11) NOT NULL AUTO_INCREMENT,
  `idNarrativo` int(11) DEFAULT NULL,
  `idPerson` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelNarraPerson`),
  KEY `idNarrativo_idx` (`idNarrativo`),
  KEY `idPerson_idx` (`idPerson`),
  CONSTRAINT `idNarrativo` FOREIGN KEY (`idNarrativo`) REFERENCES `narrativo` (`idNarrativo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPerson` FOREIGN KEY (`idPerson`) REFERENCES `personaje` (`idPersonaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relnarraperson` WRITE;
/*!40000 ALTER TABLE `relnarraperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `relnarraperson` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relrefarti` (
  `idRelRefArti` int(11) NOT NULL AUTO_INCREMENT,
  `idArticuloo` int(11) DEFAULT NULL,
  `idRefe` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelRefArti`),
  KEY `idArticuloo_idx` (`idArticuloo`),
  KEY `idRefe_idx` (`idRefe`),
  CONSTRAINT `idArticuloo` FOREIGN KEY (`idArticuloo`) REFERENCES `articulo` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idRefe` FOREIGN KEY (`idRefe`) REFERENCES `referencias` (`idReferencias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relrefarti` WRITE;
/*!40000 ALTER TABLE `relrefarti` DISABLE KEYS */;
/*!40000 ALTER TABLE `relrefarti` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `relrefeensayo` (
  `idRelRefeEnsayo` int(11) NOT NULL AUTO_INCREMENT,
  `idReferencia` int(11) DEFAULT NULL,
  `idEnsayo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelRefeEnsayo`),
  KEY `idReferencia_idx` (`idReferencia`),
  KEY `idEnsayo_idx` (`idEnsayo`),
  CONSTRAINT `idEnsayo` FOREIGN KEY (`idEnsayo`) REFERENCES `ensayo` (`idEnsayo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idReferencia` FOREIGN KEY (`idReferencia`) REFERENCES `referencias` (`idReferencias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `relrefeensayo` WRITE;
/*!40000 ALTER TABLE `relrefeensayo` DISABLE KEYS */;
/*!40000 ALTER TABLE `relrefeensayo` ENABLE KEYS */;
UNLOCK TABLES;
