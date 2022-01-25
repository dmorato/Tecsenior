CREATE DATABASE  IF NOT EXISTS `bd_tecsenior` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_tecsenior`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_tecsenior`
--

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `salario` double NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `descricao` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `nome`, `salario`, `carga_horaria`, `descricao`) VALUES
(1, 'Gestor de Service Desk', 5000, 44, 'Cargo - Gestor de Service Desk\r\nCarga Horaria - 44 horas'),
(2, 'Gestor de Suporte', 5000, 44, 'Cargo - Gestor de Suporte\r\nCarga horaria - 44 horas'),
(3, 'Gestor de Infraestrutura', 5000, 44, 'Cargo - Gestor de Infraestrutura\r\nCarga horaria - 44 horas'),
(4, 'Gestor de Sistemas', 5000, 44, 'Cargo - Gestor de Sistemas\r\nCarga horaria - 44 horas'),
(5, 'Gestor Financeiro', 5000, 44, 'Cargo - Gestor Financeiro\r\nCarga horaria - 44 horas'),
(6, 'Gestor de Marketing', 5000, 44, 'Cargo - Gestor de Marketing\r\nCarga horaria - 44 horas'),
(7, 'Tecnico', 2000, 40, 'Cargo - Tecnico\r\nCarga horaria - 40 horas');

-- --------------------------------------------------------

--
-- Table structure for table `chamado`
--

