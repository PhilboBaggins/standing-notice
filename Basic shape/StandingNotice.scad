include <openscad-common/RoundedRect.scad>

DEFAULT_WIDTH = 50;
DEFAULT_HEIGHT = 80;
DEFAULT_THICKNESS = 6; // https://www.ponoko.com/materials/macrocarpa-hardwood
DEFAULT_ANGLE = 10;
DEFAULT_CORNER_RADIUS = 5;

function genStandWidth(width, height, thickness, angle) =
    width - thickness * 2; // TODO: Rethink this

function genStandHeight(width, height, thickness, angle) =
    tan(90 - angle) * genStandOffset(width, height, thickness, angle);

function genStandOffset(width, height, thickness, angle) =
    height * 1 / 10; // TODO: Rethink this

module StandingNoticeFace2D(width, height, thickness, angle, cornerRadius)
{
    standWidth = genStandWidth(width, height, thickness, angle);
    standOffset = genStandOffset(width, height, thickness, angle);

    difference()
    {
        RoundedRect2D([width, height], cornerRadius);

        translate([(width - standWidth) / 2, standOffset])
        square([standWidth, thickness]);
    }
}

module StandingNoticeStand2D(width, height, thickness, angle, cornerRadius)
{
    union()
    {
        RoundedRect2D([width, height], cornerRadius);
        square([width, height * 0.2]); // square off the bottom 2 corners
    }
}

module StandingNotice2D(
    width = DEFAULT_WIDTH,
    height = DEFAULT_HEIGHT,
    thickness = DEFAULT_THICKNESS,
    angle = DEFAULT_ANGLE,
    cornerRadius = DEFAULT_CORNER_RADIUS)
{
    standWidth = genStandWidth(width, height, thickness, angle);
    standHeight = genStandHeight(width, height, thickness, angle);

    translate([(width - standWidth) / 2, height + 1])
    StandingNoticeStand2D(standWidth, standHeight, thickness, angle, cornerRadius);

    StandingNoticeFace2D(width, height, thickness, angle, cornerRadius);
}

module StandingNotice3D(
    width = DEFAULT_WIDTH,
    height = DEFAULT_HEIGHT,
    thickness = DEFAULT_THICKNESS,
    angle = DEFAULT_ANGLE,
    cornerRadius = DEFAULT_CORNER_RADIUS)
{
    standWidth = genStandWidth(width, height, thickness, angle);
    standHeight = genStandHeight(width, height, thickness, angle);
    standOffset = genStandOffset(width, height, thickness, angle);

    rotate([90 + angle, 0, 180])
    {
        color("brown")
        translate([(width - standWidth) / 2, standOffset + thickness])
        rotate([90, 0, 0])
        linear_extrude(thickness)
        StandingNoticeStand2D(standWidth, standHeight, thickness, angle, cornerRadius);

        linear_extrude(thickness)
        StandingNoticeFace2D(width, height, thickness, angle, cornerRadius);
    }
}

//StandingNotice2D();
//StandingNotice3D();
