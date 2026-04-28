create database if not exists logi_fast_db;
use logi_fast_db;


-- CREATE TABLE 
create table Entregadores(
	id_entregador int auto_increment primary key,
    nome varchar(100),
    tipo_veiculo varchar(20),
    zona_atuacao varchar(20)
);

create table Entregas(
	id_entrega int auto_increment primary key,
    id_entregador int,
    status_entrega varchar(20),
    distancia_km decimal(5,1),
    valor_frete decimal(10,2),
    data_pedido DATE,
    
    foreign key (id_entregador) references Entregadores(id_entregador)
);

-- INSERT VALUES
-- 3.1. EQUIPE DE ENTREGADORES (15 Pessoas)
INSERT INTO Entregadores (nome, tipo_veiculo, zona_atuacao) VALUES
-- Originais
('Carlos Silva', 'Moto', 'Centro'), -- ID 1
('Mariana Souza', 'Van', 'Norte'), -- ID 2
('Pedro Santos', 'Bicicleta', 'Sul'), -- ID 3
('Fernanda Lima', 'Moto', 'Leste'), -- ID 4
('Roberto Dias', 'Van', 'Oeste'), -- ID 5
('Julia Pereira', 'Bicicleta', 'Centro'),-- ID 6
-- Novos Contratados
('Ricardo Gomes', 'Moto', 'Sul'), -- ID 7
('Aline Rocha', 'Van', 'Leste'), -- ID 8
('Lucas Martins', 'Bicicleta', 'Norte'), -- ID 9
('Beatriz Alves', 'Moto', 'Oeste'), -- ID 10
('João Kleber', 'Van', 'Centro'), -- ID 11
('Soraia Mendes', 'Bicicleta', 'Leste'), -- ID 12
('Marcos Paulo', 'Moto', 'Norte'), -- ID 13
('Eliana Veiga', 'Van', 'Sul'), -- ID 14
('Davi Lucca', 'Bicicleta', 'Oeste'); -- ID 15


INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(1, 'Entregue', 5.5, 15.00, '2024-11-20'),
(1, 'Entregue', 3.2, 12.00, '2024-11-20'),
(1, 'Pendente', 6.0, 18.00, '2024-11-21'),
(1, 'Entregue', 4.5, 14.00, '2024-11-21'),
(1, 'Devolvido', 5.0, 0.00, '2024-11-22'),
(6, 'Entregue', 1.2, 7.50, '2024-11-20'),
(6, 'Entregue', 0.8, 6.00, '2024-11-21'),
(6, 'Entregue', 2.5, 9.00, '2024-11-21'),
(6, 'Entregue', 1.5, 8.00, '2024-11-22'),
(6, 'Entregue', 3.0, 10.00, '2024-11-22'),
(6, 'Pendente', 1.0, 7.00, '2024-11-22'),
(11, 'Entregue', 15.0, 60.00, '2024-11-23'),
(11, 'Pendente', 12.0, 55.00, '2024-11-23'),
(11, 'Entregue', 20.0, 80.00, '2024-11-24');
INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(2, 'Entregue', 45.0, 120.00, '2024-11-20'),
(2, 'Entregue', 50.5, 135.00, '2024-11-21'),
(2, 'Devolvido', 40.0, 0.00, '2024-11-21'),
(2, 'Entregue', 60.0, 150.00, '2024-11-22'),
(2, 'Pendente', 35.0, 90.00, '2024-11-22'),
(9, 'Entregue', 3.0, 12.00, '2024-11-21'),
(9, 'Pendente', 4.5, 15.00, '2024-11-21'),
(9, 'Devolvido', 5.0, 0.00, '2024-11-22'),
(13, 'Entregue', 15.0, 35.00, '2024-11-23'),
(13, 'Entregue', 18.0, 40.00, '2024-11-23'),
(13, 'Entregue', 22.0, 48.00, '2024-11-24');
INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(3, 'Entregue', 1.5, 8.00, '2024-11-20'),
(3, 'Entregue', 2.0, 9.50, '2024-11-20'),
(3, 'Entregue', 1.0, 7.00, '2024-11-20'),
(3, 'Entregue', 3.0, 10.00, '2024-11-21'),
(3, 'Pendente', 2.5, 9.00, '2024-11-22'),
(7, 'Entregue', 10.0, 25.00, '2024-11-20'),
(7, 'Entregue', 12.0, 28.00, '2024-11-21'),
(7, 'Entregue', 8.0, 20.00, '2024-11-21'),
(14, 'Entregue', 55.0, 130.00, '2024-11-22'),
(14, 'Entregue', 60.0, 145.00, '2024-11-23'),
(14, 'Devolvido', 50.0, 0.00, '2024-11-23');
INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(4, 'Entregue', 12.0, 25.00, '2024-11-20'),
(4, 'Entregue', 15.5, 30.00, '2024-11-21'),
(4, 'Devolvido', 10.0, 0.00, '2024-11-21'),
(4, 'Entregue', 11.0, 22.00, '2024-11-22'),
(8, 'Entregue', 80.0, 190.00, '2024-11-20'),
(8, 'Entregue', 75.0, 180.00, '2024-11-21'),
(8, 'Entregue', 90.0, 210.00, '2024-11-22'),
(8, 'Pendente', 60.0, 140.00, '2024-11-23'),
(12, 'Entregue', 2.0, 8.00, '2024-11-21'),
(12, 'Entregue', 3.5, 11.00, '2024-11-22');

INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(5, 'Pendente', 55.0, 140.00, '2024-11-20'),
(5, 'Entregue', 65.0, 160.00, '2024-11-21'),
(5, 'Entregue', 70.0, 180.00, '2024-11-22'),
(5, 'Entregue', 45.0, 110.00, '2024-11-22'),
(10, 'Entregue', 12.0, 28.00, '2024-11-20'),
(10, 'Devolvido', 15.0, 0.00, '2024-11-21'),
(10, 'Entregue', 14.0, 32.00, '2024-11-22'),
(15, 'Pendente', 2.0, 8.00, '2024-11-21'),
(15, 'Devolvido', 1.5, 0.00, '2024-11-22');
INSERT INTO Entregas (id_entregador, status_entrega, distancia_km, valor_frete, data_pedido) VALUES
(1, 'Entregue', 4.0, 15.00, '2024-11-24'),
(2, 'Entregue', 55.0, 140.00, '2024-11-24'),
(3, 'Entregue', 2.2, 10.00, '2024-11-24'),
(4, 'Entregue', 13.0, 26.00, '2024-11-24'),
(7, 'Entregue', 9.0, 22.00, '2024-11-24'),
(8, 'Entregue', 85.0, 200.00, '2024-11-24'),
(1, 'Entregue', 5.0, 16.00, '2024-11-25'),
(2, 'Entregue', 60.0, 155.00, '2024-11-25'),
(6, 'Entregue', 3.5, 12.00, '2024-11-25'),
(8, 'Entregue', 95.0, 220.00, '2024-11-25'),
(11, 'Entregue', 25.0, 90.00, '2024-11-25'),
(14, 'Entregue', 50.0, 125.00, '2024-11-25');