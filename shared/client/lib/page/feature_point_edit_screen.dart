import 'dart:io';
import 'dart:typed_data';

import 'package:client/model/SessionState.dart';
import 'package:client/model/gencode/message_schema.pb.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/backend.dart';
import '../widget/carousel.dart';
import '../model/feature_point.dart';
import '../widget/image_widget.dart';

class FeaturePointEditScreen extends StatefulWidget {
  final SessionState _sessionState;
  final Backend _backend;
  final FeaturePoint _template;

  FeaturePointEditScreen(this._sessionState, this._backend, this._template);
  @override
  _FeaturePointEditScreenState createState() => _FeaturePointEditScreenState();
}

class _FeaturePointEditScreenState extends State<FeaturePointEditScreen> {
  final TextEditingController _editedTitle = TextEditingController();
  final TextEditingController _editedDescription = TextEditingController();
  final List<FeaturePointImageData> _deletedImages = [];
  final List<ImageData> _uploadedImages = [];

  @override
  void initState() {
    super.initState();
    _editedTitle.text = widget._template.raw.title;
    _editedDescription.text = widget._template.raw.description;
  }

  @override
  void dispose() {
    super.dispose();
    _editedTitle.dispose();
    _editedDescription.dispose();
  }

  Widget _formCategory({
    required String title,
    required Icon icon,
    required Widget categoryWidget,
  }) {
    return Card(
      child: ExpansionTile(
        maintainState: true,
        leading: icon,
        title: new Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: categoryWidget,
          ),
        ],
      ),
    );
  }

  Widget _textForm({
    required TextEditingController controller,
    int? maxChars,
    bool multiLine = false,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
        ),
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: multiLine ? null : 1,
        maxLength: maxChars,
      ),
    );
  }

  Future<XFile?> _pickImage() async {
    return await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
    );
  }

  Widget _fileUploadWidget({
    required double width,
    required double height,
  }) {
    return GestureDetector(
      onTap: () async {
        XFile? pickedImage = await _pickImage();
        if (pickedImage == null) {
          return;
        }

        File image = File(pickedImage.path);

        setState(() {
          _uploadedImages.add(ImageData(
            data: image.readAsBytesSync(),
          ));
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          ),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.file_upload_outlined),
            Text('Upload'),
          ],
        ),
      ),
    );
  }

  List<Widget> _getImages() {
    List<Widget> networkedImages = widget._template.raw.images
        .where((img) => !_deletedImages.contains(img))
        .map((FeaturePointImageData featurePointImageData) {
          return ImageWidget(
            aspectRatio: 1,
            height: 100,
            radius: 10,
            image: widget._backend.getImage(
              widget._sessionState,
              featurePointImageData.image.localPath,
            ),
            onDelete: () {
              setState(() {
                _deletedImages.add(featurePointImageData);
              });
          });
        }).toList();

    List<Widget> localUploadedImages = _uploadedImages
      .map((img) => ImageWidget(
        aspectRatio: 1,
        height: 100,
        radius: 10,
        image: Image.memory(
          Uint8List.fromList(img.data),
          fit: BoxFit.cover,
        ),
        onDelete: () {
          setState(() {
            _uploadedImages.remove(img);
          });
        },
      )).toList();

    return []..addAll(networkedImages)..addAll(localUploadedImages);
  }

  Widget _imageForm() {
    return Carousel<Widget>(
      height: 100,
      items: [
        _fileUploadWidget(
          width: 100,
          height: 100,
        ),
      ]..addAll(_getImages()),
      builderFunction: (context, item) {
        return item;
      },
    );
  }

  Widget _actionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: _cancelChanges,
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
            ),
            child: Text(
              'Save',
              textDirection: TextDirection.ltr,
            ),
            onPressed: _saveChanges,
          ),
        ),
      ],
    );
  }

  void _cancelChanges() {
    Navigator.pop(context, false);
  }

  void _saveChanges() async {

    var updateResp = await widget._backend.updateFeaturePoint(
      widget._sessionState,
      UpdateFeaturePointRequestData(
        id: widget._template.raw.featurePointId.toInt(),
        title: _editedTitle.text,
        description: _editedDescription.text,
        deleted: _deletedImages,
        uploaded: _uploadedImages,
      )
    );

    Navigator.pop(context, !updateResp.isError());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: true,
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              _formCategory(
                  title: 'Title',
                icon: Icon(Icons.title),
                categoryWidget: _textForm(
                    controller: _editedTitle,
                    maxChars: 20,
                  ),
              ),
              _formCategory(
                title: 'Description',
                icon: Icon(Icons.description),
                categoryWidget: _textForm(
                  controller: _editedDescription,
                  multiLine: true,
                  maxChars: 500,
                ),
              ),
              _formCategory(
                  title: 'Photos',
                  icon: Icon(Icons.camera),
                  categoryWidget: _imageForm(),
              ),
              _actionRow(),
            ],
          ),
        ),
      ),
    );
  }
}