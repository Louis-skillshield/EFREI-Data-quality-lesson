"""
Tests de qualité des données de la base immotrust_db.

Lancer les tests :
    uv run pytest -v

Un test qui échoue n'est pas un bug du test : il signale une anomalie
dans les données. Les tests 1 à 3 passent, les autres révèlent les
anomalies vues en journée 2.
"""


def get_count(connection, query):
    """Exécute une requête qui renvoie un seul nombre (COUNT) et le retourne."""
    with connection.cursor() as cursor:
        cursor.execute(query)
        return cursor.fetchone()[0]


# ------------------------------------------------------------
# 1. La base répond et contient des données
# ------------------------------------------------------------

def test_connection_is_open(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT 1;")
        assert cursor.fetchone()[0] == 1


def test_proprietaire_count(connection):
    total_count = get_count(connection, "SELECT COUNT(*) FROM proprietaire;")
    assert total_count == 20


def test_logement_code_postal_has_5_digits(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM logement WHERE code_postal !~ '^[0-9]{5}$';",
    )
    assert error_count == 0


# ------------------------------------------------------------
# 2. Les logements sont complets et cohérents
# ------------------------------------------------------------

def test_logement_has_adresse(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM logement WHERE adresse IS NULL;",
    )
    assert error_count == 0, f"{error_count} logement(s) sans adresse"


def test_logement_surface_is_positive(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM logement WHERE surface IS NULL OR surface <= 0;",
    )
    assert error_count == 0, f"{error_count} logement(s) avec une surface invalide"


def test_logement_loyer_is_positive(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM logement WHERE loyer IS NULL OR loyer <= 0;",
    )
    assert error_count == 0, f"{error_count} logement(s) avec un loyer invalide"


def test_logement_has_proprietaire(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM logement WHERE proprietaire_id IS NULL;",
    )
    assert error_count == 0, f"{error_count} logement(s) sans propriétaire"


# ------------------------------------------------------------
# 3. Les locations sont cohérentes
# ------------------------------------------------------------

def test_location_has_locataire(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM location WHERE locataire_id IS NULL;",
    )
    assert error_count == 0, f"{error_count} location(s) sans locataire"


def test_location_date_fin_after_date_debut(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM location WHERE date_fin < date_debut;",
    )
    assert error_count == 0, f"{error_count} location(s) qui finissent avant de commencer"


def test_location_loyer_is_positive(connection):
    error_count = get_count(
        connection,
        "SELECT COUNT(*) FROM location WHERE loyer IS NULL OR loyer <= 0;",
    )
    assert error_count == 0, f"{error_count} location(s) avec un loyer invalide"
