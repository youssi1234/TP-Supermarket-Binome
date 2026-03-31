-- 1. Création de la base de données

CREATE DATABASE IF NOT EXISTS supermarche;
USE supermarche;


-- 2. Table PRODUIT

CREATE TABLE IF NOT EXISTS produit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    quantite_stock INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 3. Table CAISSE
CREATE TABLE IF NOT EXISTS caisse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    nom_caissier VARCHAR(100),
    statut ENUM('ouverte', 'fermee') DEFAULT 'ouverte',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Table ACHAT

CREATE TABLE IF NOT EXISTS achat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    caisse_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    montant_total DECIMAL(10, 2) NOT NULL,
    date_achat DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (caisse_id) REFERENCES caisse(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);


-- 5. Insertion des 5 produits

INSERT INTO produit (designation, prix, quantite_stock) VALUES
('Biscuit', 1000, 150),
('Pain', 400, 200),
('Lait', 800, 80),
('Sucre', 600, 120),
('Café', 1500, 50);


-- 6. Insertion des 2 caisses

INSERT INTO caisse (numero, nom_caissier, statut) VALUES
(1, 'Jean Dupont', 'ouverte'),
(2, 'Marie Martin', 'ouverte');


-- 7. Vérification (optionnel)

-- Afficher les produits
SELECT * FROM produit;

-- Afficher les caisses
SELECT * FROM caisse;