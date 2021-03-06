-- Procedure Criar Pessoa

DROP PROCEDURE IF EXISTS sp_criar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_criar_pessoa(IN sp_nome VARCHAR (64),IN sp_cep VARCHAR (8),IN sp_tel VARCHAR (11),IN sp_conta_fin INT (11),IN sp_login_id INT (11))
BEGIN
INSERT INTO pessoa (nome, cep, telefone, conta_financeira_id, login_id) VALUES (sp_nome, sp_cep, sp_tel, sp_conta_fin, sp_login_id);
END $$
DELIMITER ;



-- Procedure Atualizar Pessoa

DROP PROCEDURE IF EXISTS sp_atualizar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pessoa(IN sp_id INT, sp_nome VARCHAR (64),IN sp_cep VARCHAR (8),IN sp_tel VARCHAR (11),IN sp_conta_fin_id INT (11),IN sp_login_id INT (11))
BEGIN
UPDATE pessoa 
SET nome = sp_nome, cep =  sp_cep, telefone = sp_tel, conta_financeira_id = sp_conta_fin_id, login_id= sp_login_id where id = sp_id;
SELECT * FROM pessoa;
END $$
DELIMITER ;



-- Procedure Apagar Pessoa

DROP PROCEDURE IF EXISTS sp_deletar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_deletar_pessoa (IN sp_id INT)
BEGIN 
DELETE FROM pessoa WHERE pessoa.id = sp_id;
END $$
DELIMITER ;



-- Procedure Criar plano

DROP PROCEDURE IF EXISTS sp_criar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_criar_Plano (IN sp_nome varchar(64), IN sp_mensalidade double, IN sp_descricao varchar(128))
BEGIN
INSERT INTO plano (nome, mensalidade, descricao)
VALUES(SP_nome, sp_mensalidade, sp_descricao);
SELECT * FROM plano;
END $$
DELIMITER ;

-- Procedure Atualizar plano

DROP PROCEDURE IF EXISTS sp_atualizar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_plano (IN sp_id int, IN SP_nome VARCHAR (64), IN sp_mensalidade DOUBLE, IN sp_descricao VARCHAR (128))
BEGIN
update Plano
set nome = sp_nome, mensalidade = sp_mensalidade, descricao = sp_descricao
where id = sp_id;
END $$
DELIMITER ;


-- Procedure Listar Plano

DROP PROCEDURE IF EXISTS sp_listar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_listar_Plano ()
BEGIN
SELECT nome, mensalidade, descricao FROM plano;
END $$
DELIMITER ;


-- Procedure Deletar plano

DROP PROCEDURE IF EXISTS sp_deletar_Plano;
DELIMITER $$
CREATE PROCEDURE sp_deletar_Plano (in sp_id int)
BEGIN
delete from Plano where id = sp_id;
END $$
DELIMITER ;


-- Procedure Criar chamado

DROP PROCEDURE IF EXISTS sp_criar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_criar_chamado(IN sp_descricao varchar(256), IN sp_status VARCHAR(256), IN sp_emissao DATETIME, IN sp_conclusao DATETIME, IN sp_tipo_chamado VARCHAR(16), IN sp_funcionario_id INT, IN sp_tecnico_terceirizado_id INT, IN sp_cliente_id INT)
BEGIN
INSERT INTO chamado (descricao, status_chamado, emissao, conclusao, tipo_chamado, funcionario_id, tecnico_terceirizado_id, cliente_id)
VALUES(sp_descricao, sp_status, sp_emissao, sp_conclusao, sp_tipo_chamado, sp_funcionario_id, sp_tecnico_terceirizado_id, sp_cliente_id);
END $$
DELIMITER ;


-- Procedure listar chamado

DROP PROCEDURE IF EXISTS sp_listar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_listar_chamado()
BEGIN
SELECT descricao, status_chamado, tipo_chamado, funcionario_id, tecnico_terceirizado_id, cliente_id
FROM chamado;
END $$
DELIMITER ;


