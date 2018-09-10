#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include "geda.h"

#ifndef strdup
extern char *strdup(const char *s);
#endif
#ifndef strndup
extern char *strndup(const char *s, size_t n);
#endif

#define array_size(x) (sizeof (x) / sizeof (x[0]))

#define RADIUS 40
#define THIN_LINE_WIDTH 10
#define THICK_LINE_WIDTH 20

static void swap2(int *a1, int *a2)
{
    int tmp;
    tmp = *a1;
    *a1 = *a2;
    *a2 = tmp;
}

#if 0
static void sort4(int *x1, int *y1, int *x2, int *y2)
{
    if (*x1 == *x2 && *y1 > *y2) {
        swap2(y1, y2);
        return;
    }
    if (*x1 > *x2) {
        swap2(x1, x2);
        swap2(y1, y2);
        return;
    }
}
#endif

static const line_t default_line = {
    .type = OBJ_LINE,
    .x1 = 0, .y1 = 0, .x2 = 0, .y2 = 0,
    .color = GRAPHIC_COLOR,
    .linewidth = THIN_LINE_WIDTH, .capstyle = 0,
    .dashstyle = 0, .dashlength = -1, .dashspace = -1
};

static const circle_t logic_bubble = {
    .type = OBJ_CIRCLE,
    .x = 0, .y = 0, .radius = RADIUS,
    .color = LOGIC_BUBBLE_COLOR,
    .linewidth = THIN_LINE_WIDTH, .capstyle = 0,
    .dashstyle = TYPE_SOLID, .dashlength = -1, .dashspace = -1,
    .filltype = FILLING_HOLLOW, .fillwidth = -1,
    .angle1 = -1, .pitch1 = -1, .angle2 = -1, .pitch2 = -1
};

static const text_t detached_attr = {
    .type = OBJ_TEXT,
    .x = 0, .y = 0,
    .color = DETACHED_ATTRIBUTE_COLOR,
    .size = DEFAULT_ATTR_SIZE,
    .visibility = INVISIBLE,
    .show_name_value = SHOW_NAME_VALUE,
    .angle = 0,
    .alignment = LOWER_LEFT,
    .num_lines = 1,
    .text = { NULL, },
    // text attribute
    .is_attribute = 1,
    .name = NULL, .value = NULL
};

line_t *lines[MAX_LINE_COUNT];
int line_count;

pin_t *pins[MAX_PIN_COUNT];
int pin_count;

circle_t *circles[MAX_CIRCLE_COUNT];
int circle_count;

arc_t *arcs[MAX_ARC_COUNT];
int arc_count;

text_t *texts[MAX_TEXT_COUNT];
int text_count;

path_t *paths[MAX_PATH_COUNT];
int path_count;


enum {
    ATTR_REFDES = 0,
    ATTR_VALUE,
    ATTR_DEVICE,
    ATTR_GRAPHICAL,
    ATTR_DESCRIPTION,
    ATTR_DOCUMENTATION,
    ATTR_AUTHOR,
    ATTR_DIST_LICENSE,
    ATTR_USE_LICENSE,
    ATTR_FOOTPRINT,
    ATTR_NUMSLOTS,
    ATTR_SLOTDEF_1,
    ATTR_SLOTDEF_2,
    ATTR_SLOTDEF_3,
    ATTR_SLOTDEF_4,
    ATTR_SLOTDEF_5,
    ATTR_SLOTDEF_6,
    ATTR_SLOTDEF_7,
    ATTR_SLOTDEF_8,
    ATTR_SLOTDEF_9,
    ATTR_SLOTDEF_10,
    ATTR_SLOT
};
#define ATTR_SLOTDEF_MAX ATTR_SLOTDEF_10

const char *const defined_attr[] = {
    "refdes=",
    "value=",
    "device=",
    "graphical=",
    "description=",
    "documentation=",
    "author=",
    "dist-license=",
    "use-license=",
    "footprint=",
    "numslots=",
    "slotdef=1:",
    "slotdef=2:",
    "slotdef=3:",
    "slotdef=4:",
    "slotdef=5:",
    "slotdef=6:",
    "slotdef=7:",
    "slotdef=8:",
    "slotdef=9:",
    "slotdef=10:",
    "slot="
};

text_t *attrs[MAX_ATTR_COUNT];
int attr_count;

int min_x, min_y;
int off_x, off_y;
int max_x, max_y;


static int is_attr(const char *str)
{
    int i;
    if (str == NULL) {
        return 0;
    }
    i = 0;
    while (('a' <= str[i] && str[i] <= 'z') || ('A' <= str[i] && str[i] <= 'Z') || ('0' <= str[i] && str[i] <= '9' && i > 0) || (str[i] == '-' || str[i] == '_')) {
        ++i;
    }
    return (str[i] == '=' && i > 0) ? i : 0;
}

static int is_defined_attr(const char *attr)
{
    for (unsigned int i = 0; i < array_size(defined_attr); ++i) {
        if (strncmp(attr, defined_attr[i], strlen(defined_attr[i])) == 0) {
            return i;
        }
    }
    return -1;
}

