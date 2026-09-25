-- ============================================================
-- SEED DATA - VERSION ENSEIGNANT / SOLUTION
-- Données volontairement imparfaites pour le TP SQL
-- ============================================================

TRUNCATE TABLE
    location,
    logement,
    locataire,
    proprietaire
RESTART IDENTITY CASCADE;


-- ============================================================
-- PROPRIETAIRES
-- ============================================================

INSERT INTO proprietaire (nom, prenom, email, telephone) VALUES
('Martin', 'Jean', 'jean.martin@example.com', '0601020304'),
('Durand', 'Claire', 'claire.durand@example.com', '0602030405'),
('Bernard', 'Paul', 'paul.bernard@example.com', '0603040506'),
('Petit', 'Sophie', 'sophie.petit@example.com', '0604050607'),
('Robert', 'Nicolas', 'nicolas.robert@example.com', '0605060708'),
('Moreau', 'Isabelle', 'isabelle.moreau@example.com', '0606070809'),
('Leroy', 'François', 'francois.leroy@example.com', '0607080910'),
('Simon', 'Anne', 'anne.simon@example.com', '0608091011'),
('Laurent', 'Michel', 'michel.laurent@example.com', '0610101112'),
('Lefevre', 'Marie', 'marie.lefevre@example.com', '0611121314'),
('Michel', 'Thomas', 'thomas.michel@example.com', '0613141516'),
('Garcia', 'Julie', 'julie.garcia@example.com', '0615161718'),
('David', 'Pierre', 'pierre.david@example.com', '0617181920'),
('Bertrand', 'Camille', 'camille.bertrand@example.com', '0619202122'),
('Roux', 'Antoine', 'antoine.roux@example.com', '0621222324'),
('Vincent', 'Émilie', 'emilie.vincent@example.com', '0623242526'),
('Fournier', 'Alexandre', 'alexandre.fournier@example.com', '0625262728'),
('Girard', 'Laura', 'laura.girard@example.com', '0627282930'),
('Bonnet', 'Julien', 'julien.bonnet@example.com', '0630313233'),
('Dupont', 'Hélène', 'helene.dupont@example.com', '0632333435');


-- ============================================================
-- LOGEMENTS
-- ============================================================

