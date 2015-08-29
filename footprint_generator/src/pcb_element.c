#include <stdio.h>
#include <math.h>
#include "pcb_element.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

static void rotate(double *x, double *y, int angle)
{
  double new_x, new_y;
  static const double to_radian = M_PI / 180;

  switch (angle) {
    case 0:
      new_x = *x;
      new_y = *y;
      break;
    case 90:
    case -270:
      new_x = - *y;
      new_y = *x;
      break;
    case 180:
    case -180:
      new_x = - *x;
      new_y = *y;
      break;
    case 270:
    case -90:
      new_x = *y;
      new_y = - *x;
      break;
    default:
      new_x = *x * cos(angle * to_radian) - *y * sin(angle * to_radian);
      new_y = *x * sin(angle * to_radian) + *y * cos(angle * to_radian);
      break;
  }
  *x = new_x;
  *y = new_y;
}

void Attribute(const char *name, const char *value)
{
    fprintf(stdout, "\tAttribute(\"%s\" \"%s\")\n", name, value);
}

void Pad(double x1, double y1, double x2, double y2, double width, int round, int angle)
{
    static int pinnumber = 0;
    const char *flags;

    ++pinnumber;
    if (angle) {
        rotate(&x1, &y1, angle);
        rotate(&x2, &y2, angle);
    }
    if (round) {
       flags = "";
    }
    else {
        flags = "square";
    }
    fprintf(stdout, "\tPad[%.4lfmm %.4lfmm %.4lfmm %.4lfmm %.2lfmm %.2lfmm %.2lfmm \"\" \"%u\" \"%s\"]\n",
        x1, y1, x2, y2, width, CLEARANCE * 2, width + 2 * MASK, pinnumber, flags);
}

void Pin(double x, double y, int angle)
{
    static int pinnumber = 0;
    if (angle) {
        rotate(&x, &y, angle);
    }
    fprintf(stdout, "\tPin[%.4lfmm %.4lfmm %.2lfmm %.2lfmm %.2lfmm %.2lfmm \"\" \"%u\" \"hole\"]\n",
        x, y, DRILL, CLEARANCE * 2, DRILL, DRILL, ++pinnumber);
}

void ElementLine(double x1, double y1, double x2, double y2, double width, int angle)
{
    if (angle) {
        rotate(&x1, &y1, angle);
        rotate(&x2, &y2, angle);
    }
    fprintf(stdout, "\tElementLine[%.4lfmm %.4lfmm %.4lfmm %.4lfmm %.2lfmm]\n", x1, y1, x2, y2, width);
}

void ElementArc(double x, double y, int angle)
{
    int start_angle = 0;
    if (angle) {
        rotate(&x, &y, angle);
        start_angle -= angle;
    }
    fprintf(stdout, "\tElementArc[%.4lfmm %.4lfmm %.2lfmm %.2lfmm %d %d %.2lfmm]\n", x, y, 1.0, 1.0, start_angle, 180, SILK_WIDTH);
}
