import 'dart:math';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _key = GlobalKey<FormState>();
  late MyFormState _state;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  void _onNameChanged() {
    setState(() {
      _state = _state.copyWith(name: Name.dirty(_nameController.text));
    });
  }

  void _onEmailChanged() {
    setState(() {
      _state = _state.copyWith(email: Email.dirty(_emailController.text));
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
        password: Password.dirty(_passwordController.text),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_key.currentState!.validate()) return;

    setState(() {
      _state = _state.copyWith(status: FormzSubmissionStatus.inProgress);
    });

    try {
      await _submitForm();
      _state = _state.copyWith(status: FormzSubmissionStatus.success);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePageBottom()));
    } catch (_) {
      _state = _state.copyWith(status: FormzSubmissionStatus.failure);
    }

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();

    const successSnackBar = SnackBar(
      content: Text('Submitted successfully! 🎉'),
    );
    const failureSnackBar = SnackBar(
      content: Text('Something went wrong... 🚨'),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _state.status.isSuccess ? successSnackBar : failureSnackBar,
      );

    if (_state.status.isSuccess) _resetForm();
  }

  Future<void> _submitForm() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (Random().nextInt(2) == 0) throw Exception();
  }

  void _resetForm() {
    _key.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() => _state = MyFormState());
  }

  @override
  void initState() {
    super.initState();
    _state = MyFormState();
    _nameController = TextEditingController(text: _state.name.value)
      ..addListener(_onNameChanged);
    _emailController = TextEditingController(text: _state.email.value)
      ..addListener(_onEmailChanged);
    _passwordController = TextEditingController(text: _state.password.value)
      ..addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name',
              helperText: 'Enter Your Name',
            ),
            validator: (_) => _state.name.displayError?.text(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
              helperText: 'A valid email e.g. joe.doe@gmail.com',
            ),
            validator: (_) => _state.email.displayError?.text(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              helperText:
                  'At least 8 characters including one letter and number',
              helperMaxLines: 2,
              labelText: 'Password',
              errorMaxLines: 2,
            ),
            validator: (_) => _state.password.displayError?.text(),
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 24),
          if (_state.status.isInProgress)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Submit'),
            ),
        ],
      ),
    );
  }
}

class MyFormState with FormzMixin {
  MyFormState({
    Name? name,
    //this.name = const Name.pure(),
    Email? email,
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
  })  : email = email ?? Email.pure(),
        name = name ?? Name.pure();

  final Name name;
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  MyFormState copyWith({
    Name? name,
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return MyFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [name, email, password];
}

enum NameValidationError { invalid }

// class Name extends FormzInput<String, NameValidationError>
//     with FormzInputErrorCacheMixin {
//   Name.pure([super.value = '']) : super.pure();

//   Name.dirty([super.value = '']) : super.dirty();
//   @override
//   NameValidationError? validator(String value) {
//     return value.isEmpty ? NameValidationError.invalid : null;
//   }
// }
class Name extends FormzInput<String, NameValidationError>
    with FormzInputErrorCacheMixin {
  Name.pure([super.value = '']) : super.pure();

  Name.dirty([super.value = '']) : super.dirty();

  static final _nameRegExp = RegExp(
    r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
  );

  @override
  NameValidationError? validator(String value) {
    return _nameRegExp.hasMatch(value) ? null : NameValidationError.invalid;
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError>
    with FormzInputErrorCacheMixin {
  Email.pure([super.value = '']) : super.pure();

  Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegex.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

extension on NameValidationError {
  String text() {
    switch (this) {
      case NameValidationError.invalid:
        return 'Please ensure You Entered Your Full Name';
    }
  }
}

extension on EmailValidationError {
  String text() {
    switch (this) {
      case EmailValidationError.invalid:
        return 'Please ensure the email entered is valid';
    }
  }
}

extension on PasswordValidationError {
  String text() {
    switch (this) {
      case PasswordValidationError.invalid:
        return '''Password must be at least 8 characters and contain at least one letter and number''';
    }
  }
}