-- Procedure Atualizar chamado

DROP PROCEDURE IF EXISTS sp_atualizar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_chamado(IN sp_id INT, IN sp_descricao varchar(256), IN sp_status VARCHAR(256), IN sp_emissao DATETIME, IN sp_conclusao DATETIME, IN sp_tipo_chamado VARCHAR(16), IN sp_funcionario_id INT, IN sp_tecnico_terceirizado_id INT, IN sp_cliente_id INT) 
BEGIN
UPDATE chamado
SET descricao = sp_descricao, status_chamado = sp_status, emissao = sp_emissao, conclusao = sp_conclusao, tipo_chamado = sp_tipo_chamado, funcionario_id = sp_funcionario_id, tecnico_terceirizado_id = sp_tecnico_terceirizado_id, cliente_id = sp_cliente_id
WHERE id = sp_id;
END $$
DELIMITER ;

-- Procedure Deletar chamado
DROP PROCEDURE IF EXISTS sp_deletar_chamado;
DELIMITER $$
CREATE PROCEDURE sp_deletar_chamado(IN sp_id INT)
BEGIN
DELETE FROM chamado WHERE id = sp_id;
END $$
DELIMITER ;


-- Procedure Criar login

DROP PROCEDURE IF EXISTS sp_criar_login;
DELIMITER $$
CREATE PROCEDURE sp_criar_login (in sp_email varchar(64), in sp_CPF int, in sp_senha varchar(32))
begin
INSERT INTO LOGIN (email, cpf, senha )
VALUES (sp_email, sp_cpf, sp_senha);
end $$ 
DELIMITER ; 


-- Procedure atualizar login

DROP PROCEDURE IF EXISTS sp_atualizar_login;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_login (IN sp_id int, in sp_email varchar(64), in sp_CPF int, in sp_senha varchar(32))
BEGIN
update login
set email = sp_email, cpf = sp_CPF, senha = sp_senha  where id = sp_id;
END $$
DELIMITER ;


-- Procedure deletar login 

DROP PROCEDURE IF EXISTS sp_deletar_login;
DELIMITER $$
CREATE PROCEDURE sp_deletar_login (IN sp_id int)
BEGIN
DELETE FROM login WHERE id = sp_id;
END $$
DELIMITER ;


-- Procedure Criar conta financeira

DROP PROCEDURE IF EXISTS sp_criar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_criar_Conta_financeira (IN SP_conta int, IN sp_agencia int, IN sp_instituicao varchar(64))
BEGIN
INSERT INTO conta_financeira (Conta, agencia, instituicao)
VALUES(SP_conta, sp_agencia,sp_instituicao);
END $$
DELIMITER ;


-- Procedure Atualizar conta financeira

DROP PROCEDURE IF EXISTS sp_atualizar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_Conta_financeira (IN sp_id int, IN SP_conta int, IN sp_agencia int, IN sp_instituicao varchar(64))
BEGIN
update conta_financeira 
set conta = sp_conta, agencia = sp_agencia, instituicao = sp_institui????o
where id = sp_id;
END $$
DELIMITER ;


-- Listar conta financeira

DROP PROCEDURE IF EXISTS sp_listar_Conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_listar_Conta_financeira ()
BEGIN
SELECT conta, agencia, instituicao FROM conta_financeira;
END $$
DELIMITER ;

-- Deletar conta financeira

DROP PROCEDURE IF EXISTS sp_deletar_conta_financeira;
DELIMITER $$
CREATE PROCEDURE sp_deletar_conta_financeira (IN sp_id int)
BEGIN
DELETE FROM conta_financeira WHERE id = sp_id;
END $$
DELIMITER ;

-- Criar cargo

DROP PROCEDURE IF EXISTS sp_criar_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_criar_Cargo (IN sp_nome varchar(64), IN sp_salario double, IN sp_carga_horaria int, IN sp_descricao varchar(256))
BEGIN
INSERT INTO cargo (nome, salario, carga_horaria, descricao)
VALUES(SP_nome, sp_salario, sp_carga_horaria, sp_descricao);
END $$
DELIMITER ;

