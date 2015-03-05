#ifndef GEDA_H
#define	GEDA_H

#include <libgeda/defines.h>
//#include <libgeda/struct.h>
//#include <libgeda/globals.h>
#include <libgeda/o_types.h>
//#include <libgeda/funcs.h>
#include <libgeda/colors.h>
//#include <libgeda/papersizes.h>
//#include <libgeda/prototype.h>
//#include <libgeda/edaerrors.h>
//#include <libgeda/geda_list.h>

#ifdef	__cplusplus
extern "C" {
#endif

#define DEFAULT_TEXT_SIZE 8
#define DEFAULT_ATTR_SIZE 8

#define LINE_THICK 8
#define LINE_THIN 4

#define MAX_LINE_COUNT 3000
#define MAX_CIRCLE_COUNT 500
#define MAX_ARC_COUNT 100
#define MAX_TEXT_COUNT 100
#define MAX_TEXT_LINES_COUNT 100
#define MAX_ATTR_COUNT 100
#define MAX_PIN_ATTR_COUNT 10
#define MAX_PIN_COUNT 1000
#define MAX_PATH_COUNT 100
#define MAX_PATH_DATA_COUNT 100

/*! \brief line end style for an open line of an object */
typedef enum {END_NONE, END_SQUARE, END_ROUND} OBJECT_END;

/*! \brief line style of lines, rect, circles, arcs */
typedef enum {TYPE_SOLID, TYPE_DOTTED, TYPE_DASHED, TYPE_CENTER, TYPE_PHANTOM, TYPE_ERASE} OBJECT_TYPE;

/*! \brief fill style of objects like cirle, rect, path */
typedef enum {FILLING_HOLLOW, FILLING_FILL, FILLING_MESH, FILLING_HATCH, FILLING_VOID} OBJECT_FILLING;

typedef enum {PIN_NORMAL = 0, PIN_INV, PIN_UP, PIN_DOWN, PIN_XCROSS} pin_end_t;

//v
typedef struct {
    char type;
    int file_version, lib_version;
} version_t;

//L
typedef struct {
    char type;
    int x1, y1, x2, y2;
    int color;
    int linewidth, capstyle;
    int dashstyle, dashlength, dashspace;
} line_t;

//B
typedef struct {
    char type;
    int x, y, width, height;
    int color;
    int linewidth, capstyle;
    int dashstyle, dashlength, dashspace;
    int filltype, fillwidth;
    int angle1, pitch1, angle2, pitch2;
} rect_t;

//V
typedef struct {
    char type;
    int x, y, radius;
    int color;
    int linewidth, capstyle;
    int dashstyle, dashlength, dashspace;
    int filltype, fillwidth;
    int angle1, pitch1, angle2, pitch2;
} circle_t;

//A
typedef struct {
    char type;
    int x, y, radius;
    int startangle, sweepangle;
    int color;
    int linewidth, capstyle;
    int dashstyle, dashlength, dashspace;
} arc_t;

//T
typedef struct {
    char type;
    int x, y;
    int color;
    int size;
    int visibility;
    int show_name_value;
    int angle;
    int alignment;
    int num_lines;
    char *text[MAX_TEXT_LINES_COUNT];
    // text attribute
    int is_attribute;
    char *name, *value;
} text_t;

//P
typedef struct {
    char type;
    int x1, y1, x2, y2;
    int color;
    int pintype;
    int whichend;
    /* attached to pin attributes */
    text_t *attr_pintype;
    text_t *attr_pinlabel;
    text_t *attr_pinnumber;
    text_t *attr_pinseq;
    int attr_count;
    text_t *attrs[MAX_PIN_ATTR_COUNT];
    /* some values */
    int pinnumber;
    pin_end_t endstyle; /* bubble or dash */
} pin_t;

//H
typedef struct {
    char type;
    int color;
    int width;
    int capstyle;
    int dashstyle;
    int dashlength;
    int dashspace;
    int filltype;
    int fillwidth;
    int angle1;
    int pitch1;
    int angle2;
    int pitch2;
    int num_lines;
    struct {
        char type;
        int x1, y1, x2, y2; /* for curveto */
        int x, y;
    } data[MAX_PATH_DATA_COUNT];
} path_t;

#ifdef	__cplusplus
}
#endif

#endif	/* GEDA_H */
