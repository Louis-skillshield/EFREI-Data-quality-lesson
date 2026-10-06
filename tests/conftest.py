import pytest

from src.database import get_connection


# Une fixture prépare quelque chose dont les tests ont besoin.
# Ici : une connexion à la base, ouverte avant chaque test et fermée après.
# name="connection" : dans les tests, on écrit simplement `connection`.
@pytest.fixture(name="connection")
def create_connection():
    connection = get_connection()
    yield connection  # le test s'exécute ici
    connection.close()
