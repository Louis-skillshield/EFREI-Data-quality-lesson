from utils.execute_sql_file import execute_sql_file
from src.database import get_connection


def main():

    print("Test de la connexion:")
    try:
        connection = get_connection()
        print("Connexion à PostgreSQL réussie !")
        print("Base :", connection.info.dbname)
        print("Utilisateur :", connection.info.user)
        print("Hôte :", connection.info.host)
        print("Port :", connection.info.port)

        connection.close()
        connection.close()

    except Exception as e:
        print("Échec de la connexion.")
        print(f"Erreur : {e}")

    accept_data_suppression = input(
        "réinitialisation des tables acceptez vous de supprimer la donnée existante. y/n \n"
    )
    if accept_data_suppression == "n":
        print("Il est nécéssaire de supprimer la donnée pour suivre le cours")
        quit()
    elif accept_data_suppression == "y":
        try:
            execute_sql_file("sql/delete_table.sql")
            print("donnée supprimée avec succès")
        except Exception as e:
            print(f"Erreur lors de la suppression de la donnée: {e}")
    else:
        print("Veuillez séléctionner une valeur y ou n")
        quit()

    print("Création des tables :")
    execute_sql_file("sql/create_schema.sql")
    print("Insertion des données...")
    execute_sql_file("sql/seed.sql")
    print("Base de données initialisée avec succès.")

    try:

        connection = get_connection()

        with connection.cursor() as cursor:
            cursor.execute("SELECT COUNT(*) FROM proprietaire;")
            print("Proprietaires :", cursor.fetchone()[0])

            cursor.execute("SELECT COUNT(*) FROM logement;")
            print("Logements :", cursor.fetchone()[0])

            cursor.execute("SELECT COUNT(*) FROM locataire;")
            print("Locataires :", cursor.fetchone()[0])

            cursor.execute("SELECT COUNT(*) FROM location;")
            print("Locations :", cursor.fetchone()[0])

        connection.close()

    except Exception as e:
        print(f"Erreur lors de la vérification : {e}")


if __name__ == "__main__":
    main()
