#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include "pcb_element.h"
#include "args.h"

void qfp(const args_t *args)
{
    const char *name = args->name != NULL ? args->name : "?";
    const int count_x = args->pins_x == 0 ? args->pins / 4 : args->pins_x;
    const int count_y = args->pins_y == 0 ? args->pins / 4 : args->pins_y;

    const double pad_width = args->pad_width;
    double pad_length = args->pad_length; /* To be calculated later */
    const int pad_round = args->round;

    const double thermal_x = args->thermal_x == 0 ? args->thermal : args->thermal_x;
    const double thermal_y = args->thermal_y == 0 ? args->thermal : args->thermal_y;

    const double pitch = args->pitch;
    const double internal = args->internal;
    const double external = args->external;

    const double size_x = args->size_x == 0 ? args->size : args->size_x;
    const double size_y = args->size_y == 0 ? args->size : args->size_y;

    if (pad_length == 0) {
        pad_length = (external - internal) / 2;
    }

    const double internal_x = args->internal_x == 0 ? args->internal : args->internal_x;
    const double internal_y = args->internal_y == 0 ? args->internal : args->internal_y;
    const double external_x = args->external_x == 0 ? args->external : args->external_x;
    const double external_y = args->external_y == 0 ? args->external : args->external_y;

    const int rotate = args->rotate;

    fprintf(stdout, "Element[\"\" \"%s\" \"\" \"\" %.4lfmm %.4lfmm %.4lfmm %.4lfmm 0 100 \"\"]\n", name, 0.0, 0.0, 0.0, 0.0);
    fprintf(stdout, "(\n");

    /* Zero orientation: pin 1 upper left */
    for (int i = 0; i < count_y; ++i) { /* left */
        const double x = - (internal_x + pad_width) / 2;
        const double y = (2 * i - count_y + 1) * pitch / 2;
        Pad(x - (pad_length - pad_width), y, x, y, pad_width, pad_round, rotate);
    }
    for (int i = 0; i < count_x; ++i) { /* bottom */
        const double x = (2 * i - count_x + 1) * pitch / 2;
        const double y = (internal_y + pad_width) / 2;
        Pad(x, y + (pad_length - pad_width), x, y, pad_width, pad_round, rotate);
    }
    for (int i = 0; i < count_y; ++i) { /* right */
        const double x = (internal_x + pad_width) / 2;
        const double y = (count_y - 1 - 2 * i) * pitch / 2;
        Pad(x, y, x + (pad_length - pad_width), y, pad_width, pad_round, rotate);
    }
    for (int i = 0; i < count_x; ++i) { /* top */
        const double x = (count_x - 1 - 2 * i) * pitch / 2;
        const double y = - (internal_y + pad_width) / 2;
        Pad(x, y - (pad_length - pad_width), x, y, pad_width, pad_round, rotate);
    }

    if (thermal_x != 0 && thermal_y != 0) {
        Pad(0, 0, 0, 0, thermal_x, 0, rotate); //TODO: non square, tilted thermal pad
    }

    /* first pin mark */
    const double dot = pad_length < 1.00 ? pad_width : 1.00;
    const double x = - (internal_x + pad_length) / 2;
    const double y = - (internal_y + pad_length) / 2;
    ElementLine(x, y, x, y, dot, rotate);
    /* place */
    if (size_x > 0 && size_y > 0) {
        ElementLine(-size_x / 2, -size_y / 2, size_x / 2, -size_y / 2, SILK_WIDTH, rotate);
        ElementLine(size_x / 2, -size_y / 2, size_x / 2, size_y / 2, SILK_WIDTH, rotate);
        ElementLine(size_x / 2, size_y / 2, -size_x / 2, size_y / 2, SILK_WIDTH, rotate);
        ElementLine(-size_x / 2, size_y / 2, -size_x / 2, -size_y / 2, SILK_WIDTH, rotate);
    }

    Attribute("author", "Sergey Stepanov <no.such.process@gmail.com>");
    Attribute("use-license", "personal use only");
    Attribute("dist-license", "CC BY-NC-SA 4.0");

    fprintf(stdout, ")\n");
}
