import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _bedroomsController = TextEditingController();
  final TextEditingController _bathroomsController = TextEditingController();
  final TextEditingController _garagesController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _addressController =
      TextEditingController(); // Nouveau champ
  final ImagePicker _picker = ImagePicker();

  XFile? _mainImage;
  List<XFile>? _additionalImages = [];
  XFile? _floorPlan; // Variable pour stocker le plan

  String? _propertyCategory = 'Maison';
  String? _status = 'À vendre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title: Text(
          'Ajouter une Propriété',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: _saveProperty,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                controller: _nameController,
                label: 'Nom de la Propriété',
                icon: Icons.home,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _descriptionController,
                label: 'Description',
                icon: Icons.description,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _bedroomsController,
                label: 'Nombre de Chambres',
                icon: Icons.bed,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nombre de chambres.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _bathroomsController,
                label: 'Nombre de Salles de Bain',
                icon: Icons.bathtub,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nombre de salles de bain.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _garagesController,
                label: 'Nombre de Garages',
                icon: Icons.garage,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nombre de garages.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _priceController,
                label: 'Prix (en CFA)',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prix.';
                  } else if (double.tryParse(value) == null) {
                    return 'Veuillez entrer un prix valide.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _longitudeController,
                label: 'Longitude',
                icon: Icons.location_on,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la longitude.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _latitudeController,
                label: 'Latitude',
                icon: Icons.location_on,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la latitude.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _areaController,
                label: 'Superficie (m²)',
                icon: Icons.square_foot,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la superficie.';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _addressController, // Nouveau champ pour l'adresse
                label: 'Adresse',
                icon: Icons.location_on,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse.';
                  }
                  return null;
                },
              ),
              _buildDropdown(
                label: 'Catégorie',
                icon: Icons.category,
                value: _propertyCategory,
                items: ['Maison', 'Appartement'],
                onChanged: (newValue) {
                  setState(() {
                    _propertyCategory = newValue;
                  });
                },
              ),
              _buildDropdown(
                label: 'Statut',
                icon: Icons.check_circle,
                value: _status,
                items: ['À vendre', 'À louer'],
                onChanged: (newValue) {
                  setState(() {
                    _status = newValue;
                  });
                },
              ),
              _buildImagePicker(
                label: 'Image principale:',
                icon: Icons.camera_alt,
                onPressed: _pickMainImage,
                image: _mainImage != null
                    ? Image.file(
                        File(_mainImage!.path),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              _buildImagePickerMultiple(
                label: 'Autres images:',
                icon: Icons.camera_alt,
                onPressed: _pickAdditionalImages,
                images: _additionalImages,
              ),
              _buildImagePicker(
                label: 'Plan de la propriété:',
                icon: Icons.image,
                onPressed: _pickFloorPlan,
                image: _floorPlan != null
                    ? Image.file(
                        File(_floorPlan!.path),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Soumettre',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int? maxLines,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(icon, color: Colors.orange[400]),
        ),
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(icon, color: Colors.orange[400]),
        ),
        onChanged: onChanged,
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildImagePicker({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required dynamic image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange[400]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(icon, color: Colors.orange[400], size: 40),
              ),
            ),
          ),
          if (image != null) ...[
            SizedBox(height: 8),
            image,
          ],
        ],
      ),
    );
  }

  Widget _buildImagePickerMultiple({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required List<XFile>? images,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange[400]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(icon, color: Colors.orange[400], size: 40),
              ),
            ),
          ),
          if (images != null && images.isNotEmpty) ...[
            SizedBox(height: 8),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(images[index].path),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _pickMainImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _mainImage = pickedFile;
    });
  }

  Future<void> _pickAdditionalImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      _additionalImages = pickedFiles;
    });
  }

  Future<void> _pickFloorPlan() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _floorPlan = pickedFile;
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Propriété ajoutée avec succès !')));
      _resetForm();
    }
  }

  void _saveProperty() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Propriété sauvegardée !')));
    }
  }

  void _resetForm() {
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _bedroomsController.clear();
    _bathroomsController.clear();
    _garagesController.clear();
    _longitudeController.clear();
    _latitudeController.clear();
    _areaController.clear();
    _addressController.clear(); // Réinitialisation du champ Adresse
    setState(() {
      _mainImage = null;
      _additionalImages = [];
      _floorPlan = null;
      _propertyCategory = 'Maison';
      _status = 'À vendre';
    });
  }
}