INSERT INTO logement
(adresse, ville, code_postal, type, surface, loyer, proprietaire_id)
VALUES
('12 rue de Paris', 'Rennes', '35000', 'Appartement', 55.50, 850.00, 1),
('8 avenue de la République', 'Rennes', '35000', 'Appartement', 72.00, 1100.00, 2),
('24 rue Victor Hugo', 'Nantes', '44000', 'Maison', 120.00, 1450.00, 3),
('5 rue du Port', 'Saint-Malo', '35400', 'Appartement', 45.00, 750.00, NULL),
('18 rue Nationale', 'Rennes', '35000', 'Appartement', -30.00, 650.00, 1),
('7 rue des Lilas', 'Nantes', '44000', 'Appartement', 40.00, -500.00, 2),
(NULL, 'Rennes', '35000', 'Appartement', 35.00, 600.00, 1),
('3 boulevard de la Liberté', 'Rennes', '35000', 'Studio', 28.00, 520.00, 4),
('16 rue de Brest', 'Brest', '29200', 'Appartement', 63.00, 790.00, 5),
('42 rue Jean Jaurès', 'Brest', '29200', 'Maison', 105.00, 1250.00, 6),
('9 rue d''Antrain', 'Rennes', '35000', 'Studio', 22.00, 480.00, 7),
('31 rue de Nantes', 'Rennes', '35000', 'Appartement', 81.00, 1180.00, 8),
('14 rue des Carmes', 'Nantes', '44000', 'Appartement', 58.00, 900.00, 9),
('27 rue du Calvaire', 'Nantes', '44000', 'Maison', 135.00, 1700.00, 10),
('6 rue de Siam', 'Brest', '29200', 'Appartement', 47.50, 720.00, 11),
('19 rue de la Monnaie', 'Lille', '59000', 'Appartement', 52.00, 760.00, 12),
('4 rue Nationale', 'Lille', '59000', 'Studio', 24.00, 490.00, 13),
('22 boulevard Vauban', 'Lille', '59000', 'Appartement', 76.00, 1050.00, 14),
('11 rue Foch', 'Strasbourg', '67000', 'Appartement', 68.00, 980.00, 15),
('35 avenue des Vosges', 'Strasbourg', '67000', 'Maison', 145.00, 1850.00, 16),
('2 rue du Dôme', 'Strasbourg', '67000', 'Studio', 19.00, 430.00, 17),
('17 rue de la République', 'Lyon', '69002', 'Appartement', 61.00, 1050.00, 18),
('28 rue Victor Hugo', 'Lyon', '69002', 'Appartement', 73.00, 1250.00, 19),
('45 cours Lafayette', 'Lyon', '69006', 'Maison', 110.00, 1600.00, 20),
('13 rue Garibaldi', 'Lyon', '69006', 'Appartement', 49.00, 850.00, 1),
('8 rue des Capucins', 'Bordeaux', '33000', 'Appartement', 57.00, 920.00, 2),
('21 rue Sainte-Catherine', 'Bordeaux', '33000', 'Studio', 25.00, 540.00, 3),
('36 cours Victor Hugo', 'Bordeaux', '33000', 'Appartement', 82.00, 1300.00, 4),
('10 rue de la République', 'Marseille', '13001', 'Appartement', 64.00, 950.00, 5),
('5 boulevard Longchamp', 'Marseille', '13001', 'Maison', 128.00, 1550.00, 6),
('29 rue Paradis', 'Marseille', '13006', 'Appartement', 71.00, 1120.00, 7),
('3 rue de Rome', 'Marseille', '13001', 'Studio', 21.00, 470.00, 8),
('15 rue du Château', 'Nantes', '44000', 'Appartement', 67.00, 1020.00, 9),
('52 boulevard des Anglais', 'Nantes', '44000', 'Appartement', 88.00, 1350.00, 10),
('7 rue de l''Horloge', 'Saint-Malo', '35400', 'Studio', 23.00, 550.00, NULL),
('18 avenue de Moka', 'Saint-Malo', '35400', 'Appartement', 59.00, 890.00, 12),
('4 rue des Bas Sablons', 'Saint-Malo', '35400', 'Maison', 115.00, 1500.00, 13),
('9 rue Ville Pépin', 'Saint-Malo', '35400', 'Appartement', 48.00, 780.00, 14),
('25 rue du Général Patton', 'Rennes', '35000', 'Appartement', 0.00, 800.00, 15),
('40 rue de Lorient', 'Rennes', '35000', 'Appartement', 52.00, NULL, 16),
('18 rue Saint-Hélier', 'Rennes', '35000', 'Penthouse', 95.00, 2400.00, 17),
('12 rue de Strasbourg', 'Rennes', '35000', 'Appartement', 44.00, 690.00, NULL);


-- ============================================================
-- LOCATAIRES
-- ============================================================

INSERT INTO locataire (nom, prenom, email, telephone) VALUES
('Leroy', 'Thomas', 'thomas.leroy@example.com', '0611111111'),
('Moreau', 'Julie', 'julie.moreau@example.com', '0622222222'),
('Simon', 'Lucas', 'lucas.simon@example.com', '0633333333'),
('Robert', 'Emma', 'emma.robert@example.com', '0644444444'),
('Blanc', 'Hugo', 'hugo.blanc@example.com', '0655555555'),
('Faure', 'Chloé', 'chloe.faure@example.com', '0666666666'),
('Andre', 'Nathan', 'nathan.andre@example.com', '0677777777'),
('Mercier', 'Manon', 'manon.mercier@example.com', '0688888888'),
('Guerin', 'Louis', 'louis.guerin@example.com', '0699999999'),
('Boyer', 'Sarah', 'sarah.boyer@example.com', '0600000001'),
('Chevalier', 'Arthur', 'arthur.chevalier@example.com', '0600000002'),
('François', 'Léa', 'lea.francois@example.com', '0600000003'),
('Legrand', 'Mathis', 'mathis.legrand@example.com', '0600000004'),
('Gauthier', 'Camille', 'camille.gauthier@example.com', '0600000005'),
('Garcia', 'Inès', 'ines.garcia@example.com', '0600000006'),
('Perrin', 'Maxime', 'maxime.perrin@example.com', '0600000007'),
('Robin', 'Alice', 'alice.robin@example.com', '0600000008'),
('Clement', 'Paul', 'paul.clement@example.com', '0600000009'),
('Morin', 'Zoé', 'zoe.morin@example.com', '0600000010'),
('Nicolas', 'Gabriel', 'gabriel.nicolas@example.com', '0600000011'),
('Henry', 'Élise', 'elise.henry@example.com', '0600000012'),
('Rousseau', 'Martin', 'martin.rousseau@example.com', '0600000013'),
('Muller', 'Laura', 'laura.muller@example.com', '0600000014'),
('Henry', 'Thomas', 'thomas.henry@example.com', '0600000015'),
('Marchand', 'Eva', 'eva.marchand@example.com', '0600000016'),
('Aubert', 'Louis', 'louis.aubert@example.com', '0600000017'),
('Noël', 'Jeanne', 'jeanne.noel@example.com', '0600000018'),
('Benoit', 'Romain', 'romain.benoit@example.com', '0600000019'),
('Arnaud', 'Clara', 'clara.arnaud@example.com', '0600000020'),
('Giraud', 'Jules', 'jules.giraud@example.com', '0600000021');