static int floor100(int value)
{
    const int div = value / 100;
    return div * 100;
}

static int ceil100(int value)
{
    const int div = value / 100;
    const int mod = value % 100;
    return mod == 0 ? div * 100 : (div+1) * 100;
}

#if 0
static int is_vertical_line(const line_t *line)
{
    return line->x1 == line->x2;
}

static int is_horizontal_line(const line_t *line)
{
    return line->y1 == line->y2;
}
#endif

static int is_vertical_pin(const pin_t *pin)
{
    return pin->x1 == pin->x2;
}

static int is_horizontal_pin(const pin_t *pin)
{
    return pin->y1 == pin->y2;
}

void fixup_line(line_t *line)
{
    if (line->linewidth <= THIN_LINE_WIDTH) {
        line->linewidth = THIN_LINE_WIDTH;
    }
    if (line->linewidth >= THICK_LINE_WIDTH) {
        line->linewidth = THICK_LINE_WIDTH;
    }
    if (line->capstyle != 3 && (line->x1 > line->x2 || (line->x1 == line->x2 && line->y1 > line->y2))) {
        int tmp;
        tmp = line->x1;
        line->x1 = line->x2;
        line->x2 = tmp;
        tmp = line->y1;
        line->y1 = line->y2;
        line->y2 = tmp;
    }
}

void fixup_circle(circle_t *circle)
{
    if (circle->linewidth <= 1) {
        circle->linewidth = THIN_LINE_WIDTH;
    }
}

void fixup_arc(arc_t *arc)
{
    if (arc->linewidth <= 1) {
        arc->linewidth = THIN_LINE_WIDTH;
    }
}

void fixup_text(text_t *text)
{
    text->size = DEFAULT_TEXT_SIZE;
}

void fixup_path(/*path_t *path*/)
{
}

void fixup_attr(text_t *attr, int visibility)
{
    if (attr == NULL) {
        return;
    }
    attr->type = OBJ_TEXT;
    attr->visibility = visibility;
    if (visibility == INVISIBLE) {
        attr->x = attr->y = 0;
    }
    attr->color = DETACHED_ATTRIBUTE_COLOR;
    attr->size = DEFAULT_ATTR_SIZE;
    attr->show_name_value = (visibility == INVISIBLE ? SHOW_NAME_VALUE : SHOW_VALUE);
    attr->angle = 0;
    attr->alignment = (visibility == INVISIBLE ? LOWER_LEFT : LOWER_MIDDLE);
}

void split_line_by_logic_bubble()
{
    for (int i = 0; i < pin_count; ++i) {
        const pin_t *pin = pins[i];
        if (pin->endstyle != PIN_INV) {
            continue;
        }
        const int x = pin->x2, y = pin->y2;
        for (int l = 0; l < line_count; ++l) {
            line_t *line = lines[l];
            if (line == NULL) {
                continue;
            }
            if (x == line->x1 && x == line->x2) { // lays on vertical line?
                if (line->y1 < y && y < line->y2) {
                    line_t *tail = calloc(1, sizeof (*tail));
                    *tail = *line;
                    line->y2 = y - RADIUS;
                    tail->y1 = y + RADIUS;
                    lines[line_count++] = tail;
                    break;
                }
                if (line->y2 < y && y < line->y1) {
                    line_t *tail = calloc(1, sizeof (*tail));
                    *tail = *line;
                    line->y2 = y + RADIUS;
                    tail->y1 = y - RADIUS;
                    lines[line_count++] = tail;
                    break;
                }
                continue;
            }
            if (y == line->y1 && y == line->y2) { // lays on horizontal line?
                if (line->x1 < x && x < line->x2) {
                    line_t *tail = calloc(1, sizeof (*tail));
                    *tail = *line;
                    line->x2 = x - RADIUS;
                    tail->x1 = x + RADIUS;
                    lines[line_count++] = tail;
                    break;
                }
                if (line->x2 < x && x < line->x1) {
                    line_t *tail = calloc(1, sizeof (*tail));
                    *tail = *line;
                    line->x2 = x + RADIUS;
                    tail->x1 = x - RADIUS;
                    lines[line_count++] = tail;
                    break;
                }
                continue;
            }
        }
    }
}

void fixup_pin(pin_t *pin)
{
    /* set start at 1st pin */
    if (pin->whichend != 0) {
        pin->whichend = 0;
        swap2(&pin->x1, &pin->x2);
        swap2(&pin->y1, &pin->y2);
    }
    pin->endstyle = PIN_NORMAL;

}

