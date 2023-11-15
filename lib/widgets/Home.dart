part of 'package:navigator/bloc/login_bloc.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late ProgressDialog progressDialog;

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login App")),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocListener<LoginBloc, LoginState>(
            listener: loginListener,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email or Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Enter the Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(_OnLoginClicked(
                            email: emailController.text,
                            pass: passwordController.text,
                          ));
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("OR"),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MySignUp()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Forget Password?"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginListener(BuildContext context, LoginState state) {
    if (state is _Loding) {
      progressDialog.show(msg: 'Fetching Data');
    } else {
      progressDialog.close();
    }
    if (state is _LoginSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Provider(
                  create: (context) => ListBloc(),
                  child: ListPage(),
                )),
      );
    } else if (state is _LoginFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.error)));
    }
  }
}
