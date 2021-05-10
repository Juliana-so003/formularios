-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Maio-2021 às 03:15
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbescola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbaluno`
--

CREATE TABLE `tbaluno` (
  `matricula` int(11) NOT NULL,
  `nome_aluno` varchar(20) NOT NULL,
  `cidade` varchar(10) DEFAULT 'Guaiuba',
  `rua` varchar(15) NOT NULL,
  `casa` int(11) NOT NULL,
  `fone` char(9) NOT NULL,
  `nome_responsavel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmateria`
--

CREATE TABLE `tbmateria` (
  `cod_materia` int(11) NOT NULL,
  `nome_materia` varchar(10) NOT NULL,
  `id_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmateriaaluno`
--

CREATE TABLE `tbmateriaaluno` (
  `cod_materia` int(11) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprofessor`
--

CREATE TABLE `tbprofessor` (
  `id_prof` int(11) NOT NULL,
  `nome_prof` varchar(20) NOT NULL,
  `cpf` char(11) NOT NULL,
  `ano` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices para tabela `tbmateria`
--
ALTER TABLE `tbmateria`
  ADD PRIMARY KEY (`cod_materia`),
  ADD KEY `fk_Prof_materia` (`id_prof`);

--
-- Índices para tabela `tbmateriaaluno`
--
ALTER TABLE `tbmateriaaluno`
  ADD PRIMARY KEY (`cod_materia`,`matricula`),
  ADD KEY `fk_alunomateria` (`matricula`);

--
-- Índices para tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  ADD PRIMARY KEY (`id_prof`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbmateria`
--
ALTER TABLE `tbmateria`
  MODIFY `cod_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbmateria`
--
ALTER TABLE `tbmateria`
  ADD CONSTRAINT `fk_Prof_materia` FOREIGN KEY (`id_prof`) REFERENCES `tbprofessor` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tbmateriaaluno`
--
ALTER TABLE `tbmateriaaluno`
  ADD CONSTRAINT `fk_alunomateria` FOREIGN KEY (`matricula`) REFERENCES `tbaluno` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_materiaaluno` FOREIGN KEY (`cod_materia`) REFERENCES `tbmateria` (`cod_materia`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