-- ============================================================
-- LOCATIONS
-- ============================================================

INSERT INTO location
(logement_id, locataire_id, date_debut, date_fin, loyer)
VALUES
(1, 1, '2026-01-01', NULL, 850.00),
(2, 2, '2026-02-01', NULL, 1100.00),
(3, 3, '2026-03-01', '2027-03-01', 1450.00),
(4, NULL, '2026-04-01', NULL, 750.00),
(5, 1, '2026-08-01', '2026-05-01', 650.00),
(6, 2, '2026-06-01', NULL, -500.00),
(8, 5, '2026-01-15', '2026-12-31', 520.00),
(9, 6, '2026-02-01', NULL, 790.00),
(10, 7, '2026-01-01', '2027-01-01', 1250.00),
(11, 8, '2026-03-01', NULL, 480.00),
(12, 9, '2026-01-10', '2026-12-31', 1180.00),
(13, 10, '2026-02-15', NULL, 900.00),
(14, 11, '2026-01-01', '2026-12-31', 1700.00),
(15, 12, '2026-04-01', NULL, 720.00),
(16, 13, '2026-01-01', NULL, 760.00),
(17, 14, '2026-02-01', '2026-08-31', 490.00),
(18, 15, '2026-03-01', NULL, 1050.00),
(19, 16, '2026-01-01', '2026-12-31', 980.00),
(20, 17, '2026-01-15', NULL, 1850.00),
(21, 18, '2026-02-01', NULL, 430.00),
(22, 19, '2026-03-01', NULL, 1050.00),
(23, 20, '2026-01-01', '2026-12-31', 1250.00),
(24, 1, '2026-04-01', NULL, 1600.00),
(25, 2, '2026-01-01', NULL, 850.00),
(26, 3, '2026-02-01', NULL, 920.00),
(27, 5, '2026-03-01', NULL, 540.00),
(28, 6, '2026-01-01', '2026-12-31', 1300.00),
(29, 7, '2026-01-01', NULL, 950.00),
(30, 8, '2026-02-01', NULL, 1550.00),
(31, 9, '2026-01-01', NULL, 1120.00),
(32, 10, '2026-05-01', NULL, 470.00),
(33, 11, '2026-01-01', '2026-12-31', 1020.00),
(34, 12, '2026-02-01', NULL, 1350.00),
(35, NULL, '2026-03-01', NULL, 550.00),
(36, 14, '2026-01-01', NULL, 890.00),
(37, 15, '2026-02-01', NULL, 1500.00),
(38, 16, '2026-03-01', NULL, 780.00),

-- Même logement avec deux locations actives
(18, 17, '2026-09-01', NULL, 1050.00),

-- Deuxième location active sur le même logement
(22, 20, '2026-10-01', NULL, 1050.00),

-- Loyer de location différent du loyer du logement
(25, 3, '2026-06-01', NULL, 1200.00),

-- Date incohérente
(27, 5, '2026-11-01', '2026-09-01', 540.00),

-- Location avec loyer nul
(29, 6, '2026-07-01', NULL, NULL),

-- Location sans locataire
(31, NULL, '2026-08-01', NULL, 1120.00),

-- Location sur logement sans propriétaire
(35, 7, '2026-09-01', NULL, 550.00),

-- Location avec loyer négatif
(36, 8, '2026-09-01', NULL, -890.00),

-- Location terminée avec date de fin très antérieure
(37, 9, '2026-01-01', '2025-01-01', 1500.00),

-- Location sur logement avec surface nulle
(39, 10, '2026-09-01', NULL, 800.00),

-- Location sur logement avec loyer NULL
(40, 11, '2026-09-01', NULL, 700.00),

-- Location sur logement sans propriétaire
(41, 12, '2026-09-01', NULL, 2400.00);
