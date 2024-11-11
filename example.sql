Create Table Cliente(
    id int not null auto_increment primary key,
    nome varchar(50) not null,
    telefone varchar(20),
    email varchar(50)
);
Create Table Conta(
    id int not null auto_increment,
    cliente_id int not null,
    saldo decimal(10, 2) default 0.0,
    primary key(id),
    foreign key(cliente_id) references Cliente(id)
);
Create Table Movimento(
    id int not null auto_increment primary key,
    conta_id int not null,
    DataMovimento datetime default now(),
    valor decimal(10, 2) not null,
    foreign key(conta_id) references Conta(id)
);
INSERT INTO Cliente(nome, telefone, email)
VALUES(
        'Joaquim Dias',
        '+351 963456789',
        'jdias@mail.pt'
    );
INSERT INTO Cliente(nome, telefone, email)
VALUES(
        'Maria Pereira',
        '+351 923456789',
        'mpereira@mail.pt'
    );
INSERT INTO Conta(cliente_id, saldo)
VALUES(1, 1000);
INSERT INTO Conta(cliente_id, saldo)
VALUES(2, 1500);l
select Conta.id,
    nome,
    saldo
from Conta
    inner join Cliente on Conta.cliente_id = Cliente.id;
insert into Movimento(conta_id, valor)
values(1, -50);
insert into Movimento(conta_id, valor)
values(2, 150);
update Conta
set saldo = saldo -50
where id = 1;
update Conta
set saldo = saldo + 150
where id = 2;