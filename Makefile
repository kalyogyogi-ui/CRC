PANDOC      ?= pandoc
SRC_DIRS    := manuscript/00-front-matter \
               manuscript/01-part-i-foundations \
               manuscript/02-part-ii-architecture \
               manuscript/03-part-iii-security-and-trust \
               manuscript/04-part-iv-application-and-deployment \
               manuscript/05-back-matter
SOURCES     := $(sort $(foreach d,$(SRC_DIRS),$(wildcard $(d)/*.md)))
METADATA    := manuscript/metadata.yaml

.PHONY: all docx pdf wordcount clean

all: docx

docx: manuscript.docx
pdf: manuscript.pdf

manuscript.docx: $(METADATA) $(SOURCES)
	$(PANDOC) $(METADATA) $(SOURCES) -o $@ --from markdown+smart

manuscript.pdf: $(METADATA) $(SOURCES)
	$(PANDOC) $(METADATA) $(SOURCES) -o $@ --from markdown+smart --pdf-engine=xelatex

wordcount:
	@wc -w $(SOURCES) | tail -1

clean:
	rm -f manuscript.docx manuscript.pdf
