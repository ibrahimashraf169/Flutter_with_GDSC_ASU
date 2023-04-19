import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Flexible(
          child: DefaultTabController(
              length: 2,
              child: SafeArea(
                  child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        // backgroundColor: const Color(0x0045d1fd),
                        backgroundColor: Colors.blue,
                        // leading: BackButton(onPressed: (){ },color: Colors.white, ),
                        leading: IconButton(
                          icon: Icon(IconData(0xe093,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true)),
                          onPressed: () {},
                        ),
                        title: const Text(
                          "This is my first App",
                          style: TextStyle(color: Colors.white),
                        ),
                        centerTitle: true,
                        actions: const [
                          Icon(IconData(0xe3dc,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true)),
                        ],
                        bottom: TabBar(
                          tabs: [
                            Tab(
                              icon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconData(0xe3b2,
                                        fontFamily: 'MaterialIcons',
                                        matchTextDirection: true),
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              icon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconData(0xe08c,
                                        fontFamily: 'MaterialIcons',
                                        matchTextDirection: true),
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network('data:image/png;base64,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',
                                height: 200, width: 200),
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                          labelText: 'User Name',
                                          hintText: 'Enter Your Name',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2.0),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                          labelText: 'Password',
                                          hintText: 'Enter Password',
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                        Colors.blue, // background color
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(25),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Dont have an account? ",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )))))));
}