import 'package:drift_primary_key_issue/app_database.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Drift Primary Key Issue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final database = AppDatabase();

  void _saveEmployees() {
    setState(() {
      database.employeeAccessor.saveEmployee(firstName: 'John', lastName: 'Doe', city: 'London');
      database.employeeAccessor.saveEmployee(firstName: 'Jane', lastName: 'Nocity', city: null);
      database.employeeAccessor.saveEmployee(firstName: 'Jane', lastName: 'Nocity', city: null);
    });
    _fetchEmployees();
  }

  void _deleteAll() {
    setState(() {
      database.employeeAccessor.deleteAllEmployees();
    });
    _fetchEmployees();
  }

  List<EmployeeDto> allEmployees = [];
  void _fetchEmployees() async {
    allEmployees = await database.employeeAccessor.getAllEmployees();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Employees: ${allEmployees.length}'),
              for(final employee in allEmployees) Text('${employee.firstName} ${employee.lastName} ${employee.city}'),
              const SizedBox(height: 20,),
              const Text('Press save to save 3 employees - John Doe from London, Jane Nocity from null & Jane Nocity from null'),
              const Text('Press delete to erase all employees'),
            ],
          ),
        ),
      ),persistentFooterButtons: [
        TextButton(onPressed: _saveEmployees, child: const Text('save')),
        TextButton(onPressed: _deleteAll, child: const Text('delete'))
    ],
    );
  }
}
