import 'package:flutter/material.dart';
import 'models/mago.dart';
import 'data/mago_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Magos',
      home: const MagoListScreen(),
    );
  }
}

class MagoListScreen extends StatefulWidget {
  const MagoListScreen({super.key});

  @override
  State<MagoListScreen> createState() => _MagoListScreenState();
}

class _MagoListScreenState extends State<MagoListScreen> {
  late Future<List<Mago>> _futureMagos;

  @override
  void initState() {
    super.initState();
    _futureMagos = MagoData.carregarMagos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magos Poderosos')),
      body: FutureBuilder<List<Mago>>(
        future: _futureMagos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar magos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum mago encontrado'));
          }

          final magos = snapshot.data!;
          return ListView.builder(
            itemCount: magos.length,
            itemBuilder: (context, index) {
              final mago = magos[index];
              return Card(
                child: ListTile(
                  title: Text(mago.nome),
                  subtitle: Text('Mana: ${mago.mana} | Nível: ${mago.nivelMagico}'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Int: ${mago.inteligencia}'),
                      Text('Idade: ${mago.idade}'),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(mago.nome),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Feitiços:'),
                            Text('- ${mago.feitico1}'),
                            Text('- ${mago.feitico2}'),
                            Text('- ${mago.feitico3}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