void fixup_pin_attrs(pin_t *pin)
{
    if (pin == NULL) {
        return;
    }

    const int x = pin->x2;
    const int y = pin->y2;
    const int dir = pin->x1 <= pin->x2 ? 1 : -1;

    //pintype
    if (pin->attr_pintype != NULL) {
        fixup_attr(pin->attr_pintype, INVISIBLE);
        pin->attr_pintype->x = x;
        pin->attr_pintype->y = y;
        pin->attr_pintype->size = DEFAULT_ATTR_SIZE;
        pin->attr_pintype->color = ATTRIBUTE_COLOR;
        pin->attr_pintype->alignment = dir > 0 ? LOWER_LEFT : LOWER_RIGHT;
    }
    //pinlabel
    if (pin->attr_pinlabel != NULL) {
        fixup_attr(pin->attr_pinlabel, pin->attr_pinlabel->visibility); // do not change
        pin->attr_pinlabel->x = dir > 0 ? x + 75 : x - 75;
        pin->attr_pinlabel->y = y;
        pin->attr_pinlabel->size = DEFAULT_ATTR_SIZE;
        pin->attr_pinlabel->color = TEXT_COLOR;
        pin->attr_pinlabel->show_name_value = SHOW_VALUE;
        pin->attr_pinlabel->alignment = dir > 0 ? MIDDLE_LEFT : MIDDLE_RIGHT;
    }
    //pinnumber
    if (pin->attr_pinnumber != NULL) {
        fixup_attr(pin->attr_pinnumber, pin->attr_pinnumber->visibility); // do not change
        pin->attr_pinnumber->x = dir > 0 ? x - 50 : x + 50;
        pin->attr_pinnumber->y = y + 45;
        pin->attr_pinnumber->size = DEFAULT_ATTR_SIZE;
        pin->attr_pinnumber->color = ATTRIBUTE_COLOR;
        pin->attr_pinnumber->show_name_value = SHOW_VALUE;
        pin->attr_pinnumber->alignment = dir > 0 ? LOWER_RIGHT : LOWER_LEFT;
    }
    //pinseq
    if (pin->attr_pinseq != NULL) {
        fixup_attr(pin->attr_pinseq, INVISIBLE);
        pin->attr_pinseq->x = x;
        pin->attr_pinseq->y = y;
        pin->attr_pinseq->size = DEFAULT_ATTR_SIZE;
        pin->attr_pinseq->color = ATTRIBUTE_COLOR;
        pin->attr_pinseq->alignment = (dir > 0 ? UPPER_LEFT : UPPER_RIGHT);
    }
}

/* from left_to_right */
static int pins_order_by_position(const void *arg1, const void *arg2)
{
    const pin_t **pin1 = (const pin_t **) arg1;
    const pin_t **pin2 = (const pin_t **) arg2;
    if ((*pin1)->x2 == (*pin2)->x2) {
        return (*pin2)->y2 - (*pin1)->y2;
    }
    return (*pin1)->x2 - (*pin2)->x2;
}

static inline int line_length(const line_t *line)
{
    return max(abs(line->x1 - line->x2), abs(line->y1 - line->y2));
}

static int lines_order_by_length(const void *arg1, const void *arg2)
{
    const line_t **line1 = (const line_t **) arg1;
    const line_t **line2 = (const line_t **) arg2;
    return line_length(*line2) - line_length(*line1);
}

void enumerate_pinseq()
{
    for (int i = 0; i < pin_count; ++i) {
        char buffer[16];
        pin_t *pin = pins[i];
        fixup_pin_attrs(pin);
        snprintf(buffer, sizeof buffer, "%d", i+1);
        if (pin->attr_pinseq->value != NULL) {
            free(pin->attr_pinseq->value);
        }
        pin->attr_pinseq->value = strdup(buffer);
    }
}

static void get_image_dimension(int *x1, int *y1, int *x2, int *y2)
{
    int x_min = INT_MAX, y_min = INT_MAX;
    int x_max = INT_MIN, y_max = INT_MIN;
    for (int i = 0; i < line_count; ++i) {
        line_t *line = lines[i];
        if (line == NULL) {
            continue;
        }
        if (abs(line->x1 - line->x2) <= 100 && abs(line->y1 - line->y2) <= 100) {
            continue;
        }
        x_min = min(x_min, min(line->x1, line->x2));
        y_min = min(y_min, min(line->y1, line->y2));
        x_max = max(x_max, max(line->x1, line->x2));
        y_max = max(y_max, max(line->y1, line->y2));
    }
    for (int i = 0; i < pin_count; ++i) {
        pin_t *pin = pins[i];
        if (pin == NULL) {
            continue;
        }
        x_min = min(x_min, pin->x2);
        y_min = min(y_min, pin->y2);
        x_max = max(x_max, pin->x2);
        y_max = max(y_max, pin->y2);
    }
    for (int i = 0; i < circle_count; ++i) {
        circle_t *circle = circles[i];
        if (circle == NULL) {
            continue;
        }
        if (circle->radius <= 100) {
            continue;
        }
        x_min = min(x_min, circle->x - circle->radius);
        y_min = min(y_min, circle->y - circle->radius);
        x_max = max(x_max, circle->x + circle->radius);
        y_max = max(y_max, circle->y + circle->radius);
    }
    *x1 = x_min != INT_MAX ? x_min : 0;
    *y1 = y_min != INT_MAX ? y_min : 0;
    *x2 = x_max != INT_MIN ? x_max : 0;
    *y2 = y_max != INT_MIN ? y_max : 0;
}

