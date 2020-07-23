MAIN_SRC_FILE := StandingNotice.scad

2D_SCAD_FILES := $(wildcard exports-2d/*.scad)
2D_DXF_FILES := $(patsubst %.scad,%.dxf,$(2D_SCAD_FILES))
2D_SVG_FILES := $(patsubst %.scad,%.svg,$(2D_SCAD_FILES))

3D_SCAD_FILES := $(wildcard exports-3d/*.scad)
3D_PNG_FILES := $(patsubst %.scad,%.png,$(3D_SCAD_FILES))

ALL_EXPORTS := $(2D_DXF_FILES) $(2D_SVG_FILES) $(2D_PNG_FILES) $(3D_PNG_FILES)

.PHONY: all clean

all: $(ALL_EXPORTS)

%.dxf: %.scad $(MAIN_SRC_FILE)
	openscad -o $@ $<

%.svg: %.scad $(MAIN_SRC_FILE)
	openscad -o $@ $<

%.png: %.scad $(MAIN_SRC_FILE)
	openscad -o $@ $<

clean:
	rm -f $(ALL_EXPORTS)
