CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(322) NOT NULL UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE roles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE users_has_roles(
    id_user INT NOT NULL,
    id_role INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_role) REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_role)
);

CREATE TABLE tokens(
    id INT AUTO_INCREMENT PRIMARY KEY,
    token TEXT NOT NULL,
    id_user INT NOT NULL,
    generation_date DATETIME NOT NULL,
    expiration_date DATETIME NOT NULL,
    revoked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE proprietario(
    pro_id INT AUTO_INCREMENT PRIMARY KEY,
    pro_cnpj CHAR(14) NOT NULL UNIQUE,
    pro_nome VARCHAR(150) NOT NULL,
    pro_cidade VARCHAR(50) NOT NULL
);

CREATE TABLE caminhoneiro(
    cam_id INT AUTO_INCREMENT PRIMARY KEY,
    cam_cpf CHAR(11) NOT NULL UNIQUE,
    cam_nome VARCHAR(150) NOT NULL,
    cam_placa VARCHAR(7) NOT NULL,
    cam_peso_bruto FLOAT NOT NULL,
    cam_tara FLOAT NOT NULL
);

CREATE TABLE tipo_grao(
    tip_id INT AUTO_INCREMENT PRIMARY KEY,
    tip_nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE carga(
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    car_data DATE NOT NULL, 
    car_hora TIME NOT NULL,
    car_umidade FLOAT NOT NULL,
    car_impureza FLOAT NOT NULL,
    id_tipo_grao INT NOT NULL,
    cam_id_caminhoneiro INT NOT NULL,
    pro_id_proprietario INT NOT NULL,
    FOREIGN KEY (id_tipo_grao) REFERENCES tipo_grao(tip_id),
    FOREIGN KEY (cam_id_caminhoneiro) REFERENCES caminhoneiro(cam_id),
    FOREIGN KEY (pro_id_proprietario) REFERENCES proprietario(pro_id)
);
 
CREATE TABLE descarga(
    des_id INT AUTO_INCREMENT PRIMARY KEY,
    des_data DATE NOT NULL, 
    des_hora TIME NOT NULL,
    des_umidade FLOAT NOT NULL,
    des_impureza FLOAT NOT NULL,
    id_tipo_grao INT NOT NULL,
    cam_id_caminhoneiro INT NOT NULL,
    pro_id_proprietario INT NOT NULL,
    FOREIGN KEY (id_tipo_grao) REFERENCES tipo_grao(tip_id),
    FOREIGN KEY (cam_id_caminhoneiro) REFERENCES caminhoneiro(cam_id),
    FOREIGN KEY (pro_id_proprietario) REFERENCES proprietario(pro_id)
);