static void get_symbol_dimension(int *x1, int *y1, int *x2, int *y2)
{
    int x_min, y_min;
    int x_max, y_max;

    get_image_dimension(&x_min, &y_min, &x_max, &y_max);
    for (int i = 0; i < pin_count; ++i) {
        pin_t *pin = pins[i];
        if (pin == NULL) {
            continue;
        }
        x_min = min(x_min, pin->x1);
        y_min = min(y_min, pin->y1);
        x_max = max(x_max, pin->x1);
        y_max = max(y_max, pin->y1);
    }
    *x1 = x_min;
    *y1 = y_min;
    *x2 = x_max;
    *y2 = y_max;
}


line_t *new_line()
{
    line_t *line = malloc(sizeof *line);
    *line = default_line;
    return line;
}

text_t *new_attr(const char *name, const char *value)
{
    text_t *attr = malloc(sizeof *attr);
    *attr = detached_attr;
    if (name != NULL) {
        attr->name = strdup(name);
        attr->is_attribute = strlen(name);
    }
    if (value != NULL) {
        attr->value = strdup(value);
    }
    return attr;
}

void free_attr(text_t *attr)
{
    if (attr == NULL) {
        return;
    }
    if (attr->name != NULL) {
        free(attr->name);
        attr->name = NULL;
    }
    if (attr->value != NULL) {
        free(attr->value);
        attr->value = NULL;
    }
    for (int i = 0; i < MAX_TEXT_LINES_COUNT; i++) {
        if (attr->text[i] != NULL) {
            free(attr->text[i]);
            attr->text[i] = NULL;
        }
    }
    free(attr);
}

/* currently unused */
void out_rect(FILE *out, const rect_t *rect)
{
    if (rect == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", rect->type,
            rect->x - off_x, rect->y - off_y, rect->width, rect->height, rect->color, rect->linewidth,
            rect->capstyle, rect->dashstyle, rect->dashlength, rect->dashspace,
            rect->filltype, rect->fillwidth, rect->angle1, rect->pitch1, rect->angle2, rect->pitch2);

}

void out_line(FILE *out, const line_t *line)
{
    if (line == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d %d\n",  line->type,
            line->x1 - off_x, line->y1 - off_y, line->x2 - off_x, line->y2 - off_y,
            line->color, line->linewidth,
            line->capstyle, line->dashstyle, line->dashlength, line->dashspace);

}
void out_circle(FILE *out, const circle_t *circle)
{
    if (circle == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", circle->type,
            circle->x - off_x, circle->y - off_y, circle->radius,
            circle->color, circle->linewidth,
            circle->capstyle, circle->dashstyle, circle->dashlength, circle->dashspace,
            circle->filltype, circle->fillwidth, circle->angle1, circle->pitch1, circle->angle2, circle->pitch2);
}

void out_arc(FILE *out, const arc_t *arc)
{
    if (arc == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d %d %d\n", arc->type,
            arc->x - off_x, arc->y - off_y,
            arc->radius, arc->startangle, arc->sweepangle,
            arc->color, arc->linewidth,
            arc->capstyle, arc->dashstyle, arc->dashlength, arc->dashspace);

}

void out_text(FILE *out, const text_t *text)
{
    if (text == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d\n", text->type,
            text->x - off_x, text->y - off_y, text->color,
            text->size, text->visibility, text->show_name_value,
            text->angle, text->alignment,
            text->num_lines);
    if (text->is_attribute) {
        fprintf(out, "%s=%s\n", text->name, text->value);
    } else {
        for (int i = 0; i < text->num_lines; i++) {
            fprintf(out, "%s\n", text->text[i]);
        }
    }
}

void out_pin(FILE *out, const pin_t *pin)
{
    if (pin == NULL) {
        return;
    }
    int x2 = pin->x2, y2 = pin->y2;

    if (pin->endstyle == PIN_INV) {
        if (is_horizontal_pin(pin)) {
            x2 += pin->x1 < pin->x2 ? -50 : +50;
        }
        if (is_vertical_pin(pin)) {
            y2 += pin->y1 < pin->y2 ? -50 : +50;
        }
    }
    //TODO recalculate attribute positions
    fprintf(out, "%c %d %d %d %d %d %d %d\n", pin->type,
            pin->x1 - off_x, pin->y1 - off_y, x2 - off_x, y2 - off_y, pin->color,
            pin->pintype, pin->whichend);
    fprintf(out, "{\n");
    out_text(out, pin->attr_pintype);
    out_text(out, pin->attr_pinlabel);
    out_text(out, pin->attr_pinnumber);
    out_text(out, pin->attr_pinseq);
    for (int i = 0; i < pin->attr_count; ++i) {
        out_text(out, pin->attrs[i]);
    }
    fprintf(out, "}\n");
    /* logic bubble */
    if (pin->endstyle == PIN_INV) {
        circle_t bubble = logic_bubble;
        bubble.x = pin->x2;
        bubble.y = pin->y2;
        out_circle(out, &bubble);
    }
    if (pin->endstyle == PIN_UP || pin->endstyle == PIN_XCROSS) {
        line_t line = default_line;
        line.x1 = pin->x2 - RADIUS;
        line.y1 = pin->y2 - RADIUS;
        line.x2 = pin->x2 + RADIUS;
        line.y2 = pin->y2 + RADIUS;
        out_line(out, &line);
    }
    if (pin->endstyle == PIN_DOWN || pin->endstyle == PIN_XCROSS) {
        line_t line = default_line;
        line.x1 = pin->x2 - RADIUS;
        line.y1 = pin->y2 + RADIUS;
        line.x2 = pin->x2 + RADIUS;
        line.y2 = pin->y2 - RADIUS;
        out_line(out, &line);
    }
}

