-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 24, 2023 alle 08:47
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registro2023`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `psw` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `nome`, `cognome`, `email`, `user`, `psw`) VALUES
(1, 'Edwin', 'Ferrua', 'ef@ef.it', 'Edwin', 'Edwin'),
(2, 'administrator', 'administrator', 'ad@ad.it', 'admin', 'admin'),
(3, 'daniele', 'lerda', 'asfsadf@safdsf.it', 'daniele', 'daniele'),
(4, 'prova', 'prova', 'asfasfsa@fasfsa.it', 'prova', 'prova'),
(5, 'Jose', 'Jose', 'jose@jo.it', 'jose', 'josejose'),
(6, 'tuinchi', 'tuinchi', 'safsaf@fss.it', 'tuinchi', 'tuinchituinchi'),
(7, 'mimmo', 'mimmoo', 'mimm@dfsf.it', 'mimmo', 'mimmomimmo');

-- --------------------------------------------------------

--
-- Struttura della tabella `verifiche`
--

CREATE TABLE `verifiche` (
  `id_verifica` int(11) NOT NULL,
  `materia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `data_verifica` date NOT NULL,
  `argomento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `verifiche`
--

INSERT INTO `verifiche` (`id_verifica`, `materia`, `tipo`, `data_verifica`, `argomento`) VALUES
(1, 'TPSIT', 'scitto', '2023-02-18', 'Ev3 codice C'),
(2, 'ITALIANO', 'orale', '2023-02-28', 'Dante e i suoi viaggi');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Indici per le tabelle `verifiche`
--
ALTER TABLE `verifiche`
  ADD PRIMARY KEY (`id_verifica`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `verifiche`
--
ALTER TABLE `verifiche`
  MODIFY `id_verifica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
