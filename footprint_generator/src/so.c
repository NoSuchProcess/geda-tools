#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include "pcb_element.h"
#include "args.h"

void so(const args_t *args)
{
    char * const name = args->name != NULL ? args->name : "?";
    const int count = args->pins / 2;

    const double pad_width = args->pad_width;
    double pad_length = args->pad_length;
    const int pad_round = args->round;

    const double row = args->row;
    const double pitch = args->pitch;
    double internal = args->internal;
    double external = args->external;

    const double width = args->size_x;
    const double length = args->size_y;

    const int rotate = args->rotate;

    if (pad_length == 0) {
        pad_length = (external - internal) / 2;
    }
    else if (external == 0) {
        external = internal + 2 * pad_length;
    }
    else if (internal == 0) {
        internal = external - 2 * pad_length;
    }
    else {
        return; /* define --pad-length or --internal or --external */
    }

    fprintf(stdout, "Element[\"\" \"%s\" \"\" \"\" %.4lfmm %.4lfmm %.4lfmm %.4lfmm 0 100 \"\"]\n", name, 0.0, 0.0, 0.0, 0.0);
    fprintf(stdout, "(\n");

    /* Zero orientation: pin 1 upper left */
    const double dp = (pad_length - pad_width) / 2;

    for (int i = 0; i < count; ++i) { /* left */
        const double x = - row / 2;
        const double y = (2*i - count + 1) * pitch / 2;
        Pad(x - dp, y, x + dp, y, pad_width, i == 0 ? !pad_round : pad_round, rotate);
    }
    for (int i = 0; i < count; ++i) { /* right */
        const double x = row / 2;
        const double y = (count - 1 - 2*i) * pitch / 2;
        Pad(x + dp, y, x - dp, y, pad_width, pad_round, rotate);
    }

    if (width != 0 && length != 0) {
        ElementLine(-width / 2,  -length / 2, -width / 2, length / 2, SILK_WIDTH, rotate);
        ElementLine(-width / 2, length / 2, width / 2, length / 2, SILK_WIDTH, rotate);
        ElementLine(width / 2, length / 2, width / 2, -length / 2, SILK_WIDTH, rotate);
        ElementArc(0, -length / 2, rotate);
        ElementLine(width / 2, -length / 2, -width / 2, -length / 2, SILK_WIDTH, rotate);
    }

    Attribute("author", "Sergey Stepanov <no.such.process@gmail.com>");
    Attribute("use-license", "personal use only");
    Attribute("dist-license", "CC BY-NC-SA 4.0");

    fprintf(stdout, ")\n");
}
