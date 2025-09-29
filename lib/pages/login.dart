import 'package:flutter/material.dart';
import 'package:agroschoolbus/pages/map.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();


  void _getInput() {
    // Get the text from the TextEditingController
    // if (emailController.text == "") {
    //   return;
    // }
    // if (emailController.text != "1" && emailController.text != "2" && emailController.text != "3") {
    //   return;
    // }
    
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage(title: 'Map Page', userId: "SG9wjiW32pQZtzlavq7iW0DKlZ02")),
      );
    // String inputEmail = emailController.text;
    // String inputPass = passController.text;
    // if (inputEmail == "itzortzis" && inputPass == "password") {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MapPage(title: 'Map Page')),
    //   );
    // }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Μη αποδεκτά στοιχεία εισόδου. Προσπαθήστε ξανά.'),
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    // }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Icon at the top
                Image.asset(
                  'assets/icons/bio.jpeg', // Path to your asset
                  height: 150, // Adjust height as needed
                  width: 150, // Adjust width as needed
                ),
                
                

                // Text below the icon
                // const Text(
                //   "Agroschoolbus",
                //   style: TextStyle(
                //     fontSize: 28.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 20.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Agro',
                    style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'school',
                        style: TextStyle(color: Color.fromARGB(255,154,196,58), fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'bus',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '.BIO',
                        style: TextStyle(color: Color.fromARGB(255,154,196,58), fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                const Text(
                  "Πραγματοποιείστε είσοδο για να συνεχίσετε.",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),

                // Email TextField
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16.0),

                // Password TextField
                TextField(
                  controller: passController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 24.0),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    _getInput();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Color.fromARGB(255, 154, 196, 58),
                    foregroundColor: const Color.fromARGB(255, 77, 77, 77),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text("Είσοδος"),
                  
                ),

                const SizedBox(height: 60.0),

                

                const Text.rich(
                  TextSpan(
                    text: 'Αν δεν έχετε λογαριασμό, μπορείτε να κάνετε ', // Regular text
                    style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 117, 117, 117),), // Default style
                    children: <TextSpan>[
                      TextSpan(
                        text: 'εγγραφή', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          ), // Bold text for "run"
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
