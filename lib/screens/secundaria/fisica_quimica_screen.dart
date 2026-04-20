import 'package:flutter/material.dart';

class FisicaQuimicaScreen extends StatefulWidget {
  const FisicaQuimicaScreen({super.key});

  static const String route = 'fisica_quimica';

  @override
  State<FisicaQuimicaScreen> createState() => _FisicaQuimicaScreenState();
}

class _FisicaQuimicaScreenState extends State<FisicaQuimicaScreen> {
  _Elem? _sel;

  static const _catColor = {
    'nm': Color(0xFF29B6F6),  // no metal - azul claro
    'gn': Color(0xFFAB47BC),  // gas noble - morado
    'ma': Color(0xFFEF5350),  // metal alcalino - rojo
    'mt': Color(0xFFFF7043),  // metal alc. térreo - naranja
    'tr': Color(0xFFFFCA28),  // metal transición - amarillo
    'me': Color(0xFF66BB6A),  // metaloide - verde
    'mp': Color(0xFF26C6DA),  // metal post-trans. - cian
    'ha': Color(0xFF9CCC65),  // halógeno - verde claro
    'la': Color(0xFFEC407A),  // lantánido - rosa
    'ac': Color(0xFF7E57C2),  // actínido - violeta
  };

  static const _catNombre = {
    'nm': 'No metal',
    'gn': 'Gas noble',
    'ma': 'Metal alcalino',
    'mt': 'Metal alc. térreo',
    'tr': 'Metal de transición',
    'me': 'Metaloide',
    'mp': 'Metal post-transición',
    'ha': 'Halógeno',
    'la': 'Lantánido',
    'ac': 'Actínido',
  };

  Color _c(String cat) => _catColor[cat] ?? Colors.grey.shade300;

