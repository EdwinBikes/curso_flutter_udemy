import 'package:flutter/material.dart';
import 'package:segunda_aplicaicon/widgets/Custom_imput_field.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'fist_name': 'cuaqluiera',
      'last_name': 'Herrera',
      'email': 'patico@gmail.com',
      'password': '12345',
      'role': 'admin'
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs and Forms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomImputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre del usuario',
                    formProperty: 'first_name',
                    formvalues: formValues),
                SizedBox(height: 30),
                CustomImputField(
                    labelText: 'Apellido',
                    hintText: 'Apellido del usuario',
                    formProperty: 'las_name',
                    formvalues: formValues),
                SizedBox(height: 30),
                CustomImputField(
                    labelText: 'Correo',
                    hintText: 'Correo del usuario',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formvalues: formValues),
                SizedBox(height: 30),
                CustomImputField(
                    labelText: 'Contraseña',
                    hintText: 'Alfa numericos',
                    obscureText: true,
                    formProperty: 'password',
                    formvalues: formValues),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'user', child: Text('user')),
                      DropdownMenuItem(
                          value: 'superuser', child: Text('superuser')),
                      DropdownMenuItem(
                          value: 'developer', child: Text('developer')),
                      DropdownMenuItem(value: 'admin', child: Text('admin')),
                    ],
                    onChanged: (value) {
                      print(value);
                      formValues['role'] = value ?? 'Admin';
                    }),
                ElevatedButton(
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('ssss'))),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate())
                      print('formulariono valido');
                    return;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
