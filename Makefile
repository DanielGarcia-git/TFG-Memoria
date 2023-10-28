DOCUMENTO = main
DOCUMENTO_FINAL = TFG_Memoria_Ingineria_Inversa_Asistida_por_Inteligencia_Artificial
TEMPORALES = *idx *aux *lof *log *lot *toc *bbl *blg *~ *out *rel *spl *loa *brf main.lomyequation main.locode *.lol
DATE = $(shell echo %date%)
DATE_FORMATED = $(subst /,-, $(DATE))

all: pdf 

dvi: ${DOCUMENTO}.tex
	latex ${DOCUMENTO}

ps: dvi
	dvips -o ${DOCUMENTO}.ps ${DOCUMENTO}.dvi

pdf: 
	pdflatex --shell-escape ${DOCUMENTO}
	pdflatex --shell-escape ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex --shell-escape ${DOCUMENTO}
	bibtex ${DOCUMENTO}.aux
	pdflatex --shell-escape ${DOCUMENTO}

clean:
	del -f $(TEMPORALES)

cleanall:
	del -f $(TEMPORALES) *pdf *dvi *zip

release: pdf clean
	rename $(DOCUMENTO).pdf $(DOCUMENTO_FINAL).pdf
	zip -r "TFG_Memoria_Release_$(DATE_FORMATED)".zip ./capitulos/* ./figuras/* ./portada/* ./recursos/* *.bib *.tex *.pdf