  // Todos los elementos: [num, sym, nombre_es, masa, cat, row, col]
  // row/col: posición visual en la cuadrícula (1-indexed)
  // row 1-7: tabla principal  |  row 8: hueco  |  row 9: lantánidos  |  row 10: actínidos
  static const _datos = [
    [1,  'H',  'Hidrógeno',    1.008,  'nm', 1,  1],
    [2,  'He', 'Helio',        4.003,  'gn', 1, 18],
    [3,  'Li', 'Litio',        6.941,  'ma', 2,  1],
    [4,  'Be', 'Berilio',      9.012,  'mt', 2,  2],
    [5,  'B',  'Boro',        10.811,  'me', 2, 13],
    [6,  'C',  'Carbono',     12.011,  'nm', 2, 14],
    [7,  'N',  'Nitrógeno',   14.007,  'nm', 2, 15],
    [8,  'O',  'Oxígeno',     15.999,  'nm', 2, 16],
    [9,  'F',  'Flúor',       18.998,  'ha', 2, 17],
    [10, 'Ne', 'Neón',        20.180,  'gn', 2, 18],
    [11, 'Na', 'Sodio',       22.990,  'ma', 3,  1],
    [12, 'Mg', 'Magnesio',    24.305,  'mt', 3,  2],
    [13, 'Al', 'Aluminio',    26.982,  'mp', 3, 13],
    [14, 'Si', 'Silicio',     28.086,  'me', 3, 14],
    [15, 'P',  'Fósforo',     30.974,  'nm', 3, 15],
    [16, 'S',  'Azufre',      32.065,  'nm', 3, 16],
    [17, 'Cl', 'Cloro',       35.453,  'ha', 3, 17],
    [18, 'Ar', 'Argón',       39.948,  'gn', 3, 18],
    [19, 'K',  'Potasio',     39.098,  'ma', 4,  1],
    [20, 'Ca', 'Calcio',      40.078,  'mt', 4,  2],
    [21, 'Sc', 'Escandio',    44.956,  'tr', 4,  3],
    [22, 'Ti', 'Titanio',     47.867,  'tr', 4,  4],
    [23, 'V',  'Vanadio',     50.942,  'tr', 4,  5],
    [24, 'Cr', 'Cromo',       51.996,  'tr', 4,  6],
    [25, 'Mn', 'Manganeso',   54.938,  'tr', 4,  7],
    [26, 'Fe', 'Hierro',      55.845,  'tr', 4,  8],
    [27, 'Co', 'Cobalto',     58.933,  'tr', 4,  9],
    [28, 'Ni', 'Níquel',      58.693,  'tr', 4, 10],
    [29, 'Cu', 'Cobre',       63.546,  'tr', 4, 11],
    [30, 'Zn', 'Zinc',        65.38,   'tr', 4, 12],
    [31, 'Ga', 'Galio',       69.723,  'mp', 4, 13],
    [32, 'Ge', 'Germanio',    72.630,  'me', 4, 14],
    [33, 'As', 'Arsénico',    74.922,  'me', 4, 15],
    [34, 'Se', 'Selenio',     78.971,  'nm', 4, 16],
    [35, 'Br', 'Bromo',       79.904,  'ha', 4, 17],
    [36, 'Kr', 'Kriptón',     83.798,  'gn', 4, 18],
    [37, 'Rb', 'Rubidio',     85.468,  'ma', 5,  1],
    [38, 'Sr', 'Estroncio',   87.62,   'mt', 5,  2],
    [39, 'Y',  'Itrio',       88.906,  'tr', 5,  3],
    [40, 'Zr', 'Circonio',    91.224,  'tr', 5,  4],
    [41, 'Nb', 'Niobio',      92.906,  'tr', 5,  5],
    [42, 'Mo', 'Molibdeno',   95.96,   'tr', 5,  6],
    [43, 'Tc', 'Tecnecio',    98.0,    'tr', 5,  7],
    [44, 'Ru', 'Rutenio',    101.07,   'tr', 5,  8],
    [45, 'Rh', 'Rodio',      102.906,  'tr', 5,  9],
    [46, 'Pd', 'Paladio',    106.42,   'tr', 5, 10],
    [47, 'Ag', 'Plata',      107.868,  'tr', 5, 11],
    [48, 'Cd', 'Cadmio',     112.411,  'tr', 5, 12],
    [49, 'In', 'Indio',      114.818,  'mp', 5, 13],
    [50, 'Sn', 'Estaño',     118.710,  'mp', 5, 14],
    [51, 'Sb', 'Antimonio',  121.760,  'me', 5, 15],
    [52, 'Te', 'Telurio',    127.60,   'me', 5, 16],
    [53, 'I',  'Yodo',       126.904,  'ha', 5, 17],
    [54, 'Xe', 'Xenón',      131.293,  'gn', 5, 18],
    [55, 'Cs', 'Cesio',      132.905,  'ma', 6,  1],
    [56, 'Ba', 'Bario',      137.327,  'mt', 6,  2],
    [72, 'Hf', 'Hafnio',     178.49,   'tr', 6,  4],
    [73, 'Ta', 'Tántalo',    180.948,  'tr', 6,  5],
    [74, 'W',  'Wolframio',  183.84,   'tr', 6,  6],
    [75, 'Re', 'Renio',      186.207,  'tr', 6,  7],
    [76, 'Os', 'Osmio',      190.23,   'tr', 6,  8],
    [77, 'Ir', 'Iridio',     192.217,  'tr', 6,  9],
    [78, 'Pt', 'Platino',    195.084,  'tr', 6, 10],
    [79, 'Au', 'Oro',        196.967,  'tr', 6, 11],
    [80, 'Hg', 'Mercurio',   200.59,   'tr', 6, 12],
    [81, 'Tl', 'Talio',      204.383,  'mp', 6, 13],
    [82, 'Pb', 'Plomo',      207.2,    'mp', 6, 14],
    [83, 'Bi', 'Bismuto',    208.980,  'mp', 6, 15],
    [84, 'Po', 'Polonio',    209.0,    'mp', 6, 16],
    [85, 'At', 'Ástato',     210.0,    'ha', 6, 17],
    [86, 'Rn', 'Radón',      222.0,    'gn', 6, 18],
    [87, 'Fr', 'Francio',    223.0,    'ma', 7,  1],
    [88, 'Ra', 'Radio',      226.0,    'mt', 7,  2],
    [104,'Rf', 'Rutherfordio',267.0,   'tr', 7,  4],
    [105,'Db', 'Dubnio',     268.0,    'tr', 7,  5],
    [106,'Sg', 'Seaborgio',  271.0,    'tr', 7,  6],
    [107,'Bh', 'Bohrio',     272.0,    'tr', 7,  7],
    [108,'Hs', 'Hasio',      270.0,    'tr', 7,  8],
    [109,'Mt', 'Meitnerio',  276.0,    'tr', 7,  9],
    [110,'Ds', 'Darmstadtio',281.0,    'tr', 7, 10],
    [111,'Rg', 'Roentgenio', 280.0,    'tr', 7, 11],
    [112,'Cn', 'Copernicio', 285.0,    'tr', 7, 12],
    [113,'Nh', 'Nihonio',    284.0,    'mp', 7, 13],
    [114,'Fl', 'Flerovio',   289.0,    'mp', 7, 14],
    [115,'Mc', 'Moscovio',   288.0,    'mp', 7, 15],
    [116,'Lv', 'Livermorio', 293.0,    'mp', 7, 16],
    [117,'Ts', 'Teneso',     294.0,    'ha', 7, 17],
    [118,'Og', 'Oganesón',   294.0,    'gn', 7, 18],
    // Lantánidos (fila 9)
    [57, 'La', 'Lantano',    138.905,  'la', 9,  3],
    [58, 'Ce', 'Cerio',      140.116,  'la', 9,  4],
    [59, 'Pr', 'Praseodimio',140.908,  'la', 9,  5],
    [60, 'Nd', 'Neodimio',   144.242,  'la', 9,  6],
    [61, 'Pm', 'Prometio',   145.0,    'la', 9,  7],
    [62, 'Sm', 'Samario',    150.36,   'la', 9,  8],
    [63, 'Eu', 'Europio',    151.964,  'la', 9,  9],
    [64, 'Gd', 'Gadolinio',  157.25,   'la', 9, 10],
    [65, 'Tb', 'Terbio',     158.925,  'la', 9, 11],
    [66, 'Dy', 'Disprosio',  162.500,  'la', 9, 12],
    [67, 'Ho', 'Holmio',     164.930,  'la', 9, 13],
    [68, 'Er', 'Erbio',      167.259,  'la', 9, 14],
    [69, 'Tm', 'Tulio',      168.934,  'la', 9, 15],
    [70, 'Yb', 'Iterbio',    173.054,  'la', 9, 16],
    [71, 'Lu', 'Lutecio',    174.967,  'la', 9, 17],
    // Actínidos (fila 10)
    [89, 'Ac', 'Actinio',    227.0,    'ac', 10,  3],
    [90, 'Th', 'Torio',      232.038,  'ac', 10,  4],
    [91, 'Pa', 'Protactinio',231.036,  'ac', 10,  5],
    [92, 'U',  'Uranio',     238.029,  'ac', 10,  6],
    [93, 'Np', 'Neptunio',   237.0,    'ac', 10,  7],
    [94, 'Pu', 'Plutonio',   244.0,    'ac', 10,  8],
    [95, 'Am', 'Americio',   243.0,    'ac', 10,  9],
    [96, 'Cm', 'Curio',      247.0,    'ac', 10, 10],
    [97, 'Bk', 'Berkelio',   247.0,    'ac', 10, 11],
    [98, 'Cf', 'Californio', 251.0,    'ac', 10, 12],
    [99, 'Es', 'Einstenio',  252.0,    'ac', 10, 13],
    [100,'Fm', 'Fermio',     257.0,    'ac', 10, 14],
    [101,'Md', 'Mendelevio', 258.0,    'ac', 10, 15],
    [102,'No', 'Nobelio',    259.0,    'ac', 10, 16],
    [103,'Lr', 'Laurencio',  262.0,    'ac', 10, 17],
  ];