void out_path(FILE *out, const path_t *path)
{
    if (path == NULL) {
        return;
    }
    fprintf(out, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d\n",
            path->type,
            path->color,
            path->width,
            path->capstyle,
            path->dashstyle, path->dashlength, path->dashspace,
            path->filltype, path->fillwidth,
            path->angle1, path->pitch1,
            path->angle2, path->pitch2,
            path->num_lines);
    for (int i = 0; i < path->num_lines; ++i) {
        switch (path->data[i].type) {
        case 'M':
        case 'L':
            fprintf(out, "%c %d,%d\n", path->data[i].type, path->data[i].x - off_x, path->data[i].y - off_y);
            break;
        case 'C':
            fprintf(out, "%c %d,%d %d,%d %d,%d\n", path->data[i].type,
                    path->data[i].x1 - off_x, path->data[i].y1 - off_y,
                    path->data[i].x2 - off_x, path->data[i].y2 - off_y,
                    path->data[i].x - off_x, path->data[i].y - off_y);
            break;
        case 'z':
        case 'Z':
            fprintf(out, "%c\n", path->data[i].type);
            break;
        }
    }
}

int main(/*int argc, char *argv[], char *envp[]*/)
{
    FILE *in = stdin;
    FILE *out = stdout;
    char buffer[1024];
    pin_t *current_pin;

    /* init */
    line_count = 0;
    for (unsigned int i = 0; i < array_size(lines); ++i) {
        lines[i] = NULL;
    }
    circle_count = 0;
    for (unsigned int i = 0; i < array_size(circles); ++i) {
        circles[i] = NULL;
    }
    arc_count = 0;
    for (unsigned int i = 0; i < array_size(arcs); ++i) {
        arcs[i] = NULL;
    }
    text_count = 0;
    for (unsigned int i = 0; i < array_size(texts); ++i) {
        texts[i] = NULL;
    }
    attr_count = array_size(defined_attr);
    for (unsigned int i = 0; i < array_size(attrs); ++i) {
        attrs[i] = NULL;
    }
    pin_count = 0;
    for (unsigned int i = 0; i < array_size(pins); ++i) {
        pins[i] = NULL;
    }
    current_pin = NULL;
    path_count = 0;
    for (unsigned int i = 0; i < array_size(paths); ++i) {
        paths[i] = NULL;
    }

    /* read file */
    while (!feof(in)) {
        rect_t rect;
        line_t *line = NULL;
        circle_t *circle = NULL;
        arc_t *arc = NULL;
        text_t *text = NULL;
        pin_t *pin = NULL;
        path_t *path = NULL;
        if (fgets(buffer, sizeof buffer, in) != buffer) {
            break;
        }
        switch (buffer[0]) {
        case OBJ_LINE:
            line = new_line();
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d %d",  &line->type,
                   &line->x1, &line->y1, &line->x2, &line->y2, &line->color, &line->linewidth,
                   &line->capstyle, &line->dashstyle, &line->dashlength, &line->dashspace);
            lines[line_count++] = line;
            break;
        case OBJ_BOX:
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", &rect.type,
                   &rect.x, &rect.y, &rect.width, &rect.height, &rect.color, &rect.linewidth,
                   &rect.capstyle, &rect.dashstyle, &rect.dashlength, &rect.dashspace,
                   &rect.filltype, &rect.fillwidth, &rect.angle1, &rect.pitch1, &rect.angle2, &rect.pitch2);
            /* top */
            line = new_line();
            line->x1 = rect.x;
            line->y1 = rect.y;
            line->x2 = rect.x + rect.width;
            line->y2 = rect.y;
            lines[line_count++] = line;
            /* right */
            line = new_line();
            line->x1 = rect.x + rect.width;
            line->y1 = rect.y;
            line->x2 = rect.x + rect.width;
            line->y2 = rect.y + rect.height;
            lines[line_count++] = line;
            /* bottom */
            line = new_line();
            line->x1 = rect.x + rect.width;
            line->y1 = rect.y + rect.height;
            line->x2 = rect.x;
            line->y2 = rect.y + rect.height;
            lines[line_count++] = line;
            /* left */
            line = new_line();
            line->x1 = rect.x;
            line->y1 = rect.y + rect.height;
            line->x2 = rect.x;
            line->y2 = rect.y;
            lines[line_count++] = line;
            break;
        case OBJ_CIRCLE:
            circle = calloc(1, sizeof(*circle));
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", &circle->type,
                   &circle->x, &circle->y, &circle->radius, &circle->color, &circle->linewidth,
                   &circle->capstyle, &circle->dashstyle, &circle->dashlength, &circle->dashspace,
                   &circle->filltype, &circle->fillwidth, &circle->angle1, &circle->pitch1, &circle->angle2, &circle->pitch2);
            circles[circle_count++] = circle;
            break;
        case OBJ_ARC:
            arc = calloc(1, sizeof(*arc));
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d %d %d", &arc->type,
                   &arc->x, &arc->y,
                   &arc->radius, &arc->startangle, &arc->sweepangle,
                   &arc->color, &arc->linewidth,
                   &arc->capstyle, &arc->dashstyle, &arc->dashlength, &arc->dashspace);
            arcs[arc_count++] = arc;
            break;
        case OBJ_TEXT:
            text = calloc(1, sizeof(*text));
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d", &text->type,
                   &text->x, &text->y, &text->color,
                   &text->size, &text->visibility, &text->show_name_value,
                   &text->angle, &text->alignment,
                   &text->num_lines);
            if (text->num_lines > MAX_TEXT_LINES_COUNT) {
                fprintf(stderr, "ERROR: atttribute text too long");
                return -1;
            }
            for (int i = 0; i < text->num_lines; ++i) {
                fgets(buffer, sizeof buffer, in);
                buffer[strlen(buffer) - 1] = 0;
                text->text[i] = strdup(buffer);
            }
            text->is_attribute = is_attr(buffer);
            if (text->is_attribute != 0) {
                text->name = strndup(buffer, text->is_attribute);
                text->value = strdup(buffer + text->is_attribute + 1);
            } else {
                text->name = NULL;
                text->value = NULL;
            }
            if (current_pin == NULL) {
                if (text->num_lines == 1 && text->is_attribute) { /* detached attribute */
                    int set_defined = is_defined_attr(buffer);
                    if (set_defined >= 0) {
                        attrs[set_defined] = text;
                    } else {
                        attrs[attr_count++] = text;
                    }
                } else { /* free text */
                    texts[text_count++] = text;
                }
            } else { /* pin attribute */
                if (strcmp(text->name, "pintype") == 0) {
                    current_pin->attr_pintype = text;
                } else if (strcmp(text->name, "pinlabel") == 0) {
                    current_pin->attr_pinlabel = text;
                } else if (strcmp(text->name, "pinnumber") == 0) {
                    current_pin->attr_pinnumber = text;
                    current_pin->pinnumber = atoi(text->value);
                } else if (strcmp(text->name, "pinseq") == 0) {
                    current_pin->attr_pinseq = text;
                } else {
                    current_pin->attrs[current_pin->attr_count++] = text;
                }
            }
            break;
        case OBJ_PIN:
            pin = calloc(1, sizeof(*pin));
            sscanf(buffer, "%c %d %d %d %d %d %d %d", &pin->type,
                   &pin->x1, &pin->y1, &pin->x2, &pin->y2, &pin->color,
                   &pin->pintype, &pin->whichend);
            pins[pin_count++] = pin;
            current_pin = pin;
            break;
        case OBJ_PATH:
            path = calloc(1, sizeof(*path));
            sscanf(buffer, "%c %d %d %d %d %d %d %d %d %d %d %d %d %d",
                   &path->type,
                   &path->color,
                   &path->width,
                   &path->capstyle,
                   &path->dashstyle, &path->dashlength, &path->dashspace,
                   &path->filltype, &path->fillwidth,
                   &path->angle1, &path->pitch1,
                   &path->angle2, &path->pitch2,
                   &path->num_lines);
            for (int i = 0; i < path->num_lines; ++i) {
                fgets(buffer, sizeof buffer, in);
                buffer[strlen(buffer) - 1] = 0;
                switch (buffer[0]) {
                case 'M':
                case 'L':
                    sscanf(buffer, "%c %d,%d", &path->data[i].type, &path->data[i].x, &path->data[i].y);
                    break;
                case 'C':
                    sscanf(buffer, "%c %d,%d %d,%d %d,%d", &path->data[i].type,
                           &path->data[i].x1, &path->data[i].y1,
                           &path->data[i].x2, &path->data[i].y2,
                           &path->data[i].x,&path->data[i].y);
                    break;
                case 'z':
                case 'Z':
                    sscanf(buffer, "%c", &path->data[i].type);
                    break;
                }
            }
            paths[path_count++] = path;
            break;

        case STARTATTACH_ATTR:
            break;
        case ENDATTACH_ATTR:
            current_pin = NULL;
            break;
        case VERSION_CHAR:
            break;
        case COMMENT:
            break;
        default:
            break;
        }
    }
    fclose(in);

    /* fixups */
    for (int i = 0; i < line_count; ++i) {
        fixup_line(lines[i]);
    }
    for (int i = 0; i < circle_count; ++i) {
        fixup_circle(circles[i]);
    }
    for (int i = 0; i < arc_count; ++i) {
        fixup_arc(arcs[i]);
    }
    for (int i = 0; i < text_count; ++i) {
        fixup_text(texts[i]);
    }
    for (int i = 0; i < attr_count; ++i) {
        if (attrs[i] != NULL) {
            fixup_attr(attrs[i], (i == ATTR_REFDES || i == ATTR_VALUE) ? VISIBLE : INVISIBLE);
        }
    }
    for (int i = 0; i < path_count; ++i) {
        fixup_path(paths[i]);
    }
    for (int i = 0; i < pin_count; ++i) {
        fixup_pin(pins[i]);
    }
    /* continue fixuping pins */
    /* attach logic bubbles to pin */
    for (int j = 0; j < pin_count; ++j) {
        for (int i = 0; i < circle_count; ++i) {
            if (is_horizontal_pin(pins[j])) {
                if (abs(circles[i]->x - pins[j]->x2) <= RADIUS + 10 && circles[i]->y == pins[j]->y2) {
                    /* attach circle to pin and remove from global circles */
                    pins[j]->x2 = circles[i]->x;
                    pins[j]->endstyle = PIN_INV;
                    free(circles[i]);
                    circles[i] = circle_count > 0 ? circles[--circle_count] : NULL;
                    break;
                }
            }
            if (is_vertical_pin(pins[j])) {
                if (abs(circles[i]->y - pins[j]->y2) <= RADIUS + 10 && circles[i]->x == pins[j]->x2) {
                    pins[j]->y2 = circles[i]->y;
                    pins[j]->endstyle = PIN_INV;
                    free(circles[i]);
                    circles[i] = circle_count > 0 ? circles[--circle_count] : NULL;
                    break;
                }
            }
        }
    }

    /* sort somehow */
    qsort(pins, pin_count, sizeof pins[0], pins_order_by_position);
    /* set pinseq to pin order */
    enumerate_pinseq();

    split_line_by_logic_bubble();
    //TODO attach logic bubbles to pin with pinlabel=\_..\_
    qsort(lines, line_count, sizeof lines[0], lines_order_by_length);
    /* attach clocking lines to pin */
    for (int j = 0; j < pin_count; ++j) {
        pin_t * const pin = pins[j];
        for (int i = 0; i < line_count; ++i) {
            if (abs(lines[i]->x1 - lines[i]->x2) >= 2*(RADIUS + 10) || abs(lines[i]->y1 - lines[i]->y2) >= 2*(RADIUS + 10)) {
                continue;
            }
            const int x = (lines[i]->x1 + lines[i]->x2) / 2;
            const int y = (lines[i]->y1 + lines[i]->y2) / 2;
            if (x != pin->x2 || y != pin->y2) {
                continue;
            }
            if (pin->endstyle == PIN_UP && lines[i]->y1 > lines[i]->y2) {
                pin->endstyle = PIN_XCROSS;
            } else if (pin->endstyle == PIN_DOWN && lines[i]->y1 < lines[i]->y2) {
                pin->endstyle = PIN_XCROSS;
            } else {
                pin->endstyle = lines[i]->y1 < lines[i]->y2 ? PIN_UP : PIN_DOWN;
            }
            free(lines[i]);
            /* replace current line with last one and restart search from current position */
            lines[i--] = line_count > 0 ? lines[--line_count] : NULL;
        }
    }

    /* get dimensions */
    int symbol_x1, symbol_y1, symbol_x2, symbol_y2;
    int image_x1, image_y1, image_x2, image_y2;

    get_symbol_dimension(&symbol_x1, &symbol_y1, &symbol_x2, &symbol_y2);
    get_image_dimension(&image_x1, &image_y1, &image_x2, &image_y2);
    /* round dimensions to 100 mil */
    symbol_x1 = floor100(symbol_x1);
    symbol_y1 = floor100(symbol_y1);
    symbol_x2 = ceil100(symbol_x2);
    symbol_y2 = ceil100(symbol_y2);
    image_x1 = floor100(image_x1);
    image_y1 = floor100(image_y1);
    image_x2 = ceil100(image_x2);
    image_y2 = ceil100(image_y2);
    off_x = symbol_x1;
    off_y = symbol_y1; /* put over the value attribute */
