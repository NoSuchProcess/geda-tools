#ifndef ARGS_H
#define	ARGS_H

#ifdef	__cplusplus
extern "C" {
#endif

    typedef struct {
        void (*module)();
        char *name;
        int pins, pins_x, pins_y;
        double pad_width;
        double pad_length;
        int round;
        double pitch;
        double row;
        double internal, internal_x, internal_y;
        double external, external_x, external_y;
        double thermal, thermal_x, thermal_y;
        double size, size_x, size_y;
        int rotate;
    } args_t;

#ifdef	__cplusplus
}
#endif

#endif	/* ARGS_H */

