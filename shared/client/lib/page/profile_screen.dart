import 'dart:io';

import 'package:client/model/SessionState.dart';
import 'package:client/model/backend.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:client/page/welcome_screen.dart';
import 'package:client/widget/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/alert_dialog.dart';
import '../widget/image_widget.dart';

class ProfileScreen extends StatefulWidget {
  final SessionState _sessionState;
  final Backend _backend;

  ProfileScreen({
    required SessionState sessionState,
    required Backend backend,
  }):
        this._sessionState = sessionState,
        this._backend = backend;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final TextEditingController _usernameFieldController = TextEditingController();
  final TextEditingController _aboutFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _usernameFieldController.text = widget._sessionState.user.username;
    _aboutFieldController.text = widget._sessionState.user.about;
  }

  Future<void> _uploadNewProfileImage() async {
    XFile? file =  await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (file == null) {
      return;
    }

    File image = File(file.path);

    HttpResp<NewProfileImageResponseData> resp = await widget._backend.updateProfileImage(widget._sessionState, NewProfileImageRequestData(
      image: ImageData(
        data: image.readAsBytesSync(),
      ),
    ));

    if (resp.isData()) {
      setState(() {
        widget._sessionState.user.profileImage = resp.asData().image;
      });
    } else {
      alertDialog(context, title: 'An error has occurred', message: 'Your new profile image was not able to be uploaded, please try again.');
    }
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
          return WelcomeScreen();
        }),
        (Route<dynamic> route) => false,
      );
  }

  void _submitNewUsername() async {
    print("submitting new username");
    UpdateUserProfileRequestData requestData = UpdateUserProfileRequestData(
      username: _usernameFieldController.text,
      about: widget._sessionState.user.about,
    );

    HttpResp<UpdateUserProfileResponseData> response = await widget._backend.updateProfileData(widget._sessionState, requestData);

    if (response.isData()) {
      widget._sessionState.user.username = requestData.username;
    } else {
      _usernameFieldController.text = widget._sessionState.user.username;
      alertDialog(context, title: 'An error has occurred', message: 'Your profile data was not able to be saved, please try again.');
    }


  }

  Widget _buildLogoutButton() {
    return Container(
      padding: EdgeInsets.all(25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
        child: Text(
          'Logout',
          textDirection: TextDirection.ltr,
        ),
        onPressed: _logout,
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: _usernameFieldController,
        maxLength: 20,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: 'Username',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '',
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onSubmitted: (String newUsername) {
          _submitNewUsername();
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 40,
        right: 40,
      ),
      child: ProfileImageWidget(
        height: 250,
        sessionState: widget._sessionState,
        backend: widget._backend,
        uploadNewProfileImage: _uploadNewProfileImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildProfileImage(),
            const SizedBox(height: 24),
            _buildName(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }
}
