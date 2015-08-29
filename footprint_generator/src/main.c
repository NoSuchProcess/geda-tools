#define _DEFAULT_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>
#include "pcb_element.h"
#include "args.h"

#ifdef __cplusplus
extern "C" {
#endif

void chip(const args_t *args);
void dil(const args_t *args);
void so(const args_t *args);
void qfp(const args_t *args);
void conn(const args_t *args);

#ifdef __cplusplus
}
#endif

void parse_args(int argc, char* argv[], args_t *args)
{
    static const struct option long_options[] = {
        {"module", required_argument, NULL, 1},
        {"name", required_argument, NULL, 2},
        {"pins", required_argument, NULL, 3},
        {"pins-x", required_argument, NULL, 4},
        {"pins-y", required_argument, NULL, 5},
        {"pad-width", required_argument, NULL, 6},
        {"pad-length", required_argument, NULL, 7},
        {"round", no_argument, NULL, 8},
        {"pitch", required_argument, NULL, 9},
        {"row", required_argument, NULL, 10},
        {"internal", required_argument, NULL, 11},
        {"internal-x", required_argument, NULL, 12},
        {"internal-y", required_argument, NULL, 13},
        {"external", required_argument, NULL, 14},
        {"external-x", required_argument, NULL, 15},
        {"external-y", required_argument, NULL, 16},
        {"thermal", required_argument, NULL, 17},
        {"thermal-x", required_argument, NULL, 18},
        {"thermal-y", required_argument, NULL, 19},
        {"size", required_argument, NULL, 20},
        {"size-x", required_argument, NULL, 21},
        {"size-y", required_argument, NULL, 22},
        {"rotate", required_argument, NULL, 23},
        {NULL, 0, NULL, 0}
    };
    for (;;) {
        int c = getopt_long_only(argc, argv, "", long_options, NULL);
        if (c == -1) {
            break;
        }
        switch (c) {
        case 1:
            if (strcmp(optarg, "2pin") == 0) {
                args->module = chip;
            }
            else if (strcmp(optarg, "dil") == 0) {
                args->module = dil;
            }
            else if (strcmp(optarg, "so") == 0) {
                args->module = so;
            }
            else if (strcmp(optarg, "qfp") == 0) {
                args->module = qfp;
            }
            else if (strcmp(optarg, "conn") == 0) {
                args->module = conn;
            }
            else {
                fprintf(stderr, "unknown module name '%s'\n", optarg);
            }
            break;
        case 2:
            if (args->name != NULL) {
                free(args->name);
            }
            args->name = strdup(optarg);
            break;
        case 3:
            args->pins = atoi(optarg);
            break;
        case 4:
            args->pins_x = atoi(optarg);
            break;
        case 5:
            args->pins_y = atoi(optarg);
            break;
        case 6:
            args->pad_width = atof(optarg);
            break;
        case 7:
            args->pad_length = atof(optarg);
            break;
        case 8:
            args->round = 1;
            break;
        case 9:
            args->pitch = atof(optarg);
            break;
        case 10:
            args->row = atof(optarg);
            break;
        case 11:
            args->internal = atof(optarg);
            break;
        case 12:
            args->internal_x = atof(optarg);
            break;
        case 13:
            args->internal_y = atof(optarg);
            break;
        case 14:
            args->external = atof(optarg);
            break;
        case 15:
            args->external_x = atof(optarg);
            break;
        case 16:
            args->external_y = atof(optarg);
            break;
        case 17:
            args->thermal = atof(optarg);
            break;
        case 18:
            args->thermal_x = atof(optarg);
            break;
        case 19:
            args->thermal_y = atof(optarg);
            break;
        case 20:
            args->size = atof(optarg);
            break;
        case 21:
            args->size_x = atof(optarg);
            break;
        case 22:
            args->size_y = atof(optarg);
            break;
        case 23:
            args->rotate = atoi(optarg);
            break;
        default:
            break;
        }
    }
}

int main(int argc, char* argv[])
{
    args_t args = {0,};
    parse_args(argc, argv, &args);
    if (args.module != NULL) {
        args.module(&args);
    }
    if (args.name != NULL) {
        free(args.name);
    }

    return (EXIT_SUCCESS);
}
