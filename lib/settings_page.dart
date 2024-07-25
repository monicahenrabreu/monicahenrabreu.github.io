import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TabBar(controller: _tabController, tabs: const [
                      Tab(
                        text: 'Hoje',
                      ),
                      Tab(
                        text: 'Desafios',
                      ),
                      Tab(
                        text: 'Aprender',
                      ),
                      Tab(
                        text: 'Reiniciar',
                      ),
                    ])),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.red,
                    child: const Text('Como te estás a sentir hoje?'),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Text('Lista de Desafios'),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Text('Lista de Artigos'),
                  ),
                  Container(
                    color: Colors.purple,
                    child: const Text('Lista de videos / áudios'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
