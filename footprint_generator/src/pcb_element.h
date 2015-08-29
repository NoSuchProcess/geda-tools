/*
 * File:   pcb_element.h
 * Author: cepera
 *
 * Created on 16 сентября 2015 г., 3:28
 */

#ifndef PCB_ELEMENT_H
#define	PCB_ELEMENT_H

#define SILK_WIDTH 0.50
#define DRILL      0.80
#define CLEARANCE  0.50
#define MASK       0.50

#ifdef	__cplusplus
extern "C" {
#endif
    void Attribute(const char *name, const char *value);
    void Pad(double x1, double y1, double x2, double y2, double width, int round, int rotate);
    void Pin(double x, double y, int rotate);
    void ElementArc(double x, double y, int rotate);
    void ElementLine(double x1, double y1, double x2, double y2, double width, int rotate);

#ifdef	__cplusplus
}
#endif

#endif	/* PCB_ELEMENT_H */
