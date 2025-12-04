import 'package:basic/ExpenceApp/models/expense.dart';
import 'package:basic/ExpenceApp/ui/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addExpense(Expense expense) {
    setState(() {
      Expense.listExpense.add(expense);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ronan the Best Expense App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_sharp),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Bay Cha',
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Amount',
                                hintText: '0.00',
                                prefixText: '\$',
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancle"),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancle"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue.shade100,
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: Expense.listExpense.length,
          itemBuilder: (context, index) =>
              ExpenseCard(expense: Expense.listExpense[index]),
        ),
      ),
    );
  }
}
