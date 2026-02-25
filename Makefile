pdf:
	google-chrome --headless --print-to-pdf=wochenplanung.pdf --print-to-pdf-no-header "file://$(PWD)/index.html?$(if $(WEEK),week=$(WEEK),date=$(DATE))"

pdfs:
	for w in $(WEEKS); do \
		google-chrome --headless --print-to-pdf=wochenplanung-$$w.pdf --print-to-pdf-no-header "file://$(PWD)/index.html?week=$$w$(if $(YEAR),&year=$(YEAR),)"; \
	done
