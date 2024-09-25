import 'package:flutter/material.dart';
import 'package:scrubsnepal/config/router/app_route.dart';
// import 'package:scrubsnepal/view/app/routes/app_routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isPasswordHidden = true;
  String email = '';
  String password = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectAddress(BuildContext context) async {
    // Implement the logic to select an address, for example, by launching a map or address picker.
    // Update the addressController with the selected address.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Login",
          // textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Image.asset(
                  'assets/images/logo_brown.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 15),

                // Name field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Eg. John Doe',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Date of Birth field
                TextFormField(
                  controller: dobController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Email/Phone Number field with validation
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your phone number',
                    hintText: 'Phone number',
                    filled: true,
                    fillColor: Color.fromARGB(225, 238, 238, 238),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // You can add more validation logic here
                    return null;
                  },
                ),
                // const SizedBox(height: 16),
// ---------------- address --------------------------------
                // Location field with icon for address selection
                // TextFormField(
                //   controller: addressController,
                //   readOnly: true,
                //   onTap: () {
                //     _selectAddress(context);
                //   },
                //   decoration: InputDecoration(
                //     labelText: 'Address',
                //     filled: true,
                //     fillColor: Colors.grey[200],
                //     border: const OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //     ),
                //     suffixIcon: IconButton(
                //       icon: const Icon(Icons.location_on),
                //       onPressed: () {
                //         _selectAddress(context);
                //       },
                //     ),
                //   ),
                // ),

                // Email field
                const SizedBox(height: 15),
                TextFormField(
                  onChanged: (text) {
                    email = text;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'Email',
                    filled: true,
                    fillColor: Color.fromARGB(225, 238, 238, 238),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more validation logic here
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password field with show/hide toggle and validation
                TextFormField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '********',
                    filled: true,
                    fillColor: Colors.grey[200],
                    suffixIcon: IconButton(
                      icon: isPasswordHidden
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Registration button
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic

                    // if (_key.currentState!.validate()) {
                    //       final entity = AuthEntity(
                    //         fname: _fnameController.text.trim(),
                    //         lname: _lnameController.text.trim(),
                    //         phone: _phoneController.text.trim(),
                    //         batch: selectedBatch!,
                    //         courses: _lstCourseSelected,
                    //         image:
                    //             ref.read(authViewModelProvider).imageName ?? '',
                    //         username:
                    //             _usernameController.text.trim().toLowerCase(),
                    //         password: _passwordController.text,
                    //       );
                    //       // Register user
                    //       ref
                    //           .read(authViewModelProvider.notifier)
                    //           .registerStudent(entity);
                    //     }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Register'),
                ),

                // Return to the login view or other navigation options
                TextButton(
                  onPressed: () {
                    // Handle navigation to the login view or other screens
                    Navigator.pushNamed(context, AppRoute.loginRoute);
                  },
                  child: const Text('Already have an account? Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
