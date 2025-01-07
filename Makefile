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
  08_evolution-professionnelle.md \
  09_synthese-evaluation.md \
  10_avancement.md \
  release.md \
  gitlog.md

# Default targets

## all   : Génère tous les formats supportés

all: html epub pdf docx

## clean : Delete all generated files

clean: gitlog_clean html_clean epub_clean pdf_clean docx_clean

# `make help` displays all lines beginning with two hash signs

help : Makefile
	@sed -n 's/^##//p' $<

# Build targets

## gitlog  : Genere historique git en markdown 

gitlog:
	gitchangelog > gitlog.rst
	pandoc gitlog.rst -f rst -t markdown -o gitlog.md
	gh changelog new
	mv CHANGELOG.md release.md
	sed -i 's/# Changelog/# Release/g' release.md

## gitlog_clean  : Efface l'historique git en markdown
gitlog_clean:
	rm gitlog.rst gitlog.md


## html  : Generate an HTML file.

html: gitlog $(BOOKNAME).html

html_clean:
	rm -f $(BOOKNAME).html

$(BOOKNAME).html: 
	pandoc -t html --section-divs --standalone -o $(BOOKNAME).html ${MARKDOWNS}
	
	 
## epub  : Generate an EPUB file.

epub: gitlog $(BOOKNAME).epub

epub_clean:
	rm -f $(BOOKNAME).epub

$(BOOKNAME).epub: 
	pandoc --epub-metadata=title.yml --toc -o $(BOOKNAME).epub ${MARKDOWNS}


## pdf   : Generate a PDF file.

pdf: gitlog $(BOOKNAME).pdf

pdf_clean:
	rm -f $(BOOKNAME).pdf

$(BOOKNAME).pdf:
	pandoc --toc --pdf-engine=lualatex -o $(BOOKNAME).pdf ${MARKDOWNS}
	

## docx  : Generate a Word file.

docx: gitlog $(BOOKNAME).docx

docx_clean:
	rm -f $(BOOKNAME).docx

$(BOOKNAME).docx: 
	pandoc --toc  -o $(BOOKNAME).docx ${MARKDOWNS}

## gource   : Build the movie of collaboration flow

gource: 
	gource --title "Campagne EAE via opt-nc/template-eae" --camera-mode track --key -e 0.5 -o - | \
	ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast \
	-pix_fmt yuv420p -crf 1 -threads 0 -bf 0 eae.mp4
	

# Actions that do not correspond to files

.PHONY: help gitlog html pdf docx epub html_clean pdf_clean docx_clean epub_clean 
