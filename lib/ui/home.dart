import 'package:absensi/ui/atend/attend_screen.dart';
import 'package:absensi/ui/attend_history/attend_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'absen/absen_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,//biar mengunci tombol back perangkat
    onPopInvoked: (bool didpop){
        if(didpop){
          return;
        }
        _onWillPop(context);
    },
        child:
    Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
          child: Center(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 100,
                    height: 140,
                    child: Expanded(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ]
                            ),
                            child: const Column(

                              children: [
                                Image(image: AssetImage('assets/img/ic_absen.png'),
                                  width: 50,
                                  height: 50,),
                                Text('Absen Kehadiran')
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    width: 100,
                    height: 140,
                    margin: const EdgeInsets.all(10),
                    child: Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AbsentScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ]
                            ),
                            child: const Column(

                              children: [
                                Image(image: AssetImage('assets/img/ic_leave.png'),
                                  width: 50,
                                  height: 50,),
                                Text('Izin/cuti')
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    width: 100,
                    height: 140,
                    margin: const EdgeInsets.all(10),
                    child: Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendanceHistoryScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ]
                            ),
                            child: const Column(
                              children: [
                                Image(image: AssetImage('assets/img/ic_history.png'),
                                  width: 50,
                                  height: 50,),
                                Text('History Absen')
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              )
          )
      ),
    ));

  }
}


Future <bool> _onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Info!!'),
      content: Text('Apakah anda yakin inggin keluar dari applikasi?'),
      actions: [
        TextButton(
          child: const Text('Batal'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('Keluar'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    )
  )
  )??false; // jika dialog ditutup tanpa aksi mana aka akan dikembalikan false
}
