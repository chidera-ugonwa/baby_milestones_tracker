import 'package:baby_milestones_tracker/Pages/Screens/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EditMilestone extends StatefulWidget {
  const EditMilestone(
      {super.key,
      required this.photoUrl,
      required this.title,
      required this.desc,
      required this.date});

  final String photoUrl;
  final String title;
  final String desc;
  final String date;

  @override
  State<EditMilestone> createState() => _EditMilestoneState();
}

class _EditMilestoneState extends State<EditMilestone> {
  final FirebaseService _fService = FirebaseService();
  String filePath = '';
  File file = File('');
  String fileName = '';
  String error = '';
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controllers
  final titleEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final dateEditingController = TextEditingController();

//showAlert widget defined
  Widget showAlert() {
    if (error != '') {
      return Container(
        color: Colors.redAccent,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.error_outline, color: Colors.white),
          ),
          Expanded(
              child: Text(error,
                  style: const TextStyle(
                    color: Colors.white,
                  ))),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() => error = '');
            },
            color: Colors.white,
          ),
        ]),
      );
    }
    return const SizedBox(
      height: 0,
    );
  }

  //take photo function
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      file = File(pickedFile!.path);
      fileName = pickedFile.name;
    });
    final directory = await getApplicationDocumentsDirectory();

    final File profileImage =
        await file.copy("${directory.path}/${pickedFile!.name}");
    setState(() => filePath = profileImage.path);
  }

//image widget
  ImageProvider<Object> image() {
    final image = filePath != ''
        ? FileImage(File(filePath))
        : NetworkImage(widget.photoUrl);

    return image as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    //title field
    final titleField = TextFormField(
      autofocus: false,
      controller: titleEditingController,
      keyboardType: TextInputType.text,
      validator: (val) => val!.isEmpty ? 'Fill out this field' : null,
      onSaved: (value) async {
        titleEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.title),
        prefixIconColor: Colors.blue,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //description field

    final descriptionField = TextFormField(
      autofocus: false,
      controller: descriptionEditingController,
      keyboardType: TextInputType.text,
      validator: (val) => val!.isEmpty ? 'Fill out this field' : null,
      onSaved: (value) async {
        descriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.description),
        prefixIconColor: Colors.blue,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: widget.desc,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //date field

    final dateField = TextFormField(
      autofocus: false,
      controller: dateEditingController,
      keyboardType: TextInputType.datetime,
      validator: (val) => val!.isEmpty ? 'Fill out this field' : null,
      onSaved: (value) async {
        dateEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.date_range),
        prefixIconColor: Colors.blue,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: widget.date,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //create milestone button

    final createMilestoneButton = isLoading
        ? const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.blue,
              strokeWidth: 5,
            ),
          )
        : Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  String photoUrl = await _fService.uploadFile(file, fileName);
                  debugPrint(photoUrl);
                  dynamic result = await _fService.addMilestone(
                      titleField.controller!.text,
                      descriptionField.controller!.text,
                      photoUrl,
                      dateField.controller!.text);
                  if (result != null) {
                    setState(() =>
                        error = 'Something went wrong...Please try again');
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Edit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );

    //add photo button
    final addPhotoButton = Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: image()),
      ),
      child: IconButton(
        onPressed: () {
          takePhoto(ImageSource.gallery);
        },
        icon: const Icon(Icons.add),
        iconSize: 32,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
        title: const Text('Edit Milestone'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showAlert(),
                    titleField,
                    const SizedBox(height: 30),
                    dateField,
                    const SizedBox(height: 30),
                    descriptionField,
                    const SizedBox(height: 10),
                    const SizedBox(
                        child: Text(
                      'Add Image',
                      style: TextStyle(fontSize: 15),
                    )),
                    const SizedBox(height: 10),
                    addPhotoButton,
                    const SizedBox(height: 30),
                    createMilestoneButton
                  ])),
        ),
      ),
    );
  }
}
