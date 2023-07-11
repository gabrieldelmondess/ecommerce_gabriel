
INSERT INTO cliente (Fname, Minit, Lname, CPF, bday)
VALUES ('João', 'A', 'Silva', '12345678901', '1990-01-01'),
       ('Maria', 'B', 'Souza', '98765432109', '1985-05-10');


INSERT INTO endereco (cep, rua, numero, bairro, cidade, estado)
VALUES ('12345-678', 'Rua A', '100', 'Centro', 'São Paulo', 'SP'),
       ('98765-432', 'Rua B', '200', 'Vila Nova', 'Rio de Janeiro', 'RJ');


INSERT INTO product (Fname, classification_kids, category, avalicaco, size)
VALUES ('Celular', 0, 'Eletrônico', 4.5, 'M'),
       ('Camiseta', 1, 'Vestimenta', 3.8, 'G');


INSERT INTO orders (idOrdersCliente, idOrderCartao, Fname, ordersdescription, status_orders, freight, method_pix, method_boleto, method_cartao)
VALUES (1, 1, 'Pedido 1', 'Descrição do Pedido 1', 'Aguardando pagamento', 10, 1, 0, 0),
       (2, 2, 'Pedido 2', 'Descrição do Pedido 2', 'Em transporte', 12.5, 0, 1, 0);


INSERT INTO card (idCartao, idCliente, card_number, card_name, card_date)
VALUES (1, 1, '1234567890123456', 'João Silva', '2024-12-31'),
       (2, 2, '9876543210987654', 'Maria Souza', '2023-09-30');
