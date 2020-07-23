MAIN_SRC_FILE := StandingNotice.scad
EXPORT_DIR := exports

SCAD_FILES := $(wildcard $(EXPORT_DIR)/*.scad)
DXF_FILES := $(patsubst %.scad,%.dxf,$(SCAD_FILES))
SVG_FILES := $(patsubst %.scad,%.svg,$(SCAD_FILES))
PNG_FILES := $(patsubst %.scad,%.png,$(SCAD_FILES))
ALL_EXPORTS := $(DXF_FILES) $(SVG_FILES) $(PNG_FILES)

.PHONY: all clean

all: $(ALL_EXPORTS)

%.dxf: %.scad $(MAIN_SRC_FILE)
	openscad -o $@ $<

%.svg: %.scad $(MAIN_SRC_FILE)
	openscad -o $@ $<

%.png: %.svg
	magick convert $< $@

clean:
	rm -f $(ALL_EXPORTS)
