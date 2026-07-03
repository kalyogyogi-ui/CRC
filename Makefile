PANDOC      ?= pandoc
SRC_DIRS    := manuscript/00-front-matter \
               manuscript/01-part-i-foundations \
               manuscript/02-part-ii-architecture \
               manuscript/03-part-iii-security-and-trust \
               manuscript/04-part-iv-application-and-deployment \
               manuscript/05-back-matter
SOURCES     := $(sort $(foreach d,$(SRC_DIRS),$(wildcard $(d)/*.md)))
METADATA    := manuscript/metadata.yaml
PANDOC_FROM := --from markdown+smart
PANDOC_OPTS := $(PANDOC_FROM)

# Output layout
OUTPUT_DIR      := output
OUT_DOCX_BOOK   := $(OUTPUT_DIR)/docx/complete/manuscript-complete.docx
OUT_MD_DIR      := $(OUTPUT_DIR)/markdown
OUT_DOCX_CH_DIR := $(OUTPUT_DIR)/docx/chapters
OUT_DOCX_FM_DIR := $(OUTPUT_DIR)/docx/front-matter
OUT_DOCX_BM_DIR := $(OUTPUT_DIR)/docx/back-matter

CHAPTER_SRCS := \
	manuscript/01-part-i-foundations/ch01-the-asset-identity-problem.md \
	manuscript/01-part-i-foundations/ch02-blockchain-fundamentals.md \
	manuscript/01-part-i-foundations/ch03-physical-asset-identity-models.md \
	manuscript/02-part-ii-architecture/ch04-designing-the-identity-layer.md \
	manuscript/02-part-ii-architecture/ch05-lifecycle-event-modeling.md \
	manuscript/02-part-ii-architecture/ch06-structural-defect-mapping.md \
	manuscript/02-part-ii-architecture/ch07-consensus-and-scalability.md \
	manuscript/03-part-iii-security-and-trust/ch08-threat-model.md \
	manuscript/03-part-iii-security-and-trust/ch09-post-quantum-considerations.md \
	manuscript/03-part-iii-security-and-trust/ch10-privacy-governance-regulation.md \
	manuscript/04-part-iv-application-and-deployment/ch11-solar-pilot-case-study.md \
	manuscript/04-part-iv-application-and-deployment/ch12-extending-the-model.md \
	manuscript/04-part-iv-application-and-deployment/ch13-economic-and-market-implications.md \
	manuscript/04-part-iv-application-and-deployment/ch14-future-directions.md

CHAPTER_DOCXS := $(foreach ch,$(CHAPTER_SRCS),$(OUT_DOCX_CH_DIR)/$(notdir $(ch:.md=.docx)))

define CHAPTER_DOCX_RULE
$(OUT_DOCX_CH_DIR)/$(notdir $(basename $(1))).docx: $(1) $(METADATA) | $(OUT_DOCX_CH_DIR)
	$$(PANDOC) $$(METADATA) $$< -o $$@ $$(PANDOC_OPTS)
endef
$(foreach ch,$(CHAPTER_SRCS),$(eval $(call CHAPTER_DOCX_RULE,$(ch))))

FRONT_MATTER_SRCS := $(wildcard manuscript/00-front-matter/*.md)
FRONT_MATTER_DOCXS := $(foreach f,$(FRONT_MATTER_SRCS),$(OUT_DOCX_FM_DIR)/$(notdir $(f:.md=.docx)))

define FRONT_MATTER_DOCX_RULE
$(OUT_DOCX_FM_DIR)/$(notdir $(basename $(1))).docx: $(1) $(METADATA) | $(OUT_DOCX_FM_DIR)
	$$(PANDOC) $$(METADATA) $$< -o $$@ $$(PANDOC_OPTS)
endef
$(foreach f,$(FRONT_MATTER_SRCS),$(eval $(call FRONT_MATTER_DOCX_RULE,$(f))))

BACK_MATTER_SRCS := $(wildcard manuscript/05-back-matter/*.md)
BACK_MATTER_DOCXS := $(foreach f,$(BACK_MATTER_SRCS),$(OUT_DOCX_BM_DIR)/$(notdir $(f:.md=.docx)))

define BACK_MATTER_DOCX_RULE
$(OUT_DOCX_BM_DIR)/$(notdir $(basename $(1))).docx: $(1) $(METADATA) | $(OUT_DOCX_BM_DIR)
	$$(PANDOC) $$(METADATA) $$< -o $$@ $$(PANDOC_OPTS)
endef
$(foreach f,$(BACK_MATTER_SRCS),$(eval $(call BACK_MATTER_DOCX_RULE,$(f))))

.PHONY: all docx pdf wordcount clean output output-docx output-md output-chapters output-front-matter output-back-matter list-outputs zip figures figures-zip

all: output zip

# Legacy targets (repo root)
docx: manuscript.docx
pdf: manuscript.pdf

manuscript.docx: $(METADATA) $(SOURCES)
	$(PANDOC) $(METADATA) $(SOURCES) -o $@ $(PANDOC_OPTS)

manuscript.pdf: $(METADATA) $(SOURCES)
	$(PANDOC) $(METADATA) $(SOURCES) -o $@ $(PANDOC_OPTS) --pdf-engine=xelatex

# Full export bundle
output: output-docx output-md

output-docx: $(OUT_DOCX_BOOK) output-chapters output-front-matter output-back-matter

$(OUT_DOCX_BOOK): $(METADATA) $(SOURCES) | $(OUTPUT_DIR)/docx/complete
	$(PANDOC) $(METADATA) $(SOURCES) -o $@ $(PANDOC_OPTS)

output-chapters: $(CHAPTER_DOCXS)

output-front-matter: $(FRONT_MATTER_DOCXS)

output-back-matter: $(BACK_MATTER_DOCXS)

output-md: $(SOURCES) $(METADATA) | $(OUT_MD_DIR)
	cp -a manuscript/. $(OUT_MD_DIR)/
	find $(OUT_MD_DIR) -type f ! -name '*.md' ! -name 'metadata.yaml' -delete 2>/dev/null || true

$(OUTPUT_DIR)/docx/complete $(OUT_DOCX_CH_DIR) $(OUT_DOCX_FM_DIR) $(OUT_DOCX_BM_DIR) $(OUT_MD_DIR):
	mkdir -p $@

wordcount:
	@echo "=== Per-chapter ==="
	@for f in $(CHAPTER_SRCS); do \
		printf "%s: " "$$(basename $$f .md)"; wc -w < "$$f"; \
	done
	@echo "=== Total manuscript ==="
	@wc -w $(SOURCES) | tail -1

list-outputs:
	@echo "Complete book:"
	@ls -lh $(OUT_DOCX_BOOK) 2>/dev/null || echo "  (run: make output)"
	@echo ""
	@echo "Chapters ($(words $(CHAPTER_DOCXS)) files):"
	@ls -1 $(OUT_DOCX_CH_DIR)/*.docx 2>/dev/null || echo "  (run: make output-chapters)"
	@echo ""
	@echo "Front matter:"
	@ls -1 $(OUT_DOCX_FM_DIR)/*.docx 2>/dev/null || echo "  (run: make output-front-matter)"
	@echo ""
	@echo "Back matter:"
	@ls -1 $(OUT_DOCX_BM_DIR)/*.docx 2>/dev/null || echo "  (run: make output-back-matter)"
	@echo ""
	@echo "Markdown export:"
	@find $(OUT_MD_DIR) -name '*.md' 2>/dev/null | wc -l | xargs -I{} echo "  {} markdown files in $(OUT_MD_DIR)/"

ZIP_FILE := manuscript-exports.zip
FIGURES_ZIP := manuscript-figures.zip
FIGURES_DIR := output/figures
FIGURES_SCRIPT := scripts/extract-and-render-figures.py

figures: $(FIGURES_SCRIPT) $(SOURCES)
	python3 $(FIGURES_SCRIPT)

figures-zip: figures
	cd $(OUTPUT_DIR) && zip -r ../$(FIGURES_ZIP) figures
	@echo "Created $(FIGURES_ZIP) ($$(du -h $(FIGURES_ZIP) | cut -f1))"

zip: output $(OUTPUT_DIR)/README.md figures
	cd $(OUTPUT_DIR) && zip -r ../$(ZIP_FILE) docx markdown figures README.md
	@echo "Created $(ZIP_FILE) ($$(du -h $(ZIP_FILE) | cut -f1))"

clean:
	rm -f manuscript.docx manuscript.pdf
	rm -rf $(OUTPUT_DIR)