CREATE TABLE `chamado` (
  `id` int(11) NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `status` varchar(16) NOT NULL,
  `emissao` datetime NOT NULL,
  `conclusao` datetime DEFAULT NULL,
  `tipo_chamado` varchar(16) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `tecnico_terceirizado_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chamado`
--

INSERT INTO `chamado` (`id`, `descricao`, `status`, `emissao`, `conclusao`, `tipo_chamado`, `funcionario_id`, `tecnico_terceirizado_id`, `cliente_id`) VALUES
(1, 'Atualização do Windows', 'Aberto', '2022-01-14 15:44:11', '2022-01-17 17:06:48', 'Local', 3, 1, 1),
(2, 'Formatação de celular', 'Em atendimento', '2022-01-17 15:44:11', NULL, 'Local', 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `pessoa_id`) VALUES
(1, 15),
(2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `conta_financeira`
--

CREATE TABLE `conta_financeira` (
  `id` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `instituicao` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conta_financeira`
--

INSERT INTO `conta_financeira` (`id`, `conta`, `agencia`, `instituicao`) VALUES
(1, 12345, 11, 'Banco Inter'),
(2, 98765, 123, 'Banco Itau'),
(3, 102030, 234, 'Banco Bradesco'),
(4, 54684, 8462, 'Banco Santander'),
(5, 55248782, 12468, 'Caixa Economica Federal'),
(6, 5462, 25428, 'Banco do Brasil'),
(7, 1215462, 54657, 'Caixa Economica Federal'),
(8, 12548415, 1231234, 'Caixa Economica Federal'),
(9, 55043, 5848234, 'Caixa Economica Federal'),
(10, 58452458, 5543, 'Banco do Brasil'),
(11, 22455, 3322445, 'Banco Santander'),
(12, 754253, 54, 'Banco Bradesco'),
(13, 8547215, 1, 'Banco Digio'),
(14, 5245852, 1186, 'Banco Itau'),
(15, 7541543, 5243, 'Banco Safra'),
(16, 84524633, 123124, 'Banco Original');

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`id`, `pessoa_id`, `cargo_id`) VALUES
(1, 2, 1),
(2, 8, 3),
(3, 9, 2),
(4, 10, 4),
(5, 11, 5),
(6, 12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `cpf` bigint(11) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `cpf`, `senha`) VALUES
(0, 'teste@123.com', 0, 'Teste'),
(1, 'admin@tecsenior.com', 1234567890, 'Senha@123*'),
(2, 'alex@tecsenior.com', 0, 'Teste@000*'),
(3, 'camila@tecsenior.com', 98765432101, 'Pass@000!'),
(4, 'diogo@tecsenior.com', 91827364512, 'P@ssw0rd*'),
(5, 'leandro@tecsenior.com', 99999999999, '123@Pass$'),
(6, 'thalita@tecsenior.com', 54321987691, '102030@senha&'),
(7, 'thaiane@tecsenior.com', 74185296305, 'P@ss!2022*'),
(8, 'paulocorreia@gmail.com', 0, 'Senha@123*'),
(9, 'ricardo.souza.tec@hotmail.com', 12345678915, 'P@ssw0rd*'),
(10, 'helen.santos22@gmail.com', 99999999999, '123@Pass$'),
(11, 'dayanepacifico@hotmail.com', 0, 'Day@123'),
(13, 'teste', 0, '0'),
(14, 'joao.alves23@yahoo.com', 0, '963852741');

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `forma_pagamento` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagamento`
--

INSERT INTO `pagamento` (`id`, `forma_pagamento`) VALUES
(0000000000, 'Teste'),
(0000000001, 'Dinheiro'),
(0000000002, 'Cartao Debito'),
(0000000003, 'Cartao Credito'),
(0000000004, 'Pix');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `situacao` varchar(16) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `plano_id` int(11) NOT NULL,
  `pagamento_id` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id`, `situacao`, `cliente_id`, `plano_id`, `pagamento_id`) VALUES
(1, 'Ativo', 1, 1, 0000000001),
(2, 'Ativo', 2, 3, 0000000003);

-- --------------------------------------------------------

--
-- Table structure for table `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `conta_financeira_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `cep`, `telefone`, `conta_financeira_id`, `login_id`) VALUES
(2, 'Alex Aparecido Evangelista Bignardi', '0', '1', 1, 2),
(8, 'Camila dos Santos Queiroz', '00000000', '11999999999', 2, 3),
(9, 'Diogo Santos Morato', '12345678', '85296374155', 3, 4),
(10, 'Leandro da Silva Santos', '77777777', '999999999', 4, 5),
(11, 'Thalita Aguiar', '88888888', '11888888888', 5, 6),
(12, 'Thaiane Frazao da Cunha', '55555555', '11963852741', 6, 7),
(13, 'Paulo Correia', '52432528', '00000000000', 7, 8),
(14, 'Ricardo Souza Ferreira', '96385274', '11999999999', 8, 9),
(15, 'Helen de Oliveira Santos', '12354612', '11888888888', 9, 10),
(16, 'Dayane Pacifico', '74185208', '11987654321', 10, 11),
(17, 'teste', '0', '0', 16, 13);

-- --------------------------------------------------------

--
-- Table structure for table `plano`
--

CREATE TABLE `plano` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `mensalidade` double NOT NULL,
  `descricao` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plano`
--

INSERT INTO `plano` (`id`, `nome`, `mensalidade`, `descricao`) VALUES
(1, 'Assinatura 04 horas', 525, 'Plano de assinatura de 04 horas'),
(2, 'Assinatura 07 horas', 900, 'Plano de assinatura de 07 horas'),
(3, 'Assinatura 10 horas', 1200, 'Plano de assinatura de 04 horas'),
(4, 'Valor excedente', 120, 'Valor excedente caso o cliente tenha usado todas as horas do plano contratado');

-- --------------------------------------------------------

--
-- Table structure for table `tecnico_terceirizado`
--

CREATE TABLE `tecnico_terceirizado` (
  `id` int(11) NOT NULL,
  `especializacao` varchar(256) NOT NULL,
  `escabilidade` varchar(16) NOT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tecnico_terceirizado`
--

INSERT INTO `tecnico_terceirizado` (`id`, `especializacao`, `escabilidade`, `pessoa_id`) VALUES
(1, 'Infraestrutura, Montagem e manutencao, instalacao e configuracao de programas, cabeamento', 'Sim', 13),
(2, 'Infraestrutura, Montagem e manutencao, instalacao e configuracao de programas, cabeamento', 'Nao', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chamado`
--
ALTER TABLE `chamado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chamado_funcionario1_idx` (`funcionario_id`),
  ADD KEY `fk_chamado_tecnico_terceirizado1_idx` (`tecnico_terceirizado_id`),
  ADD KEY `fk_chamado_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_pessoa1_idx` (`pessoa_id`);

--
-- Indexes for table `conta_financeira`
--
ALTER TABLE `conta_financeira`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcionario_pessoa1_idx` (`pessoa_id`),
  ADD KEY `fk_funcionario_cargo1_idx` (`cargo_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_pedido_plano1_idx` (`plano_id`),
  ADD KEY `fk_pedido_pagamento1_idx` (`pagamento_id`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pessoa_conta_financeira_idx` (`conta_financeira_id`),
  ADD KEY `fk_pessoa_login1_idx` (`login_id`);

--
-- Indexes for table `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tecnico_terceirizado`
--
ALTER TABLE `tecnico_terceirizado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tecnico_terceirizado_pessoa1_idx` (`pessoa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chamado`
--
ALTER TABLE `chamado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conta_financeira`
--
ALTER TABLE `conta_financeira`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `plano`
--
ALTER TABLE `plano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tecnico_terceirizado`
--
ALTER TABLE `tecnico_terceirizado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chamado`
--
ALTER TABLE `chamado`
  ADD CONSTRAINT `fk_chamado_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_funcionario1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chamado_tecnico_terceirizado1` FOREIGN KEY (`tecnico_terceirizado_id`) REFERENCES `tecnico_terceirizado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_pagamento1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_plano1` FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `fk_pessoa_conta_financeira` FOREIGN KEY (`conta_financeira_id`) REFERENCES `conta_financeira` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pessoa_login1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tecnico_terceirizado`
--
ALTER TABLE `tecnico_terceirizado`
  ADD CONSTRAINT `fk_tecnico_terceirizado_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;










--
-- Procedures
--
DROP PROCEDURE IF EXISTS sp_criar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_criar_pessoa(IN sp_nome VARCHAR (64),IN sp_cep VARCHAR (8),IN sp_tel VARCHAR (11),IN sp_conta_fin INT (11),IN sp_login_id INT (11))
BEGIN
INSERT INTO pessoa (nome, cep, telefone, conta_financeira_id, login_id) VALUES (sp_nome, sp_cep, sp_tel, sp_conta_fin, sp_login_id);
SELECT * FROM pessoa;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pessoa(IN sp_id INT, sp_nome VARCHAR (64),IN sp_cep VARCHAR (8),IN sp_tel VARCHAR (11),IN sp_conta_fin_id INT (11),IN sp_login_id INT (11))
BEGIN
UPDATE pessoa 
SET nome = sp_nome, cep =  sp_cep, telefone = sp_tel, conta_financeira_id = sp_conta_fin_id, login_id= sp_login_id where id = sp_id;
SELECT * FROM pessoa;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_excluir_pessoa (IN sp_id INT)
BEGIN 
DELETE FROM pessoa WHERE pessoa.id = sp_id;
SELECT * FROM pessoa;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_criar_Plano (IN sp_nome varchar(64), IN sp_mensalidade double, IN sp_descricao varchar(128))
BEGIN
INSERT INTO plano (nome, mensalidade, descricao)
VALUES(SP_nome, sp_mensalidade, sp_descricao);
SELECT * FROM plano;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_plano (IN sp_id int, IN SP_nome VARCHAR (64), IN sp_mensalidade DOUBLE, IN sp_descricao VARCHAR (128))
BEGIN
update Plano
set nome = sp_nome, mensalidade = sp_mensalidade, descricao = sp_descricao
where id = sp_id;
SELECT * FROM Plano;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_listar_Plano ()
BEGIN
SELECT nome, mensalidade, descricao FROM plano;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_Plano;
DELIMITER $$
CREATE PROCEDURE sp_excluir_Plano (in sp_id int)
BEGIN
delete from Plano where id = sp_id;
SELECT * FROM Plano;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_criar_chamado(IN sp_descricao varchar(256), IN sp_status VARCHAR(256), IN sp_emissao DATETIME, IN sp_conclusao DATETIME, IN sp_tipo_chamado VARCHAR(16), IN sp_funcionario_id INT, IN sp_tecnico_terceirizado_id INT, IN sp_cliente_id INT)
BEGIN
INSERT INTO chamado (descricao, status, emissao, conclusao, tipo_chamado, funcionario_id, tecnico_terceirizado_id, cliente_id)
VALUES(sp_descricao, sp_status, sp_emissao, sp_conclusao, sp_tipo_chamado, sp_funcionario_id, sp_tecnico_terceirizado_id, sp_cliente_id);
SELECT * FROM chamado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_consultar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_consultar_chamado()
BEGIN
SELECT descricao, status, tipo_chamado, funcionario_id, tecnico_terceirizado_id, cliente_id
FROM chamado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_chamado(IN sp_id INT, IN sp_descricao varchar(256), IN sp_status VARCHAR(256), IN sp_emissao DATETIME, IN sp_conclusao DATETIME, IN sp_tipo_chamado VARCHAR(16), IN sp_funcionario_id INT, IN sp_tecnico_terceirizado_id INT, IN sp_cliente_id INT) 
BEGIN
UPDATE chamado
SET descricao = sp_descricao, status = sp_status, emissao = sp_emissao, conclusao = sp_conclusao, tipo_chamado = sp_tipo_chamado, funcionario_id = sp_funcionario_id, tecnico_terceirizado_id = sp_tecnico_terceirizado_id, cliente_id = sp_cliente_id
WHERE id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_chamado;
DELIMITER $$
CREATE PROCEDURE sp_excluir_chamado(IN sp_id INT)
BEGIN
DELETE FROM chamado WHERE id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_login;
DELIMITER $$
CREATE PROCEDURE sp_criar_login (in sp_email varchar(64), in sp_CPF int, in sp_senha varchar(32))
begin
INSERT INTO LOGIN (email, cpf, senha )
VALUES (sp_email, sp_cpf, sp_senha);
SELECT * FROM LOGIN;
end $$ 
DELIMITER ; 

DROP PROCEDURE IF EXISTS sp_atualizar_login;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_login (IN sp_id int, in sp_email varchar(64), in sp_CPF int, in sp_senha varchar(32))
BEGIN
update login
set email = sp_email, cpf = sp_CPF, senha = sp_senha  where id = sp_id;
SELECT * FROM login;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_login;
DELIMITER $$
CREATE PROCEDURE sp_excluir_login (IN sp_id int)
BEGIN
DELETE FROM login WHERE id = sp_id;
SELECT * FROM login;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_criar_Conta_financeira (IN SP_conta int, IN sp_agencia int, IN sp_instituicao varchar(64))
BEGIN
INSERT INTO conta_financeira (Conta, agencia, instituicao)
VALUES(SP_conta, sp_agencia,sp_instituicao);
SELECT * FROM conta_financeira;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_Conta_financeira (IN sp_id int, IN SP_conta int, IN sp_agencia int, IN sp_instituicao varchar(64))
BEGIN
update conta_financeira 
set conta = sp_conta, agencia = sp_agencia, instituicao = sp_instituição
where id = sp_id;
SELECT * FROM conta_financeira;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_listar_Conta_financeira ()
BEGIN
SELECT conta, agencia, instituicao FROM conta_financeira;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_excluir_conta_financeira (IN sp_id int)
BEGIN
DELETE FROM conta_financeira WHERE id = sp_id;
SELECT * FROM conta_financeira;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_criar_Cargo (IN sp_nome varchar(64), IN sp_salario double, IN sp_carga_horaria int, IN sp_descricao varchar(256))
BEGIN
INSERT INTO cargo (nome, salario, carga_horaria, descricao)
VALUES(SP_nome, sp_salario, sp_carga_horaria, sp_descricao);
SELECT * FROM cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_listar_Cargo ()
BEGIN
SELECT nome, salario, carga_horaria, descricao FROM Cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_cargo;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_cargo (IN sp_id int, IN sp_nome varchar(64), IN sp_salario double, IN sp_carga_horaria int, IN sp_descricao varchar(256))
BEGIN
update cargo
set  nome = sp_nome, salario = sp_salario, carga_horaria = sp_carga_horaria, descricao = sp_descricao
where id = sp_id;
SELECT * FROM cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_excluir_Cargo (in sp_id int)
BEGIN
delete from Cargo
where id = sp_id;
SELECT * FROM cargo;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_criar_tecnico_terceirizado (IN sp_especializacao VARCHAR(256), IN sp_escabilidade VARCHAR(16), IN sp_pessoa_id INT)
BEGIN
INSERT INTO tecnico_terceirizado (especializacao, escabilidade, pessoa_id)
VALUES(sp_especializacao, sp_escabilidade, sp_pessoa_id);
SELECT * FROM tecnico_terceirizado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_listar_Tecnico_terceirizado ()
BEGIN
SELECT p_pes.nome, especializacao, escabilidade  FROM tecnico_terceirizado p_t_t
JOIN pessoa p_pes
ON p_pes.id = p_t_t.pessoa_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_Tecnico_terceirizado (IN sp_id int, IN SP_especializacao VARCHAR (256), IN sp_escabilidade VARCHAR (16), IN sp_pessoa_id INT)
BEGIN
update Tecnico_terceirizado
set especializacao = sp_especializacao, escabilidade = sp_escabilidade, pessoa_id = sp_pessoa_id
where id = sp_id;
SELECT * FROM Tecnico_terceirizado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_excluir_Tecnico_terceirizado (in sp_id int)
BEGIN
delete from tecnico_terceirizado
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_criar_funcionario (IN sp_pessoa_id int, IN sp_cargo_id int)
BEGIN
insert into funcionario (pessoa_id, cargo_id)
values (sp_pessoa_id, sp_cargo_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_listar_funcionario ()
BEGIN
SELECT cFunc.id AS Matricula, cPessoa.nome, cCargo.nome AS Cargo FROM pessoa cPessoa
JOIN funcionario cFunc
ON cPessoa.id = cFunc.pessoa_id
JOIN cargo cCargo
ON cFunc.cargo_id = cCargo.id;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_funcionario
DELIMITER $$
CREATE PROCEDURE sp_atualizar_funcionario (in sp_id int, IN sp_pessoa_id int, IN sp_cargo_id int)
BEGIN
update funcionario 
set pessoa_id = sp_pessoa_id, cargo_id = sp_cargo_id
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_excluir_funcionario (in sp_id int)
BEGIN
delete from funcionario
where id = sp_id;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_listar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_listar_cliente ()
BEGIN
SELECT cCliente.id AS Matricula, cPessoa.nome AS Nome, cLogin.email AS Email FROM pessoa cPessoa
JOIN login cLogin
ON cPessoa.login_id = cLogin.id
JOIN cliente cCliente
ON cPessoa.id = cCliente.pessoa_id;
END $$


DROP PROCEDURE IF EXISTS sp_criar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_criar_cliente (IN sp_pessoa_id INT)
BEGIN
insert into cliente (pessoa_id)
values (sp_pessoa_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_cliente (IN sp_id INT, IN sp_pessoa_id INT)
BEGIN
UPDATE cliente
SET pessoa_id = sp_pessoa_id
WHERE id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_cliente;
DELIMITER $$
CREATE PROCEDURE sp_excluir_cliente (in sp_id int)
BEGIN
delete from cliente
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_criar_pedido (IN sp_situacao VARCHAR(16), IN sp_cliente_id INT, IN sp_plano_id INT, IN sp_pagamento_id INT)
BEGIN
insert into pedido (situacao, cliente_id, plano_id, pagamento_id)
values (sp_situacao, sp_cliente_id, sp_plano_id, sp_pagamento_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pedido (IN sp_id int,IN sp_situacao VARCHAR(16), IN sp_plano_id INT, IN sp_pagamento_id INT)
BEGIN
update pedido
set situacao = sp_situacao, plano_id = sp_plano_id, pagamento_id = sp_pagamento_id
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_listar_pedido (IN sp_id INT)
BEGIN
SELECT pPedido.id AS Pedido, pPessoa.nome, pPedido.situacao, pPlano.nome AS Plano, pPagamento.forma_pagamento AS Pagamento  FROM pedido pPedido
JOIN cliente pCliente
ON pCliente.id = pPedido.cliente_id
JOIN pessoa pPessoa
ON pPessoa.id = pCliente.pessoa_id
JOIN plano pPlano
ON pPlano.id = pPedido.plano_id 
JOIN pagamento pPagamento
ON pPagamento.id = pPedido.pagamento_id
WHERE pPedido.id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_pedido;
DELIMITER $$
CREATE PROCEDURE sp_excluir_pedido (in sp_id int)
BEGIN
delete from pedido
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_criar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_criar_pagamento (IN sp_forma_pagamento VARCHAR(16))
BEGIN
DECLARE sp_id INT;
set sp_id =  (SELECT id FROM pagamento ORDER BY Id DESC LIMIT 1);
insert into pagamento (id, forma_pagamento)
values (sp_id+1, sp_forma_pagamento);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_atualizar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pagamento (in sp_id int, IN sp_forma_pagamento VARCHAR(16))
BEGIN
update pagamento 
set forma_pagamento = sp_forma_pagamento
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_listar_pagamento ()
BEGIN
SELECT forma_pagamento AS Pagamento  FROM pagamento;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_excluir_pagamento
DELIMITER $$
CREATE PROCEDURE sp_excluir_pagamento (in sp_id int)
BEGIN
delete from pagamento
where id = sp_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listar_login
DELIMITER $$
CREATE PROCEDURE sp_listar_login ()
BEGIN
SELECT email, cpf, senha FROM login;
END $$
DELIMITER ;
call sp_listar_login

DROP PROCEDURE IF EXISTS sp_logar
DELIMITER $$
CREATE PROCEDURE sp_logar(IN sp_cpf INT, IN sp_senha VARCHAR(32))
BEGIN
SELECT * FROM login WHERE cpf = sp_cpf AND senha = sp_senha;
END $$
DELIMITER ;
