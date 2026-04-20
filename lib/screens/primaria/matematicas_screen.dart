import 'dart:math';
import 'package:flutter/material.dart';

class MatematicasPrimariaScreen extends StatefulWidget {
  const MatematicasPrimariaScreen({super.key});

  static const String route = 'matematicas_primaria';

  @override
  State<MatematicasPrimariaScreen> createState() =>
      _MatematicasPrimariaScreenState();
}

class _MatematicasPrimariaScreenState
    extends State<MatematicasPrimariaScreen> {
  int numero = 5;
  bool modoQuiz = false;
  int _q1 = 5, _q2 = 3;
  bool? _correcto;
  final _ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nuevaPregunta();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _nuevaPregunta() {
    final r = Random();
    _q1 = r.nextInt(10) + 1;
    _q2 = r.nextInt(10) + 1;
    _correcto = null;
    _ctrl.clear();
  }

  void _comprobar() {
    final intento = int.tryParse(_ctrl.text);
    setState(() => _correcto = intento == _q1 * _q2);
    if (_correcto == true) {
      Future.delayed(const Duration(milliseconds: 900), () {
        if (mounted) setState(() => _nuevaPregunta());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        title: const Text('Matemáticas — Tablas de multiplicar'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton.icon(
              onPressed: () => setState(() {
                modoQuiz = !modoQuiz;
                if (modoQuiz) _nuevaPregunta();
              }),
              icon: Icon(
                modoQuiz ? Icons.table_chart : Icons.quiz,
                color: Colors.white,
              ),
              label: Text(
                modoQuiz ? 'VER TABLA' : 'QUIZ',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: modoQuiz ? _buildQuiz() : _buildTabla(),
    );
  }

  Widget _buildTabla() {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BtnSelector(
              icon: Icons.remove_circle_rounded,
              color: Colors.pink.shade400,
              onTap: () {
                if (numero > 1) setState(() => numero--);
              },
            ),
            const SizedBox(width: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade500, Colors.pink.shade300],
                ),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.4),
                    blurRadius: 14,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                'Tabla del $numero',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            _BtnSelector(
              icon: Icons.add_circle_rounded,
              color: Colors.pink.shade400,
              onTap: () {
                if (numero < 12) setState(() => numero++);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Toca una celda para ocultar/mostrar el resultado',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 6 : 3,
              childAspectRatio: 3.0,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 12,
            itemBuilder: (ctx, i) =>
                _CeldaTabla(num1: numero, num2: i + 1),
          ),
        ),
      ],
    );
  }

  Widget _buildQuiz() {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$_q1',
                    style: TextStyle(
                      fontSize: size.height * 0.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '×',
                      style: TextStyle(
                        fontSize: size.height * 0.07,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Text(
                    '$_q2',
                    style: TextStyle(
                      fontSize: size.height * 0.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: size.height * 0.07,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Text(
                    '?',
                    style: TextStyle(
                      fontSize: size.height * 0.1,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: (size.width * 0.25).clamp(150.0, 260.0),
              child: TextField(
                controller: _ctrl,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                autofocus: true,
                style: TextStyle(
                  fontSize: size.height * 0.055,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade700,
                ),
                decoration: InputDecoration(
                  hintText: '?',
                  hintStyle: TextStyle(color: Colors.grey.shade300),
                  filled: true,
                  fillColor: Colors.pink.shade50,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Colors.pink.shade200, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.pink, width: 3),
                  ),
                ),
                onSubmitted: (_) => _comprobar(),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _correcto == null
                  ? const SizedBox(height: 72)
                  : Icon(
                      _correcto!
                          ? Icons.check_circle_rounded
                          : Icons.cancel_rounded,
                      key: ValueKey(_correcto),
                      color: _correcto! ? Colors.green : Colors.redAccent,
                      size: 72,
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade500,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.045,
                      vertical: 16,
                    ),
                    shape: const StadiumBorder(),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.check),
                  label: const Text(
                    'COMPROBAR',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _comprobar,
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.pink.shade500,
                    side: BorderSide(color: Colors.pink.shade400, width: 2),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.035,
                      vertical: 16,
                    ),
                    shape: const StadiumBorder(),
                  ),
                  icon: const Icon(Icons.skip_next),
                  label: const Text(
                    'SIGUIENTE',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => setState(() => _nuevaPregunta()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BtnSelector extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _BtnSelector({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 52, color: color),
    );
  }
}

class _CeldaTabla extends StatefulWidget {
  final int num1, num2;

  const _CeldaTabla({required this.num1, required this.num2});

  @override
  State<_CeldaTabla> createState() => _CeldaTablaState();
}

class _CeldaTablaState extends State<_CeldaTabla> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => visible = !visible),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: visible
                ? [Colors.pink.shade400, Colors.pink.shade200]
                : [Colors.grey.shade200, Colors.grey.shade100],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: (visible ? Colors.pink : Colors.grey).withOpacity(0.28),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                visible
                    ? '${widget.num1} × ${widget.num2} = ${widget.num1 * widget.num2}'
                    : '${widget.num1} × ${widget.num2} = ?',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: visible ? Colors.white : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
