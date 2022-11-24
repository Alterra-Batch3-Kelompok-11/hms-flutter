import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: Image(
              image: AssetImage('assets/images/login_background.png'),
            ).image,
            fit: BoxFit.fitWidth,
          ),
        ),

        // child: Container(
        //   height: 372,
        //   color: Colors.white,
        //   margin: const EdgeInsets.only(
        //       top: 140, left: 20, right: 20, bottom: 20),
        //   padding: const EdgeInsets.only(top: 36, left: 20, right: 20),
        child: Container(
          height: 425,

          // color: Colors.white,
          margin:
              const EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 20),
          padding: const EdgeInsets.only(top: 36, left: 20, right: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Masuk',
                    style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // ignore: prefer_const_constructors
                  TextField(
                    style: GoogleFonts.poppins(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hoverColor: Colors.indigo.shade200,
                      enabledBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                      // borderRadius: BorderRadius.circular(25),
                      // borderSide: BorderSide(color: Colors.blueAccent)),

                      prefixIcon: Icon(Icons.person_outline),

                      hintText: 'Nomer lisensi*',
                      focusColor: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    style: GoogleFonts.poppins(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hoverColor: Colors.blueAccent,
                      enabledBorder: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      prefixIcon: Icon(Icons.lock_outline),
                      fillColor: Colors.blue.withOpacity(0.2),
                      filled: true,
                      hintText: 'Sandi*',
                      focusColor: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool? value) {},
                        value: false,
                      ),
                      Text(
                        'Ingat saya',
                        style: GoogleFonts.poppins(
                            color: Colors.blue.shade900,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      maximumSize: Size.fromHeight(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: Color.fromARGB(255, 13, 95, 218),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





















// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   // final UlasModel? ulasanModel;
//   // const LoginScreen({
//   //   Key? key,
//   //   this.ulasanModel,
//   // }) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _ulasController = TextEditingController();

//   // void showuserdialog(UlasModel ulas) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) {
//   //       return AlertDialog(
//   //         content: SizedBox(
//   //           height: 100,
//   //           width: 100,
//   //           child: ListView(
//   //             children: [
//   //               Text('Ulasan: ${ulas.ulasan}'),
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   // bool _isUpdate = false;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   if (widget.ulasanModel != null) {
//   //     _ulasController.text = widget.ulasanModel!.ulasan;
//   //     _isUpdate = true;
//   //   }
//   // }

//   @override
//   void dispose() {
//     _ulasController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 title: const Text("Buat Ulasan",
//                     style: TextStyle(
//                       color: Colors.pink,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 background: Image.network(
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLcxxZOcmlfCkUUKxwwHbaTurDkxfhcLsySQ&usqp=CAU",
//                   fit: BoxFit.fill,
//                 )),
//           ),
//         ];
//       },
//       body: Card(
        
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildNameField(),
//               buildButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildNameField() {
//     return Container(color: Colors.red,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         TextFormField(
//           controller: _ulasController,
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//             fillColor: Colors.grey.withOpacity(0.2),
//             labelText: 'Ulasan',
//             border: const UnderlineInputBorder(),
//             filled: true,
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget buildButton() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color.fromARGB(255, 13, 95, 218),
//       ),
//       child: Text(
//         'Submit',
//         style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
//       ),
//       onPressed: () {
//         // UlasModel? ulas;
//         // if (!_isUpdate) {
//         //   ulas = UlasModel(ulasan: _ulasController.text);
//         //   Provider.of<DbManager>(context, listen: false).addUlas(ulas);
//         // } else {
//         //   ulas = UlasModel(
//         //     id: widget.ulasanModel!.id,
//         //     ulasan: _ulasController.text,
//         //   );
//         //   Provider.of<DbManager>(context, listen: false).updateUlas(ulas);
//         // }
//         // showuserdialog(ulas);
//       },
//     );
//   }
// }