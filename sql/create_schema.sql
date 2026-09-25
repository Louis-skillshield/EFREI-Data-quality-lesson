
CREATE TABLE proprietaire (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20)
);


CREATE TABLE logement (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    adresse VARCHAR(255),
    ville VARCHAR(100),
    code_postal VARCHAR(10),
    type VARCHAR(50),
    surface DECIMAL(6,2),
    loyer DECIMAL(10,2),

    proprietaire_id INTEGER,

    CONSTRAINT fk_logement_proprietaire
        FOREIGN KEY (proprietaire_id)
        REFERENCES proprietaire(id)
);


CREATE TABLE locataire (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20)
);


CREATE TABLE location (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    logement_id INTEGER,
    locataire_id INTEGER,

    date_debut DATE,
    date_fin DATE,

    loyer DECIMAL(10,2),

    CONSTRAINT fk_location_logement
        FOREIGN KEY (logement_id)
        REFERENCES logement(id),

    CONSTRAINT fk_location_locataire
        FOREIGN KEY (locataire_id)
        REFERENCES locataire(id)
);