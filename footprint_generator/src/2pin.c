#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include "pcb_element.h"
#include "args.h"

void chip(const args_t *args)
{
    char * const name = args->name != NULL ? args->name : "?";
    const double internal = args->internal;
    const double pad_length = args->pad_length;
    const double pad_width = args->pad_width;
    const int pad_round = args->round;
    const int rotate = args->rotate;

    double size_x, size_y;

    fprintf(stdout, "Element[\"\" \"%s\" \"\" \"\" %.4lfmm %.4lfmm %.4lfmm %.4lfmm 0 100 \"\"]\n",
        name, 0.0, 0.0, -(internal / 2 + pad_width), (pad_length / 2 + 0.20));
    fprintf(stdout, "(\n");

    if (pad_length <= pad_width) { /* vertical pads */
        const double x = (internal + pad_length) / 2;
        const double y = (pad_width - pad_length) / 2;
        Pad(-x, -y, -x, y, pad_length, pad_round, rotate);
        Pad(x, -y, x, y, pad_length, pad_round, rotate);
        size_x = args->size_x == 0 ? internal / 2 - MASK - 0.05 : args->size_x;
        size_y = args->size_y == 0 ? pad_width / 2 - 0.05 : args->size_y;
    }
    else { /* horizontal pads */
        const double x1 = (internal + pad_width) / 2;
        const double x2 = x1 + (pad_length - pad_width);
        Pad(-x2, 0, -x1, 0, pad_width, pad_round, rotate);
        Pad(x1, 0, x2, 0, pad_width, pad_round, rotate);
        size_x = args->size_x == 0 ? internal / 2 - MASK - 0.05 : args->size_y;
        size_y = args->size_y == 0 ? pad_width / 2 - 0.05 : args->size_y;
    }

    if (size_x > 0) {
        ElementLine(-size_x, -size_y, size_x, -size_y, SILK_WIDTH, rotate);
        ElementLine(-size_x, size_y, size_x, size_y, SILK_WIDTH, rotate);
    }

    Attribute("author", "Sergey Stepanov <no.such.process@gmail.com>");
    Attribute("use-license", "personal use only");
    Attribute("dist-license", "CC BY-NC-SA 4.0");

    fprintf(stdout, ")\n");
}
