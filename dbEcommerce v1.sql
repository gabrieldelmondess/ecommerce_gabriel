create database ecommerce_gabriel;

use ecommerce_gabriel;

create table cliente (
idCliente int auto_increment primary key,
Fname varchar(10),
Minit char (3),
Lname varchar(15),
CPF char(11) not null,
constraint unique_cpf_cliente unique (CPF),
bday datetime(8)
);

create table endereco (
cep varchar(10) primary key,
rua varchar(50),
numero varchar(4),
bairro varchar(50),
cidade varchar(50),
estado varchar(50)
);

alter table cliente add column endereco_cep varchar(10);
alter table cliente add constraint fk_cliente_endereco foreign key (endereco_cep) references endereco (cep);

create table product (
idProduct int auto_increment primary key,
Fname varchar(10),
classification_kids bool default false,
category enum('Eletrônico', 'Vestimenta', 'Briquedos','Alimentos', 'Móveis') not null,
avalicaco float default 0,
size varchar(10),
constraint unique_cpf_cliente unique (CPF)
);

create table orders ( 
idOrders int auto_increment primary key,
idOrdersCliente int,
idOrderCartao int,
Fname varchar(10),
ordersdescription varchar(255),
status_orders enum('Aguardando pagamento', 'Pedido em separação', 'Encaminhado para a transportadora','Em transporte', 'Entregue') default 'Aguardando pagamento',
freight float default 10,
method_pix boolean default false,
method_boleto boolean default false,
method_cartao boolean default false,
constraint fk_orders_cliente 
foreign key (idOrdersCliente) references cliente (idCliente),
constraint fk_orders_cart 
foreign key (idOrderCartao) references card (idCartao)
);

create table card (
idCartao int,
idCliente int, 
card_number varchar(16),
card_name varchar(50),
card_date date,
constraint fk_card_cliente
foreign key (idCliente) references cliente (idCliente),
primary key (idCliente, idCartao)
);

create table product_storage (
idProdStrorage int auto_increment primary key,
storage_location varchar(255),
quantity int default 0
);

create table supplier (
idSupplier int auto_increment primary key,
pessoa_juridica_id int,
constraint foreign key fk_pessoa_juridica_supplier (pessoa_juridica_id)
references pessoa_juridica (idPessoaJuridica)
);

create table seller (
idSeller int auto_increment primary key,
fantasy_name varchar(50) not null,
pessoa_juridica_id int,
endereco_cep varchar(10),
CPF char(11),
constraint foreign key fk_pessoa_juridica_seller (pessoa_juridica_id)
references pessoa_juridica (idPessoaJuridica),
constraint foreign key fk_endereco_seller
 (endereco_cep) references endereco (cep)
);

create table pessoa_juridica (
idPessoaJuridica int auto_increment primary key,
social_name varchar(50),
CNPJ char(15) not null,
contact char(11) not null,
constraint unique_cnpj_pessoa_juridica unique (CNPJ)
);

create table product_seller(
idProductSeller int,
idPproduct int,
PSquantity int not null,
primary key (idProductSeller, idPproduct),
constraint fk_product_seller 
foreign key (idProductSeller) references seller (idSeller),
constraint fk_product_product
foreign key (idPproduct) references product (idProduct)
);

create table product_order(
idPOproduct int,
idPOorder int,
POquantity int not null,
POstatus enum('Dísponivel', 'Sem estoque') default 'Dísponivel',
primary key (idPOproduct, idPOorder),
constraint fk_productOrder_seller 
foreign key (idPOproduct) references product (idProduct),
constraint fk_productOrder_product
foreign key (idPOorder) references orders (idOrder)
);

create table storage_location(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_locartion_product 
foreign key (idLproduct) references product (idProduct),
constraint fk_storage_location_product_storage
foreign key (idLstorage) references product_storage (idProdStrorage)
);
