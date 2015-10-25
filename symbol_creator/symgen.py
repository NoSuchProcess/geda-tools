#!/usr/bin/env python3
import sys

TEXT_SIZE = 8
MAIN_WIDTH = 600    # width of main field
ADD_WIDTH = 600     # with of additional fields
RADIUS = 40
PIN_LENGTH = 200
PIN_SPACE = 200
OFFSET_X = 200
OFFSET_Y = 200

THIN_LINE_WIDTH = 5
THICK_LINE_WIDTH = 10


def main():
    main_width = MAIN_WIDTH
    add_width = ADD_WIDTH
    with open(sys.argv[1], 'rU') as fd:
        pins = fd.readlines()

    value = pins[0].rstrip('\n')
    designation = pins[1].rstrip('\n')

    pins = pins[2:]
    n = pins.__len__()
    # excepts defined attributes
    found = False
    for pin in pins:
        if pin.rstrip() == '':
            found = True
        if found:
            n -= 1
            if pin.startswith('main_width='):
                main_width = int(pin.split('=')[1])
            if pin.startswith('add_width='):
                add_width = int(pin.split('=')[1])

    print('v 20140308 2')
    # | |    | |
    print('L %d 200 %d %d 3 %d 0 0 -1 -1' % (PIN_LENGTH, PIN_LENGTH, 200 + (n + 1) * PIN_SPACE, THICK_LINE_WIDTH))
    print('L %d 200 %d %d 3 %d 0 0 -1 -1' % (PIN_LENGTH + add_width, PIN_LENGTH + add_width, 200 + (n + 1) * PIN_SPACE, THICK_LINE_WIDTH))
    print('L %d 200 %d %d 3 %d 0 0 -1 -1' % (PIN_LENGTH + add_width + main_width, PIN_LENGTH + add_width + main_width, 200 + (n + 1) * PIN_SPACE, THICK_LINE_WIDTH))
    print('L %d 200 %d %d 3 %d 0 0 -1 -1' % (PIN_LENGTH + add_width + main_width + add_width, PIN_LENGTH + add_width + main_width + add_width, 200 + (n + 1) * PIN_SPACE, THICK_LINE_WIDTH))
    # ----------
    print('L %d 200 %d 200 3 %d 0 0 -1 -1' % (PIN_LENGTH, PIN_LENGTH + add_width + main_width + add_width, THICK_LINE_WIDTH))
    print('L %d %d %d %d 3 %d 0 0 -1 -1' % (PIN_LENGTH, 200 + (n + 1) * PIN_SPACE, PIN_LENGTH + add_width + main_width + add_width, 200 + (n + 1) * PIN_SPACE, THICK_LINE_WIDTH))
    # name
    print('T %d %d 9 %d 1 0 0 4 1' % (PIN_LENGTH + (add_width + main_width + add_width) / 2, 200 + n * PIN_SPACE, TEXT_SIZE))
    print('%s' % designation)

    """
    NAME[/|\|*][:PINNUM]
    ~NAME
    -
    """
    pinseq = 0
    # left side: inputs
    i = 0
    for pin in pins:
        pin = pin.rstrip()
        if pin == '':
            break
        pinlabel = pin.split('\t')[0]
        i += 1
        if pinlabel == '':
            continue
        x = PIN_LENGTH
        y = 400 + (n - i) * PIN_SPACE
        pintype = ''
        if pinlabel.find(':') >= 0:
            pinnumber = pinlabel.split(sep=':')[1]
            pinlabel = pinlabel.split(sep=':')[0]
        else:
            pinnumber = None
        if pinlabel.endswith('*'):
            pinlabel = pinlabel.rstrip('*')
            pintype = '*'
        if pinlabel.endswith('~'):
            pinlabel = pinlabel.rstrip('~')
            pintype = '~'
        if pinlabel.endswith('#'):
            pinlabel = pinlabel.rstrip('#')
            pintype = '#'
        if pinlabel.endswith('^'):
            pinlabel = pinlabel.rstrip('^')
            pintype = '^'
        if pinlabel.endswith('-'):
            pintype = '-'
            pinlabel = pinlabel.rstrip('-')
        if pinlabel.endswith('/'):
            pinlabel = pinlabel.rstrip('/')
            pintype = '/'
        if pinlabel.endswith('\\'):
            pinlabel = pinlabel.rstrip('\\')
            pintype = '\\'
        if pinlabel == '' and pintype == '-':
            print('L %d %d %d %d 3 %d 0 0 -1 -1' % (x, y, x + add_width, y, THIN_LINE_WIDTH))
            continue
        if pinlabel.startswith('~'):
            print('T %d %d 9 %d 1 0 0 4 1' % (PIN_LENGTH + (add_width) / 2, y, TEXT_SIZE))
            print('%s' % (pinlabel.lstrip('~')))
            continue
        pinseq += 1
        print('P %d %d %d %d 1 0 0' % (0, y, PIN_LENGTH, y))
        print('{')
        print('T %d %d 5 %d 0 0 0 0 1' % (0, y, TEXT_SIZE))
        if pintype == '*':
            print('pintype=pwr')
        elif pintype == '~':
            print('pintype=io')
        elif pintype == '#':
            print('pintype=tri')
        elif pintype == '^':
            print('pintype=out')
        else:
            print('pintype=in')
        if pinlabel:
            print('T %d %d 9 %d 1 1 0 1 1' % (PIN_LENGTH + 55, y - 5, TEXT_SIZE))
            print('pinlabel=%s' % pinlabel)
        print('T %d %d 5 %d 1 1 0 6 1' % (PIN_LENGTH - 95, y + 45, TEXT_SIZE))
        print('pinnumber=%d' % (int(pinnumber) if pinnumber is not None else pinseq))
        print('T %d %d 5 %d 0 0 0 0 1' % (0, y, TEXT_SIZE))
        print('pinseq=%d' % pinseq)
        print('}')
        if pintype == '-':
            print('V %d %d %d 6 0 1 0 -1 -1 0 -1 -1 -1 -1 -1' % (x, y, RADIUS))
        if pintype == '/' or pintype == '*':
            print('L %d %d %d %d 3 0 0 0 -1 -1' % (x - RADIUS, y - RADIUS, x + RADIUS, y + RADIUS))
        if pintype == '\\' or pintype == '*':
            print('L %d %d %d %d 3 0 0 0 -1 -1' % (x - RADIUS, y + RADIUS, x + RADIUS, y - RADIUS))

    # right side: outputs
    i = 0
    for pin in pins:
        pin = pin.rstrip()
        if pin == '':
            break
        i += 1
        if pin.split('\t').__len__() == 1:
            continue
        pinlabel = pin.split('\t')[-1:][0]
        if pinlabel == '':
            continue

        x = PIN_LENGTH + add_width + main_width + add_width
        y = 400 + (n - i) * PIN_SPACE
        pintype = ''
        if pinlabel.find(':') >= 0:
            pinnumber = pinlabel.split(':')[1]
            pinlabel = pinlabel.split(':')[0]
        else:
            pinnumber = None
        if pinlabel.endswith('*'):
            pinlabel = pinlabel.rstrip('*')
            pintype = '*'
        if pinlabel.endswith('~'):
            pinlabel = pinlabel.rstrip('~')
            pintype = '~'
        if pinlabel.endswith('#'):
            pinlabel = pinlabel.rstrip('#')
            pintype = '#'
        if pinlabel.endswith('^'):
            pinlabel = pinlabel.rstrip('^')
            pintype = '^'
        if pinlabel.endswith('-'):
            pintype = '-'
            pinlabel = pinlabel.rstrip('-')
        if pinlabel.endswith('/'):
            pinlabel = pinlabel.strip('/')
            pintype = '/'
        if pinlabel.endswith('\\'):
            pinlabel = pinlabel.rstrip('\\')
            pintype = '\\'
        if pinlabel == '' and pintype == '-':
            print('L %d %d %d %d 3 %d 0 0 -1 -1' % (x - add_width, y, x, y, THIN_LINE_WIDTH))
            continue
        if pinlabel.startswith('~'):
            print('T %d %d 9 %d 1 0 0 4 1' % (PIN_LENGTH + add_width + main_width + add_width / 2, y, TEXT_SIZE))
            print('%s' % (pinlabel.lstrip('~')))
            continue
        pinseq += 1
        print('P %d %d %d %d 1 0 0' % (x + PIN_LENGTH, y, x, y))
        print('{')
        print('T %d %d 5 %d 0 0 0 0 1' % (x + PIN_LENGTH, y, TEXT_SIZE))
        if pintype == '*':
            print('pintype=pwr')
        elif pintype == '~':
            print('pintype=io')
        elif pintype == '#':
            print('pintype=tri')
        elif pintype == '^':
            print('pintype=in')
        else:
            print('pintype=out')
        if pinlabel:
            print('T %d %d 9 %d 1 1 0 7 1' % (x - 55, y - 5, TEXT_SIZE))
            print('pinlabel=%s' % (pinlabel))
        print('T %d %d 5 %d 1 1 0 0 1' % (x + 95, y + 45, TEXT_SIZE))
        print('pinnumber=%d' % (int(pinnumber) if pinnumber is not None else pinseq))
        print('T %d %d 5 %d 0 0 0 0 1' % (0, y, TEXT_SIZE))
        print('pinseq=%d' % pinseq)
        print('}')
        if pintype == '-':
            print('V %d %d %d 6 0 1 0 -1 -1 0 -1 -1 -1 -1 -1' % (x, y, RADIUS))
        if pintype == '/' or pintype == '*':
            print('L %d %d %d %d 3 %d 0 0 -1 -1' % (x - RADIUS, y - RADIUS, x + RADIUS, y + RADIUS, THIN_LINE_WIDTH))
        if pintype == '\\' or pintype == '*':
            print('L %d %d %d %d 3 %d 0 0 -1 -1' % (x - RADIUS, y + RADIUS, x + RADIUS, y - RADIUS, THIN_LINE_WIDTH))

    # attributes
    x = PIN_LENGTH + add_width + main_width / 2
    y = 400 + (n+1) * PIN_SPACE
    print('T %d %d 8 %d 1 1 0 3 1' % (x, y, TEXT_SIZE))
    print('refdes=DD?')
    print('T %d %d 8 %d 1 1 0 3 1' % (x, 0, TEXT_SIZE))
    print('value=%s' % (value))
    # defined attributes
    found = False
    for pin in pins:
        pin = pin.strip()
        if pin == '':
            found = True
            continue
        if found:
            if pin.startswith('main_width='):
                continue
            if pin.startswith('add_width='):
                continue
            print('T %d %d 8 %d 0 0 0 0 1' % (0, 0, TEXT_SIZE))
            print('{}'.format(pin))


if __name__ == '__main__':
    main()
