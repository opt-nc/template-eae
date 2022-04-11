# template-eae

Une repo template dédiée aux EAEs sur [monportailrh.nc](https://www.monportailrh.nc/).

# ❔ Évaluation et avancement

Cf le [site officiel de la DRHFPNC](https://drhfpnc.gouv.nc/carriere-des-fonctionnaires/evaluation-et-avancement) : 

_Chaque année, tous les agents permanents (titulaires et non titulaires) participent
à un entretien annuel d'évaluation conduit par leur responsable hiérarchique direct._

_En application de l’article 41 de l’arrêté n° 1065 du 22 août 1953 portant statut général
des fonctionnaires des cadres territoriaux, il doit être procédé à l’évaluation de la valeur
professionnelle de chaque fonctionnaire par l’attribution d’une cote numérique suivie d’une
appréciation générale._

Cette repo a pour vocation à aider à la saisie des données dans le formulaire via une collaboration sur `git`
et a pour ambition d'aider au processus d'élaboration de l'EAE avec le collaborateur ou pour vous-même.

# 🥇 Bénéfices attendus

- Versionner totalement vos saisies
- Possible de visualiser les différences au cours des années
- Possible de releaser (finalisation de l'EAE)
- Possible de faire des issues et donc d'embarquer cela dans le suivi avec des outils de collaboration

# 👇 Cas d'utilisation

1. Cliquer sur `Use this template
2. Choisir l'owner cible (votre compte personnel par exemple)
3. Cocher `Privé` (vous pourrez donner des droits très fins par la suite à votre manager par exemple)
4. Choisir un nom pour la repo eg. `my-EAE`
5. Mettre éventuellement une description

![image](https://user-images.githubusercontent.com/5235127/160503835-782e58b7-de7f-4544-aca1-1fb450c248a0.png)

Sinon, plus de détails, aller sur la documentation qui détaille le processus de [création de repo GH à partir d'un template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).


# 🔖 Liens utiles

- [Site institutionnel DRHFPNC](https://drhfpnc.gouv.nc/)
- [Évaluation et avancement](https://drhfpnc.gouv.nc/carriere-des-fonctionnaires/evaluation-et-avancement)
- [Documents et liens utiles pour l'EAE](https://drhfpnc.gouv.nc/formulaires-agents/entretien-annuel-dechange)

# 💡 Possibilités ouvertes

- Via la CI, compiler l'EAE via [`pandoc`](https://pandoc.org/)
- Suivre et planifier les EAEs via l'activité des modifications et suivre sur un projet GH
- Production de métiques sur un EAE
- Automatisation/ntifications par outils cloud et webhooks (push d'un draft, notif de chnagement via mail ou Teams,...)

# 📖 Compiler en ePub/pdf

## Publish en `ePub`

Prérequis :

```
brew install pandoc
```

Puis :

```
pandoc --toc -o mon-EAE.epub title.yml \
  00_identification_agent.md \
  01_entete.md \
  02_resume.md \
  03_fiche-de-poste.md \
  04_tenue-maitrise-du-poste.md \
  05_appreciation_competences.md \
  06_autoevaluation.md \
  07_plan-action.md \
  08_evolution-profressionnelle.md \
  09_synthese-evaluation.md \
  10_avancement.md
```
Pour lire le ePub, [Calibre](https://calibre-ebook.com/) est une solution très efficace. Le développement
de ce projet utilise Calibre pour tester les ePubs produits.

## Export `pdf`

Prerequis : 

```
brew install pandoc
sudo apt-get install texlive-latex-base
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-fonts-extra
sudo apt-get install texlive-latex-extra
sudo apt-get install texlive-full
```

puis : 

```
pandoc --toc --pdf-engine=lualatex -o mon-EAE.pdf title.yml  \
  00_identification_agent.md \
  01_entete.md \
  02_resume.md \
  03_fiche-de-poste.md \
  04_tenue-maitrise-du-poste.md \
  05_appreciation_competences.md \
  06_autoevaluation.md \
  07_plan-action.md \
  08_evolution-profressionnelle.md \
  09_synthese-evaluation.md \
  10_avancement.md
```
