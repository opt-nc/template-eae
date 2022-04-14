## Crée l'EAE dans multiples formats

# Variables

BOOKNAME = mon-EAE
MARKDOWNS = title.yml \
  ressources.md  \
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

# Default targets

## all   : Génère tous les formats supportés

all: html epub pdf docx

## clean : Delete all generated files

clean: html_clean epub_clean pdf_clean docx_clean

# `make help` displays all lines beginning with two hash signs

help : Makefile
	@sed -n 's/^##//p' $<

# Build targets

## html  : Generate an HTML file.

html: $(BOOKNAME).html

html_clean:
	rm -f $(BOOKNAME).html

$(BOOKNAME).html: 
	pandoc -t html --section-divs --standalone -o $(BOOKNAME).html ${MARKDOWNS}
	
	 
## epub  : Generate an EPUB file.

epub: $(BOOKNAME).epub

epub_clean:
	rm -f $(BOOKNAME).epub

$(BOOKNAME).epub: 
	pandoc --toc -o $(BOOKNAME).epub ${MARKDOWNS}


## pdf   : Generate a PDF file.

pdf: $(BOOKNAME).pdf

pdf_clean:
	rm -f $(BOOKNAME).pdf

$(BOOKNAME).pdf:
	pandoc --toc --pdf-engine=lualatex -o $(BOOKNAME).pdf ${MARKDOWNS}
	

## docx  : Generate a Word file.

docx: $(BOOKNAME).docx

docx_clean:
	rm -f $(BOOKNAME).docx

$(BOOKNAME).docx: 
	pandoc --toc  -o $(BOOKNAME).docx ${MARKDOWNS}
	

# Actions that do not correspond to files

.PHONY: help html pdf docx epub html_clean pdf_clean docx_clean epub_clean
