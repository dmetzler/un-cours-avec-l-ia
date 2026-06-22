# Atelier — Créer ses cours avec l'IA

Support web (MkDocs Material) de l'atelier de 2 h destiné aux enseignant·es :
fabriquer un support de cours illustré avec l'IA, de la trace écrite au PDF.

## Aperçu local
```bash
pip install -r requirements.txt
mkdocs serve
```
Puis http://127.0.0.1:8000

## Déploiement
Pousser sur `main` : le workflow `.github/workflows/deploy.yml` publie sur
GitHub Pages. Pensez à activer Pages (Settings → Pages → Source : GitHub Actions)
et à renseigner `site_url` dans `mkdocs.yml`.

## Structure
- `docs/` — les pages de l'atelier (les 5 blocs)
- `docs/kit/` — le kit téléchargeable (projet Typst, tutoriel, aide-mémoire, exemple)