-- Listar

DROP PROCEDURE IF EXISTS sp_listar_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_listar_Cargo ()
BEGIN
SELECT nome, salario, carga_horaria, descricao FROM Cargo;
END $$
DELIMITER ;


-- Atualizar Cargo

DROP PROCEDURE IF EXISTS sp_atualizar_cargo;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_cargo (IN sp_id int, IN sp_nome varchar(64), IN sp_salario double, IN sp_carga_horaria int, IN sp_descricao varchar(256))
BEGIN
update cargo
set  nome = sp_nome, salario = sp_salario, carga_horaria = sp_carga_horaria, descricao = sp_descricao
where id = sp_id;
END $$
DELIMITER ;

-- Deletar Cargo

DROP PROCEDURE IF EXISTS sp_deletar_Cargo;
DELIMITER $$
CREATE PROCEDURE sp_deletar_Cargo (in sp_id int)
BEGIN
delete from Cargo
where id = sp_id;
END $$
DELIMITER ;


-- Procedure Criar Tecnico Terceirizado 

DROP PROCEDURE IF EXISTS sp_criar_tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_criar_tecnico_terceirizado (IN sp_especializacao VARCHAR(256), IN sp_escalabilidade VARCHAR(16), IN sp_pessoa_id INT)
BEGIN
INSERT INTO tecnico_terceirizado (especializacao, escalabilidade, pessoa_id)
VALUES(sp_especializacao, sp_escalabilidade, sp_pessoa_id);
END $$
DELIMITER ;



-- Lista Tecnico Terceirizado 
DROP PROCEDURE IF EXISTS sp_listar_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_listar_Tecnico_terceirizado ()
BEGIN
SELECT p_pes.nome, especializacao, escalabilidade  FROM tecnico_terceirizado p_t_t
JOIN pessoa p_pes
ON p_pes.id = p_t_t.pessoa_id;
END $$
DELIMITER ;


-- Atualizar Tecnico Terceirizado
DROP PROCEDURE IF EXISTS sp_atualizar_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_Tecnico_terceirizado (IN sp_id int, IN SP_especializacao VARCHAR (256), IN sp_escalabilidade VARCHAR (16), IN sp_pessoa_id INT)
BEGIN
update Tecnico_terceirizado
set especializacao = sp_especializacao, escalabilidade = sp_escalabilidade, pessoa_id = sp_pessoa_id
where id = sp_id;
END $$
DELIMITER ;


-- deletar Tecnico Terceirizado 
DROP PROCEDURE IF EXISTS sp_deletar_Tecnico_terceirizado;
DELIMITER $$
CREATE PROCEDURE sp_deletar_Tecnico_terceirizado (in sp_id int)
BEGIN
delete from tecnico_terceirizado
where id = sp_id;
END $$
DELIMITER ;



-- Criar Funcionario
DROP PROCEDURE IF EXISTS sp_criar_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_criar_funcionario (IN sp_pessoa_id int, IN sp_cargo_id int)
BEGIN
insert into funcionario (pessoa_id, cargo_id)
values (sp_pessoa_id, sp_cargo_id);
END $$
DELIMITER ;


-- Listar Funcionario 

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


-- Atualizar Funcionario
DROP PROCEDURE IF EXISTS sp_atualizar_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_funcionario (in sp_id int, IN sp_pessoa_id int, IN sp_cargo_id int)
BEGIN
update funcionario 
set pessoa_id = sp_pessoa_id, cargo_id = sp_cargo_id
where id = sp_id;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_deletar_funcionario;
DELIMITER $$
CREATE PROCEDURE sp_deletar_funcionario (in sp_id int)
BEGIN
delete from funcionario
where id = sp_id;
END $$
DELIMITER ;


