-- ============================================================
-- CORRECTION DES ANOMALIES DE LA BASE immotrust_db
-- ============================================================
-- Ce script corrige les anomalies détectées par les tests
-- (tests/test_data_quality.py). Après son exécution, tous les
-- tests doivent passer :
--
--   psql -U votre_utilisateur -d immotrust_db -f sql/fix_anomalies.sql
--   uv run pytest -v
--
-- Deux stratégies :
--   - CORRIGER quand la bonne valeur se déduit avec certitude
--     (erreur de signe, dates inversées, loyer repris du logement) ;
--   - SUPPRIMER quand la bonne valeur est impossible à deviner
--     (adresse ou propriétaire inconnus, surface ou loyer absents).
--
-- Tout est fait dans UNE transaction : si une étape échoue,
-- rien n'est appliqué (tout ou rien).
-- ============================================================

BEGIN;


-- ------------------------------------------------------------
-- 1. Locations sans locataire : un bail sans locataire n'a pas
--    de sens -> suppression (locations 4, 34 et 43).
-- ------------------------------------------------------------
DELETE FROM location
WHERE locataire_id IS NULL;


-- ------------------------------------------------------------
-- 2. Erreurs de signe : une surface ou un loyer négatif est une
--    faute de saisie -> valeur absolue (ABS).
--    Logement 5 : surface -30 -> 30
--    Logement 6 : loyer -500 -> 500
--    Locations 6 et 45 : loyer -500 -> 500 et -890 -> 890
-- ------------------------------------------------------------
UPDATE logement
SET surface = ABS(surface)
WHERE surface < 0;

UPDATE logement
SET loyer = ABS(loyer)
WHERE loyer < 0;

UPDATE location
SET loyer = ABS(loyer)
WHERE loyer < 0;


-- ------------------------------------------------------------
-- 3. Dates inversées : une location qui finit avant de commencer
--    -> on échange date_debut et date_fin (locations 5, 41 et 46).
--    PostgreSQL lit les anciennes valeurs pour tout le SET :
--    l'échange fonctionne en une seule instruction.
-- ------------------------------------------------------------
UPDATE location
SET date_debut = date_fin,
    date_fin = date_debut
WHERE date_fin < date_debut;


-- ------------------------------------------------------------
-- 4. Loyer de location manquant : on reprend le loyer du
--    logement loué (location 42 -> 950 €, loyer du logement 29).
-- ------------------------------------------------------------
UPDATE location
SET loyer = logement.loyer
FROM logement
WHERE location.logement_id = logement.id
  AND location.loyer IS NULL
  AND logement.loyer > 0;


-- ------------------------------------------------------------
-- 5. Logements impossibles à corriger -> suppression.
--    Logement 7 : adresse inconnue
--    Logements 4, 35 et 42 : propriétaire inconnu
--    Logement 39 : surface à 0
--    Logement 40 : loyer inconnu
--    On supprime d'abord leurs locations, sinon la clé étrangère
--    location.logement_id bloque la suppression.
-- ------------------------------------------------------------
DELETE FROM location
WHERE logement_id IN (
    SELECT id
    FROM logement
    WHERE adresse IS NULL
       OR proprietaire_id IS NULL
       OR surface IS NULL OR surface <= 0
       OR loyer IS NULL OR loyer <= 0
);

DELETE FROM logement
WHERE adresse IS NULL
   OR proprietaire_id IS NULL
   OR surface IS NULL OR surface <= 0
   OR loyer IS NULL OR loyer <= 0;


COMMIT;


-- ------------------------------------------------------------
-- Vérification : chaque compteur doit valoir 0.
-- ------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM logement WHERE adresse IS NULL) AS logement_sans_adresse,
    (SELECT COUNT(*) FROM logement WHERE surface IS NULL OR surface <= 0) AS surface_invalide,
    (SELECT COUNT(*) FROM logement WHERE loyer IS NULL OR loyer <= 0) AS loyer_logement_invalide,
    (SELECT COUNT(*) FROM logement WHERE proprietaire_id IS NULL) AS logement_sans_proprietaire,
    (SELECT COUNT(*) FROM location WHERE locataire_id IS NULL) AS location_sans_locataire,
    (SELECT COUNT(*) FROM location WHERE date_fin < date_debut) AS dates_inversees,
    (SELECT COUNT(*) FROM location WHERE loyer IS NULL OR loyer <= 0) AS loyer_location_invalide;
