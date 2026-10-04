# EFREI — Python / SQL

Projet utilisé dans le cadre du cours Python et SQL.

## Prérequis

Avant de commencer, vous devez avoir installé :

* Python 3.11 ou supérieur
* PostgreSQL
* `uv`

---

## 1. Récupérer le projet

Clonez le repository :

```bash
git clone https://github.com/Louis-skillshield/EFREI-Data-quality-lesson.git
```

Puis placez-vous dans le dossier du projet :

```bash
cd EFREI-Data-quality-lesson
```

---

## 2. Installer les dépendances

Le projet utilise **uv** pour gérer l'environnement Python et les dépendances.

Si le fichier `uv.lock` est déjà présent dans le repository, utilisez :

```bash
uv sync
```

Cette commande va :

* créer l'environnement virtuel si nécessaire ;
* installer les dépendances du projet ;
* utiliser les versions définies dans `uv.lock`.

Vous n'avez pas besoin de créer manuellement un environnement virtuel avec `venv`.

---

## 3. Configurer les variables d'environnement

Le projet utilise un fichier `.env` pour stocker les informations de connexion à PostgreSQL.

À la racine du projet, copiez le fichier d'exemple :

```bash
cp .env.example .env
```

puis complétez `.env` avec les informations correspondant à votre installation PostgreSQL :

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=nom_de_votre_base
DB_USER=nom_de_votre_utilisateur
DB_PASSWORD=votre_mot_de_passe
```

### Exemple

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=immotrust_db
DB_USER=postgres
DB_PASSWORD=postgres
```

Adaptez les valeurs à votre configuration.

**Ne committez jamais votre fichier `.env` dans Git.**

---

## 4. Vérifier PostgreSQL

Avant de lancer le projet, vérifiez que PostgreSQL est démarré et que la base indiquée dans `.env` existe.

Si elle n'existe pas encore, créez-la :

```bash
createdb -U postgres immotrust_db
```

Puis vérifiez que vous pouvez vous y connecter :

```bash
psql -U postgres -d immotrust_db
```

Puis quittez PostgreSQL :

```sql
\q
```

---

## 5. Initialiser le projet

Une fois les dépendances installées et le fichier `.env` configuré, lancez :

```bash
uv run python main.py
```

Le programme va :

1. tester la connexion à PostgreSQL ;
2. vous demander si vous souhaitez réinitialiser les tables ;
3. créer les tables ;
4. insérer les données ;
5. afficher un récapitulatif.

Si le programme vous demande :

```text
Réinitialisation des tables : acceptez-vous de supprimer les données existantes ? y/n
```

répondez :

```text
y
```

pour initialiser ou réinitialiser la base.

---

## 6. Commandes principales

### Installer les dépendances

```bash
uv sync
```

### Lancer le projet

```bash
uv run python main.py
```

### Lancer les tests

Les tests seront ajoutés au projet pendant le cours.

```bash
uv run pytest
```

### Lancer les tests avec les détails

```bash
uv run pytest -v
```

---

## 7. En cas de problème

### `uv: command not found`

`uv` n'est probablement pas installé ou n'est pas disponible dans votre `PATH`.

Vérifiez son installation :

```bash
uv --version
```

---

### Erreur de connexion PostgreSQL

Vérifiez :

* que PostgreSQL est démarré ;
* que la base existe ;
* que l'utilisateur existe ;
* que le mot de passe est correct ;
* que les informations du fichier `.env` sont correctes.

---

### Erreur `database does not exist`

La base indiquée dans :

```env
DB_NAME=...
```

n'existe pas encore.

Créez-la dans PostgreSQL avant de lancer le projet.

---

### Le projet ne trouve pas `.env`

Le fichier `.env` doit se trouver à la racine du projet :

```text
EFREI-Data-quality-lesson/
├── .env
├── main.py
├── pyproject.toml
├── uv.lock
├── sql/
├── src/
└── utils/
```

---
