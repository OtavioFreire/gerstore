import 'package:flutter/material.dart';
import 'package:gerstore/widget/input_field.dart';
import 'package:gerstore/blocs/login_blocs.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          // ignore: missing_return
          builder: (context, snapshot) {
            print(snapshot.data);
            switch(snapshot.data){
              case LoginState.LOADING:
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
                ),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
              return Stack(
                alignment: Alignment.center,
                children: <Widget> [
                  Container(),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(
                            Icons.store_mall_directory,
                            color: Colors.lightBlueAccent,
                            size: 160,
                          ),
                          InputField(
                            icon: Icons.person_outline,
                            hint: "Usuário",
                            obscure: false,
                            stream: _loginBloc.outEmail,
                            onChanged: _loginBloc.changeEmail,
                          ),
                          InputField(
                            icon: Icons.lock_outline,
                            hint: "Senha",
                            obscure: true,
                            stream: _loginBloc.outPassword,
                            onChanged: _loginBloc.changePassword,
                          ),
                          SizedBox(height: 32,),
                          StreamBuilder<bool>(
                              stream: _loginBloc.outSubmitValid,
                              builder: (context, snapshot) {
                                return SizedBox(
                                  height: 50,
                                  child: RaisedButton(
                                    onPressed: snapshot.hasData ? _loginBloc.submit : null,
                                    color: Colors.lightBlueAccent,
                                    child: Text('Login'),
                                    textColor: Colors.white,
                                    disabledColor: Colors.lightBlueAccent.withAlpha(140),
                                  ),
                                );
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        ),
    );
  }
}