#if 0
    if (attrs[ATTR_REFDES] == NULL) {
        attrs[ATTR_REFDES] = new_attr("refdes", "?");
    }
    attrs[ATTR_REFDES]->visibility = VISIBLE;
    attrs[ATTR_REFDES]->show_name_value = SHOW_VALUE;
    attrs[ATTR_REFDES]->alignment = MIDDLE_MIDDLE;
    attrs[ATTR_REFDES]->x = (image_x1 + image_x2) / 2;
    attrs[ATTR_REFDES]->y = symbol_y2 + 300;

    if (attrs[ATTR_VALUE] == NULL) {
        attrs[ATTR_VALUE] = new_attr("value", "?");
    }
    attrs[ATTR_VALUE]->visibility = VISIBLE;
    attrs[ATTR_VALUE]->show_name_value = SHOW_VALUE;
    attrs[ATTR_VALUE]->alignment = MIDDLE_MIDDLE;
    attrs[ATTR_VALUE]->x = (image_x1 + image_x2) / 2;
    attrs[ATTR_VALUE]->y = symbol_y2 + 100;

    if (attrs[ATTR_DEVICE] == NULL) {
        attrs[ATTR_DEVICE] = new_attr("device", "?");
    }

    if (attrs[ATTR_DESCRIPTION] == NULL) {
        attrs[ATTR_DESCRIPTION] = new_attr("description", "?");
    }
    /*
        if (attrs[ATTR_DOCUMENTATION] == NULL) {
            attrs[ATTR_DOCUMENTATION] = new_attr("documentation", "?");
        }
    */
    free_attr(attrs[ATTR_AUTHOR]);
    attrs[ATTR_AUTHOR] = new_attr("author", "Sergey Stepanov <no.such.process@gmail.com>");

    free_attr(attrs[ATTR_DIST_LICENSE]);
    attrs[ATTR_DIST_LICENSE] = new_attr("dist-license", "CC BY-NC-SA 4.0");

    free_attr(attrs[ATTR_USE_LICENSE]);
    attrs[ATTR_USE_LICENSE] = new_attr("use-license", "personal use only");

    if (attrs[ATTR_FOOTPRINT] == NULL) {
        attrs[ATTR_FOOTPRINT] = new_attr("footprint", "?");
    }
