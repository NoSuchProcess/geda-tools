#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include "pcb_element.h"
#include "args.h"

void conn(const args_t *args)
{
    char * const name = args->name != NULL ? args->name : "?";
    const double pitch = args->pitch;
    const double pad_length = args->pad_length;
    const double pad_width = args->pad_width;
    const int pins_x = args->pins_x;
    const int pins_y = args->pins_y;
    const int round = args->round;
    const int rotate = args->rotate;

    fprintf(stdout, "Element[\"\" \"%s\" \"\" \"\" %.4lfmm %.4lfmm %.4lfmm %.4lfmm 0 100 \"\"]\n", name, 0.0, 0.0, 0.0, 0.0);
    fprintf(stdout, "(\n");

    /* Zero orientation: pin 1 upper left */
    const double dp = (pad_length - pad_width) / 2;
    for (int pin_y = 0; pin_y < pins_y; ++pin_y) {
        for (int pin_x = 0; pin_x < pins_x; ++pin_x) {
            Pin(pin_x * pitch, pin_y * pitch, rotate);
        }
    }
    for (int pin_y = 0; pin_y < pins_y; ++pin_y) {
        for (int pin_x = 0; pin_x < pins_x; ++pin_x) {
            Pad(pin_x * pitch - dp, pin_y * pitch, pin_x * pitch + dp, pin_y * pitch, pad_width, (pin_x == 0 && pin_y == 0) ? !round : round, rotate);
        }
    }

    Attribute("author", "Sergey Stepanov <no.such.process@gmail.com>");
    Attribute("use-license", "personal use only");
    Attribute("dist-license", "CC BY-NC-SA 4.0");

    fprintf(stdout, ")\n");
}