-- Criar Cliente

DROP PROCEDURE IF EXISTS sp_criar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_criar_cliente (IN sp_pessoa_id INT)
BEGIN
insert into cliente (pessoa_id)
values (sp_pessoa_id);
END $$
DELIMITER ;

-- Atualizar Cliente

DROP PROCEDURE IF EXISTS sp_atualizar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_cliente (IN sp_id INT, IN sp_pessoa_id INT)
BEGIN
UPDATE cliente
SET pessoa_id = sp_pessoa_id
WHERE id = sp_id;
END $$
DELIMITER ;

-- deletar Cliente

DROP PROCEDURE IF EXISTS sp_deletar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_deletar_cliente (in sp_id int)
BEGIN
delete from cliente
where id = sp_id;
END $$
DELIMITER ;


-- Criar pedido

DROP PROCEDURE IF EXISTS sp_criar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_criar_pedido (IN sp_situacao VARCHAR(16), IN sp_cliente_id INT, IN sp_plano_id INT, IN sp_pagamento_id INT)
BEGIN
insert into pedido (situacao, cliente_id, plano_id, pagamento_id)
values (sp_situacao, sp_cliente_id, sp_plano_id, sp_pagamento_id);
END $$
DELIMITER ;


-- Atualizar pedido
DROP PROCEDURE IF EXISTS sp_atualizar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pedido (IN sp_id int,IN sp_situacao VARCHAR(16), IN sp_plano_id INT, IN sp_pagamento_id INT)
BEGIN
update pedido
set situacao = sp_situacao, plano_id = sp_plano_id, pagamento_id = sp_pagamento_id
where id = sp_id;
END $$
DELIMITER ;

-- Listar pedido

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


-- deletar pedido

DROP PROCEDURE IF EXISTS sp_deletar_pedido;
DELIMITER $$
CREATE PROCEDURE sp_deletar_pedido (in sp_id int)
BEGIN
delete from pedido
where id = sp_id;
END $$
DELIMITER ;

-- Criar pagamento

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


-- Atualiza pagamento


DROP PROCEDURE IF EXISTS sp_atualizar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_atualizar_pagamento (in sp_id int, IN sp_forma_pagamento VARCHAR(16))
BEGIN
update pagamento 
set forma_pagamento = sp_forma_pagamento
where id = sp_id;
END $$
DELIMITER ;


-- Lista pagamento

DROP PROCEDURE IF EXISTS sp_listar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_listar_pagamento ()
BEGIN
SELECT forma_pagamento AS Pagamento  FROM pagamento;
END $$
DELIMITER ;


-- Exclui pagamento

DROP PROCEDURE IF EXISTS sp_deletar_pagamento;
DELIMITER $$
CREATE PROCEDURE sp_deletar_pagamento (in sp_id int)
BEGIN
delete from pagamento
where id = sp_id;
END $$
DELIMITER ;

-- Listar Cliente

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
DELIMITER ;

-- Listar Login

DROP PROCEDURE IF EXISTS sp_listar_login;
DELIMITER $$
CREATE PROCEDURE sp_listar_login ()
BEGIN
SELECT pLogin.id AS Codigo, pPessoa.nome AS Nome, pLogin.email AS Email, pLogin.cpf as CPF FROM login pLogin
JOIN pessoa pPessoa
ON pPessoa.login_id = pLogin.id;
END $$
DELIMITER ;

-- Listar Pessoa


DROP PROCEDURE IF EXISTS sp_listar_pessoa;
DELIMITER $$
CREATE PROCEDURE sp_listar_pessoa ()
BEGIN
SELECT pPessoa.id AS Codigo, pPessoa.nome AS Nome, pLogin.email AS Email, pLogin.cpf as CPF, pPessoa.cep AS CEP, pPessoa.telefone AS Telefone  FROM pessoa pPessoa
JOIN login pLogin 
ON pPessoa.login_id = pLogin.id;
END $$
DELIMITER ;
