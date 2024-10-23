import 'dart:io'; // For using File class
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase Authentication
import '../../model/products.dart';
import '../../provider/create_provider.dart';

class CreateProductPage extends ConsumerStatefulWidget {
  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends ConsumerState<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form inputs
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _ratingRateController = TextEditingController();
  final TextEditingController _ratingCountController = TextEditingController();

  // Variable to store the picked image
  File? _pickedImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  // Function to create a new product
  Future<void> _createProduct() async {
    // Get the logged-in user
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // If the user is not logged in, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to create a product')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_pickedImage == null) {
        // Show a SnackBar if no image is selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an image')),
        );
        return;
      }

      final product = Product(
        id: DateTime.now().millisecondsSinceEpoch, // Unique ID
        title: _titleController.text,
        price: double.parse(_priceController.text),
        description: _descriptionController.text,
        category: _categoryController.text,
        image: _pickedImage!.path, // Store the image path
        rating: Rating(
          rate: double.parse(_ratingRateController.text),
          count: int.parse(_ratingCountController.text),
        ),
        userId: user.uid, // Attach the logged-in user ID to the product
      );

      // Add product using Riverpod's provider
      await ref.read(productProvider).addProduct(product);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the category';
                    }
                    return null;
                  },
                ),
                // Display picked image
                if (_pickedImage != null)
                  Center(
                    child: Image.file(
                      _pickedImage!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(height: 10),
                // Button to pick an image
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                TextFormField(
                  controller: _ratingRateController,
                  decoration: InputDecoration(labelText: 'Rating (Rate)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the rating rate';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ratingCountController,
                  decoration: InputDecoration(labelText: 'Rating (Count)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the rating count';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _createProduct,
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _ratingRateController.dispose();
    _ratingCountController.dispose();
    super.dispose();
  }
}