#endif
    /* remove all slot definitions if numslots=0 or undefined */
    if (attrs[ATTR_NUMSLOTS] == NULL || strcmp(attrs[ATTR_NUMSLOTS]->value, "0") == 0) {
        for (int i = ATTR_SLOTDEF_1; i <= ATTR_SLOTDEF_MAX; ++i) {
            free_attr(attrs[i]);
            attrs[i] = NULL;
        }
        free_attr(attrs[ATTR_NUMSLOTS]);
        attrs[ATTR_NUMSLOTS] = NULL;
    }
    /* clear slot= attribute */
    free_attr(attrs[ATTR_SLOT]);
    attrs[ATTR_SLOT] = NULL;

    /* process graphical attribute */
    if (attrs[ATTR_GRAPHICAL] != NULL && strcmp(attrs[ATTR_GRAPHICAL]->value, "1") == 0) {
        free_attr(attrs[ATTR_DEVICE]); attrs[ATTR_DEVICE] = new_attr("device", "none");
        free_attr(attrs[ATTR_VALUE]); attrs[ATTR_VALUE] = NULL;
        free_attr(attrs[ATTR_REFDES]); attrs[ATTR_REFDES] = NULL;
        free_attr(attrs[ATTR_FOOTPRINT]); attrs[ATTR_FOOTPRINT] = NULL;
    }

    int real_attr_count = 0;
    /* skip refdes= and value= attributes */
    for (int i = ATTR_DEVICE; i < attr_count; ++i) {
        if (attrs[i] != NULL) {
            ++real_attr_count;
        }
    }

    /* put attributes in place */
    for (int i = ATTR_DEVICE; i < attr_count; ++i) {
        if (attrs[i] == NULL) {
            continue;
        }
        attrs[i]->x = off_x;
        attrs[i]->y = (--real_attr_count) * 200 + symbol_y2 + 400;
    }

    /* save file */
    fprintf(out, "v %d %d\n", 20140308, 2);
    /* lines */
    for (int i = 0; i < line_count; ++i) {
        out_line(out, lines[i]);
    }
    /* circles */
    for (int i = 0; i < circle_count; ++i) {
        out_circle(out, circles[i]);
    }
    /* arcs */
    for (int i = 0; i < arc_count; ++i) {
        out_arc(out, arcs[i]);
    }
    /* free text */
    for (int i = 0; i < text_count; ++i) {
        out_text(out, texts[i]);
    }
    /* paths */
    for (int i = 0; i < path_count; ++i) {
        out_path(out, paths[i]);
    }
    /* pins */
    for (int i = 0; i < pin_count; ++i) {
        out_pin(out, pins[i]);
    }
    /* attributes */
    for (int i = 0; i < attr_count; ++i) {
        out_text(out, attrs[i]);
    }
#ifdef NDEBUG
    fprintf(stderr, "lines:   %d/%d\n", line_count, MAX_LINE_COUNT);
    fprintf(stderr, "circles: %d/%d\n", circle_count, MAX_CIRCLE_COUNT);
    fprintf(stderr, "arcs:    %d/%d\n", arc_count, MAX_ARC_COUNT);
    fprintf(stderr, "texts:   %d/%d\n", text_count, MAX_TEXT_COUNT);
    fprintf(stderr, "pins:    %d/%d\n", pin_count, MAX_PIN_COUNT);
    fprintf(stderr, "attrs:   %d/%d\n", attr_count, MAX_ATTR_COUNT);
    fprintf(stderr, "paths:   %d/%d\n", path_count, MAX_PATH_COUNT);
#endif
#ifdef USE_JSON
    /* attributes */
    fprintf(out, "[\n");
    for (int i = 0; i < attr_count; ++i) {
        text_t *text = attrs[i];
        char *equ = strchr(text->text[0], '=');
        *equ = 0;
        fprintf(out, "  \"%s\" : \"%s\"%s", text->text[0], equ + 1, i < attr_count - 1 ? ",\n" : "\n");
    }
    fprintf(out, "]\n");
#endif
    return 0;
}
