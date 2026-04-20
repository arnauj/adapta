import 'package:flutter/material.dart';

class NominaScreen extends StatefulWidget {
  const NominaScreen({super.key});

  static const String route = 'nomina';

  @override
  State<NominaScreen> createState() => _NominaScreenState();
}

class _NominaScreenState extends State<NominaScreen> {
  int paso = 1;
  int tipoContrato = 0;
  List<bool> errores = List<bool>.generate(10, (_) => false);

  final _salarioBaseCtrl = TextEditingController();
  final _complementosCtrl = TextEditingController();
  final _horasExtraFMCtrl = TextEditingController();
  final _horasExtraNCtrl = TextEditingController();
  final _precioHoraCtrl = TextEditingController();
  final _irpfCtrl = TextEditingController();

  double _salarioBase = 0;
  double _complementos = 0;
  double _horasExtraFM = 0;
  double _horasExtraNorm = 0;
  double _precioHora = 0;

  @override
  void dispose() {
    for (final c in [
      _salarioBaseCtrl, _complementosCtrl, _horasExtraFMCtrl,
      _horasExtraNCtrl, _precioHoraCtrl, _irpfCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget body;
    switch (paso) {
      case 3:
        body = _pasoTres(size);
        break;
      case 2:
        body = _pasoDos(size);
        break;
      default:
        body = _pasoUno(size);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Nómina'),
        backgroundColor: Colors.green.shade700,
        actions: [
          if (paso > 1)
            TextButton.icon(
              onPressed: () => setState(() => paso--),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
              label: const Text('Atrás',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: body,
        ),
      ),
    );
  }

  // ─── PASO 1: tipo de contrato ──────────────────────────────────────────────

  Widget _pasoUno(Size size) {
    return Column(
      children: [
        _tituloStep('Paso 1 de 3', 'Tipo de contrato', Icons.assignment_rounded),
        const SizedBox(height: 30),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _CardTipoContrato(
              titulo: 'Contrato Indefinido',
              subtitulo: 'Sin fecha de fin determinada',
              icon: Icons.work_rounded,
              color: Colors.green.shade600,
              seleccionado: tipoContrato == 0,
              onTap: () => setState(() => tipoContrato = 0),
            ),
            _CardTipoContrato(
              titulo: 'Contrato Temporal',
              subtitulo: 'Duración limitada o por obra',
              icon: Icons.access_time_rounded,
              color: Colors.orange.shade600,
              seleccionado: tipoContrato == 1,
              onTap: () => setState(() => tipoContrato = 1),
            ),
            _CardTipoContrato(
              titulo: 'Contrato en Prácticas',
              subtitulo: 'Cotización reducida',
              icon: Icons.school_rounded,
              color: Colors.blue.shade600,
              seleccionado: tipoContrato == 2,
              onTap: () => setState(() => tipoContrato = 2),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: () => setState(() => paso = 2),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08, vertical: 16),
            shape: const StadiumBorder(),
          ),
          icon: const Icon(Icons.arrow_forward),
          label: const Text('CONTINUAR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  // ─── PASO 2: conceptos salariales ─────────────────────────────────────────

  Widget _pasoDos(Size size) {
    // % desempleo varía según contrato
    final pctDesempleo = tipoContrato == 1 ? 1.60 : 1.55;

    return Column(
      children: [
        _tituloStep('Paso 2 de 3', 'Conceptos salariales', Icons.euro_rounded),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _CampoNomina(
              controller: _salarioBaseCtrl,
              label: 'Salario base bruto mensual',
              hint: '0.00',
              icon: Icons.account_balance_wallet_rounded,
              size: size,
              campoIdx: 1,
              errores: errores,
              prefijo: '€',
              onChanged: (v) => setState(() {
                _salarioBase = double.tryParse(v) ?? 0;
                errores[1] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
            _CampoNomina(
              controller: _complementosCtrl,
              label: 'Complementos salariales',
              hint: '0.00',
              icon: Icons.add_circle_outline,
              size: size,
              campoIdx: 2,
              errores: errores,
              prefijo: '€',
              onChanged: (v) => setState(() {
                _complementos = double.tryParse(v) ?? 0;
                errores[2] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
            _CampoNomina(
              controller: _precioHoraCtrl,
              label: 'Precio hora extra',
              hint: '0.00',
              icon: Icons.timer_rounded,
              size: size,
              campoIdx: 5,
              errores: errores,
              prefijo: '€',
              onChanged: (v) => setState(() {
                _precioHora = double.tryParse(v) ?? 0;
                errores[5] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
            _CampoNomina(
              controller: _horasExtraFMCtrl,
              label: 'Horas extra (fuerza mayor)',
              hint: '0',
              icon: Icons.warning_amber_rounded,
              size: size,
              campoIdx: 3,
              errores: errores,
              prefijo: 'h',
              onChanged: (v) => setState(() {
                _horasExtraFM = double.tryParse(v) ?? 0;
                errores[3] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
            _CampoNomina(
              controller: _horasExtraNCtrl,
              label: 'Horas extra (ordinarias)',
              hint: '0',
              icon: Icons.more_time_rounded,
              size: size,
              campoIdx: 4,
              errores: errores,
              prefijo: 'h',
              onChanged: (v) => setState(() {
                _horasExtraNorm = double.tryParse(v) ?? 0;
                errores[4] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
            _CampoNomina(
              controller: _irpfCtrl,
              label: 'Retención IRPF (%)',
              hint: _irpfSugerido().toStringAsFixed(0),
              icon: Icons.percent_rounded,
              size: size,
              campoIdx: 6,
              errores: errores,
              prefijo: '%',
              onChanged: (v) => setState(() {
                errores[6] = double.tryParse(v) == null && v.isNotEmpty;
              }),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Column(
            children: [
              Text('Tipo: ${_nombreContrato()} · Paro trabajador: $pctDesempleo%',
                  style: TextStyle(color: Colors.green.shade700, fontSize: 13)),
              const SizedBox(height: 4),
              Text(
                'IRPF sugerido por tramo: ${_irpfSugerido().toStringAsFixed(0)}%  '
                '(anual bruto estimado: ${(_salarioBase * 14).toStringAsFixed(0)}€)',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: errores.contains(true)
              ? null
              : () => setState(() => paso = 3),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08, vertical: 16),
            shape: const StadiumBorder(),
          ),
          icon: const Icon(Icons.calculate_rounded),
          label: const Text('CALCULAR NÓMINA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  // ─── PASO 3: resultado nómina ──────────────────────────────────────────────

  Widget _pasoTres(Size size) {
    final pctDesempleo = tipoContrato == 1 ? 1.60 : 1.55;
    final irpf = _irpfCtrl.text.isNotEmpty
        ? (double.tryParse(_irpfCtrl.text) ?? _irpfSugerido())
        : _irpfSugerido();

    final importeHorasExtraFM = _horasExtraFM * _precioHora;
    final importeHorasExtraN = _horasExtraNorm * _precioHora;

    final totalDevengado =
        _salarioBase + _complementos + importeHorasExtraFM + importeHorasExtraN;

    // Base de cotización
    final bcc = _salarioBase + _complementos;

    // Deducciones SS trabajador
    final dedCC = bcc * 0.047;
    final dedDesempleo = bcc * (pctDesempleo / 100);
    final dedFormacion = bcc * 0.001;
    final dedHeFM = importeHorasExtraFM * 0.02;
    final dedHeN = importeHorasExtraN * 0.047;
    final dedIRPF = totalDevengado * (irpf / 100);

    final totalDeducciones =
        dedCC + dedDesempleo + dedFormacion + dedHeFM + dedHeN + dedIRPF;

    final liquidoApercibir = totalDevengado - totalDeducciones;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _tituloStep('Paso 3 de 3', 'Nómina calculada', Icons.receipt_long_rounded),
        const SizedBox(height: 20),
        _SeccionNomina(
          titulo: 'DEVENGOS',
          color: Colors.green.shade700,
          filas: [
            _FilaNomina('Salario base', _salarioBase),
            _FilaNomina('Complementos salariales', _complementos),
            if (importeHorasExtraFM > 0)
              _FilaNomina('Horas extra (fuerza mayor)', importeHorasExtraFM),
            if (importeHorasExtraN > 0)
              _FilaNomina('Horas extra (ordinarias)', importeHorasExtraN),
            _FilaNomina('TOTAL DEVENGADO', totalDevengado, negrita: true),
          ],
        ),
        const SizedBox(height: 16),
        _SeccionNomina(
          titulo: 'DEDUCCIONES',
          color: Colors.red.shade700,
          filas: [
            _FilaNomina(
                'Contingencias comunes (4.70%)', dedCC, deduccion: true),
            _FilaNomina(
                'Desempleo ($pctDesempleo%)', dedDesempleo, deduccion: true),
            _FilaNomina(
                'Formación profesional (0.10%)', dedFormacion, deduccion: true),
            if (dedHeFM > 0)
              _FilaNomina('H.E. fuerza mayor (2%)', dedHeFM, deduccion: true),
            if (dedHeN > 0)
              _FilaNomina('H.E. ordinarias (4.70%)', dedHeN, deduccion: true),
            _FilaNomina('Retención IRPF (${irpf.toStringAsFixed(0)}%)',
                dedIRPF, deduccion: true),
            _FilaNomina('TOTAL DEDUCCIONES', totalDeducciones,
                negrita: true, deduccion: true),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade800, Colors.green.shade500],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'LÍQUIDO A PERCIBIR',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                '${liquidoApercibir.toStringAsFixed(2)} €',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${_nombreContrato()}  ·  IRPF ${irpf.toStringAsFixed(0)}%',
                style:
                    const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () => setState(() {
            paso = 1;
            for (final c in [
              _salarioBaseCtrl, _complementosCtrl, _horasExtraFMCtrl,
              _horasExtraNCtrl, _precioHoraCtrl, _irpfCtrl,
            ]) {
              c.clear();
            }
            _salarioBase = _complementos = _horasExtraFM =
                _horasExtraNorm = _precioHora = 0;
          }),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.green.shade700,
            side: BorderSide(color: Colors.green.shade700, width: 2),
            shape: const StadiumBorder(),
            padding:
                EdgeInsets.symmetric(horizontal: size.width * 0.06, vertical: 14),
          ),
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('NUEVA NÓMINA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────

  double _irpfSugerido() {
    final anual = _salarioBase * 14;
    if (anual <= 12450) return 19;
    if (anual <= 20200) return 24;
    if (anual <= 35200) return 30;
    if (anual <= 60000) return 37;
    return 45;
  }

  String _nombreContrato() {
    const nombres = ['Indefinido', 'Temporal', 'Prácticas'];
    return nombres[tipoContrato];
  }

  Widget _tituloStep(String paso, String titulo, IconData icon) {
    return Column(
      children: [
        Text(paso,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                letterSpacing: 1.2)),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green.shade700, size: 28),
            const SizedBox(width: 10),
            Text(titulo,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800)),
          ],
        ),
      ],
    );
  }
}

// ─── Widgets auxiliares ───────────────────────────────────────────────────────

class _CardTipoContrato extends StatelessWidget {
  final String titulo, subtitulo;
  final IconData icon;
  final Color color;
  final bool seleccionado;
  final VoidCallback onTap;

  const _CardTipoContrato({
    required this.titulo,
    required this.subtitulo,
    required this.icon,
    required this.color,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: (size.width * 0.28).clamp(200.0, 280.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: seleccionado ? color : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: color,
              width: seleccionado ? 0 : 2),
          boxShadow: [
            BoxShadow(
              color: seleccionado
                  ? color.withOpacity(0.4)
                  : Colors.black.withOpacity(0.06),
              blurRadius: seleccionado ? 14 : 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 36,
                color: seleccionado ? Colors.white : color),
            const SizedBox(height: 10),
            Text(titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: seleccionado ? Colors.white : Colors.black87)),
            const SizedBox(height: 6),
            Text(subtitulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: seleccionado
                        ? Colors.white70
                        : Colors.grey.shade500)),
          ],
        ),
      ),
    );
  }
}

class _CampoNomina extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint, prefijo;
  final IconData icon;
  final Size size;
  final int campoIdx;
  final List<bool> errores;
  final ValueChanged<String> onChanged;

  const _CampoNomina({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.size,
    required this.campoIdx,
    required this.errores,
    required this.prefijo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (size.width * 0.27).clamp(200.0, 300.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon,
              color: errores[campoIdx] ? Colors.red : Colors.green.shade600),
          suffixText: prefijo,
          errorText: errores[campoIdx] ? 'Valor no válido' : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
            borderSide:
                BorderSide(color: Colors.green.shade700, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
            borderSide: BorderSide(
                color: errores[campoIdx]
                    ? Colors.red
                    : Colors.grey.shade300),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}

class _SeccionNomina extends StatelessWidget {
  final String titulo;
  final Color color;
  final List<_FilaNomina> filas;

  const _SeccionNomina({
    required this.titulo,
    required this.color,
    required this.filas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14)),
            ),
            child: Text(titulo,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1)),
          ),
          ...filas.map((f) => _buildFila(f)),
        ],
      ),
    );
  }

  Widget _buildFila(_FilaNomina f) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade100, width: 1)),
        color: f.negrita ? color.withOpacity(0.06) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(f.concepto,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        f.negrita ? FontWeight.bold : FontWeight.normal)),
          ),
          Text(
            '${f.deduccion ? '- ' : ''}${f.importe.toStringAsFixed(2)} €',
            style: TextStyle(
              fontSize: 15,
              fontWeight: f.negrita ? FontWeight.bold : FontWeight.normal,
              color: f.deduccion ? Colors.red.shade700 : Colors.green.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilaNomina {
  final String concepto;
  final double importe;
  final bool negrita;
  final bool deduccion;

  const _FilaNomina(this.concepto, this.importe,
      {this.negrita = false, this.deduccion = false});
}
