import 'package:criminal_records/backend/repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum AuthenticationMode { login, register, adminLogin, adminRegister }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GetIt repo = GetIt.instance;
  Map<String, String> userInputData = {
    "Username": "",
    "Password": "",
    "Email": ""
  };
  bool shouldObscureText = true;
  AuthenticationMode currentMode = AuthenticationMode.login;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      repo
          .get<Repository>()
          .userAuthentication(data: userInputData, mode: currentMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: AnimatedContainer(
        padding: const EdgeInsets.all(40),
        duration: const Duration(milliseconds: 200),
        height: currentMode == AuthenticationMode.adminLogin ||
                currentMode == AuthenticationMode.login
            ? MediaQuery.of(context).size.height / 1.3
            : MediaQuery.of(context).size.height / 1.2,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FlutterLogo(
                  size: 50,
                ),
                currentMode == AuthenticationMode.adminLogin ||
                        currentMode == AuthenticationMode.adminRegister
                    ? const Text("Welcome, Admin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))
                    : const Text("Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                Container(
                  child: currentMode == AuthenticationMode.login ||
                          currentMode == AuthenticationMode.adminLogin
                      ? const Text(
                          "Please Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      : const Text("Please Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                TextFormField(
                  key: const ValueKey("Email"),
                  onChanged: (value) {
                    userInputData["Email"] = value;
                  },
                  validator: (value) {
                    if (!value!.contains('.com') || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                if (currentMode == AuthenticationMode.adminRegister ||
                    currentMode == AuthenticationMode.register)
                  TextFormField(
                    key: const ValueKey("Username"),
                    onChanged: (value) {
                      userInputData["Username"] = value;
                    },
                    validator: currentMode == AuthenticationMode.adminLogin ||
                            currentMode == AuthenticationMode.adminRegister
                        ? (value) {
                            if (value!.isEmpty) {
                              return "Please enter a code";
                            }
                            if (int.parse(value.toString()) != 100198) {
                              return "Incorrect Admin Code";
                            }

                            return null;
                          }
                        : (value) {
                            bool status = false;
                            if (value!.length < 4) {
                              return 'Username shall contain more than four charcters';
                            }
                            // for (var element in allUserName) {
                            //   if (value == element) {
                            //     status = true;
                            //   }
                            // }
                            if (status == true) {
                              return 'This Username is already taken';
                            }
                            return null;
                          },
                    autocorrect: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: currentMode ==
                                    AuthenticationMode.adminLogin ||
                                currentMode == AuthenticationMode.adminRegister
                            ? "Admin Code"
                            : "Username",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                TextFormField(
                  key: const ValueKey("Pass"),
                  onChanged: (value) {
                    userInputData["Password"] = value;
                  },
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password should contain eight or more characters';
                    }
                    return null;
                  },
                  obscureText: shouldObscureText,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: shouldObscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            shouldObscureText = !shouldObscureText;
                          });
                        },
                      ),
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.deepPurpleAccent)),
                      onPressed: () {
                        submitForm();
                      },
                      child: currentMode == AuthenticationMode.login ||
                              currentMode == AuthenticationMode.adminLogin
                          ? const Text("Login")
                          : const Text("Register")),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Text('or'),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.deepPurpleAccent)),
                      onPressed: () {
                        _formKey.currentState!.reset();
                        if (currentMode == AuthenticationMode.login ||
                            currentMode == AuthenticationMode.register) {
                          if (currentMode == AuthenticationMode.login) {
                            setState(() {
                              currentMode = AuthenticationMode.register;
                            });
                          } else {
                            setState(() {
                              currentMode = AuthenticationMode.login;
                            });
                          }
                        } else if (currentMode ==
                                AuthenticationMode.adminLogin ||
                            currentMode == AuthenticationMode.adminRegister) {
                          if (currentMode == AuthenticationMode.adminLogin) {
                            setState(() {
                              currentMode = AuthenticationMode.adminRegister;
                            });
                          } else {
                            setState(() {
                              currentMode = AuthenticationMode.adminLogin;
                            });
                          }
                        }

                        //print(currentMode);
                      },
                      child: currentMode == AuthenticationMode.login ||
                              currentMode == AuthenticationMode.adminLogin
                          ? const Text("Register")
                          : const Text("Login")),
                ),
                TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      if (currentMode == AuthenticationMode.login ||
                          currentMode == AuthenticationMode.register) {
                        setState(() {
                          currentMode = AuthenticationMode.adminLogin;
                        });
                      } else {
                        setState(() {
                          currentMode = AuthenticationMode.login;
                        });
                      }
                    },
                    child: currentMode == AuthenticationMode.adminLogin ||
                            currentMode == AuthenticationMode.adminRegister
                        ? const Text("Authenticate as User")
                        : const Text("Authenticate as Admin"))
              ],
            )),
      )),
    );
  }
}