  late final List<_Elem> _elements = _datos.map((d) => _Elem(
        n: d[0] as int,
        sym: d[1] as String,
        nombre: d[2] as String,
        masa: (d[3] as num).toDouble(),
        cat: d[4] as String,
        row: d[5] as int,
        col: d[6] as int,
      )).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Física y Química — Tabla Periódica'),
        backgroundColor: Colors.brown.shade600,
      ),
      body: Column(
        children: [
          Expanded(child: _buildTabla()),
          if (_sel != null) _buildDetalle(_sel!),
          _buildLeyenda(),
        ],
      ),
    );
  }

  Widget _buildTabla() {
    const double cs = 60; // cell size
    const double gap = 3;
    const double pad = 8;
    const int cols = 18;
    const int rows = 10;

    final Map<String, _Elem> byPos = {
      for (var e in _elements) '${e.row},${e.col}': e
    };

    return InteractiveViewer(
      minScale: 0.4,
      maxScale: 2.5,
      boundaryMargin: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(pad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(rows, (rowIdx) {
                final r = rowIdx + 1;
                if (r == 8) {
                  return const SizedBox(height: cs * 0.35 + gap);
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: gap),
                  child: Row(
                    children: List.generate(cols, (colIdx) {
                      final c = colIdx + 1;
                      final key = '$r,$c';
                      if (r == 6 && c == 3) {
                        return _PlaceholderCell(
                          cs: cs, gap: gap,
                          text: '57–71\n*',
                          color: _c('la').withOpacity(0.6),
                        );
                      }
                      if (r == 7 && c == 3) {
                        return _PlaceholderCell(
                          cs: cs, gap: gap,
                          text: '89–103\n**',
                          color: _c('ac').withOpacity(0.6),
                        );
                      }
                      if (!byPos.containsKey(key)) {
                        return const SizedBox(width: cs + gap, height: cs);
                      }
                      final elem = byPos[key]!;
                      final selected = _sel?.n == elem.n;
                      return Padding(
                        padding: const EdgeInsets.only(right: gap),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _sel = selected ? null : elem;
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            width: cs,
                            height: cs,
                            decoration: BoxDecoration(
                              color: _c(elem.cat),
                              borderRadius: BorderRadius.circular(6),
                              border: selected
                                  ? Border.all(
                                      color: Colors.black87, width: 2.5)
                                  : null,
                              boxShadow: selected
                                  ? [const BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 8,
                                      offset: Offset(0, 3))]
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${elem.n}',
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Colors.black54,
                                    height: 1.1,
                                  ),
                                ),
                                Text(
                                  elem.sym,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    height: 1.1,
                                  ),
                                ),
                                Text(
                                  elem.nombre.length > 8
                                      ? '${elem.nombre.substring(0, 7)}.'
                                      : elem.nombre,
                                  style: const TextStyle(
                                    fontSize: 7,
                                    color: Colors.black54,
                                    height: 1.1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  elem.masa.toStringAsFixed(
                                      elem.masa < 100 ? 3 : 2),
                                  style: const TextStyle(
                                    fontSize: 7,
                                    color: Colors.black45,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetalle(_Elem e) {
    return Container(
      color: _c(e.cat).withOpacity(0.15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: _c(e.cat),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: _c(e.cat).withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${e.n}',
                    style: const TextStyle(fontSize: 11, color: Colors.black54)),
                Text(e.sym,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.nombre,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Masa atómica: ${e.masa} u',
                    style: const TextStyle(fontSize: 15)),
                Text('Categoría: ${_catNombre[e.cat] ?? e.cat}',
                    style: const TextStyle(fontSize: 15)),
                Text('Número atómico: ${e.n}',
                    style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _sel = null),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildLeyenda() {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _catColor.entries.map((e) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: e.value,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _catNombre[e.key] ?? e.key,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _Elem {
  final int n, row, col;
  final String sym, nombre, cat;
  final double masa;

  const _Elem({
    required this.n,
    required this.sym,
    required this.nombre,
    required this.masa,
    required this.cat,
    required this.row,
    required this.col,
  });
}

class _PlaceholderCell extends StatelessWidget {
  final double cs, gap;
  final String text;
  final Color color;

  const _PlaceholderCell({
    required this.cs,
    required this.gap,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: gap),
      child: Container(
        width: cs,
        height: cs,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Colors.grey.shade400, width: 1, style: BorderStyle.solid),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
