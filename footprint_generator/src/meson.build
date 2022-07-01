project('fpgen', 'c', version: '1.0')

m_dep = meson.get_compiler('c').find_library('m', required: false)

sources = [
  'main.c',
  'pcb_element.c',
  '2pin.c',
  'conn.c',
  'dil.c',
  'qfp.c',
  'so.c'
]

executable('fpgen', sources: sources, dependencies: [m_dep])
