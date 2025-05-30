import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemChrome
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:file_picker/file_picker.dart'; // Import FilePicker

class BullyingReportingForm extends StatefulWidget {
  const BullyingReportingForm({Key? key}) : super(key: key);

  @override
  State<BullyingReportingForm> createState() => _BullyingReportingFormState();
}

class _BullyingReportingFormState extends State<BullyingReportingForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form fields
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String medium = 'Offline';
  TextEditingController locationController = TextEditingController();
  List<String> selectedPlatforms = [];

  List<String> victimNames = [''];
  List<String> witnessNames = [''];
  List<String> bullyNames = [''];
  TextEditingController _detailsController = TextEditingController(); // Controller for details field

  // For file picker
  List<PlatformFile> pickedFiles = []; // To store selected files

  @override
  void dispose() {
    _pageController.dispose();
    locationController.dispose();
    _detailsController.dispose(); // Dispose details controller
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentPage++);
    } else {
      // This is the submit action on the last page
      _submitForm();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _currentPage--);
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // Set lastDate to DateTime.now() to prevent future dates
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFFF2BE0F), // Yellow primary for picker
                  onPrimary: Colors.white, // White text on yellow primary
                  surface: Colors.white, // Background color
                  onSurface: Colors.black, // Text color on surface
                ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFFF2BE0F), // Yellow primary for picker
                  onPrimary: Colors.white, // White text on yellow primary
                  surface: Colors.white, // Background color
                  onSurface: Colors.black, // Text color on surface
                ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  void _addToList(List<String> list) {
    setState(() => list.add(''));
  }

  void _removeFromList(List<String> list, int index) {
    setState(() {
      list.removeAt(index);
      if (list.isEmpty) {
        list.add(''); // Ensure there's always at least one empty field
      }
    });
  }

  Future<void> _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mov', 'pdf', 'doc', 'docx'], // Specify allowed types
        allowMultiple: true, // Allow picking multiple files
      );

      if (result != null) {
        setState(() {
          pickedFiles = result.files;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected ${pickedFiles.length} file(s).'),
            backgroundColor: Colors.blue,
          ),
        );
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File selection cancelled.')),
        );
      }
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: ${e.message}')),
      );
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: ${e.toString()}')),
      );
    }
  }


  Future<void> _submitForm() async {
    // Filter out empty strings from name lists
    final cleanedVictimNames = victimNames.where((name) => name.isNotEmpty).toList();
    final cleanedWitnessNames = witnessNames.where((name) => name.isNotEmpty).toList();
    final cleanedBullyNames = bullyNames.where((name) => name.isNotEmpty).toList();

    // Prepare file data for Firestore (storing paths/names, actual upload would go to Storage)
    final List<Map<String, dynamic>> fileData = pickedFiles.map((file) => {
      'name': file.name,
      'size': file.size,
      'extension': file.extension,
      // In a real app, you would upload the file to Firebase Storage
      // and store the download URL here instead of the local path.
      // 'url': 'firebase_storage_download_url_here',
    }).toList();


    final formData = {
      'type': medium, // Using 'medium' as 'type'
      'location': medium == 'Offline' ? locationController.text : null,
      'platforms': medium == 'Online' ? selectedPlatforms : null,
      'date': selectedDate?.toIso8601String(),
      'time': selectedTime != null ? selectedTime!.format(context) : null,
      'details': _detailsController.text,
      'victimNames': cleanedVictimNames,
      'witnessNames': cleanedWitnessNames,
      'bullyNames': cleanedBullyNames,
      'proofFiles': fileData, // Add picked file metadata
      'timestamp': FieldValue.serverTimestamp(), // Add a server timestamp
    };

    try {
      await FirebaseFirestore.instance
          .collection("ReportingForm")
          .add(formData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bullying report submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Optionally, reset the form or navigate away
      _pageController.jumpToPage(0);
      setState(() {
        _currentPage = 0;
        selectedDate = null;
        selectedTime = null;
        medium = 'Offline';
        locationController.clear();
        selectedPlatforms = [];
        victimNames = [''];
        witnessNames = [''];
        bullyNames = [''];
        _detailsController.clear();
        pickedFiles = []; // Clear picked files after submission
      });
    } catch (e) {
      print("Error submitting form: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit report: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows content to extend behind the app bar
      appBar: AppBar(
        title: const Text('Report Bullying'),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparent background
        foregroundColor: Colors.white, // White text
        elevation: 0, // No shadow
        systemOverlayStyle: SystemUiOverlayStyle.light, // For light status bar icons
      ),
      // Set the background image for the entire body
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/Android Large - 12.png"),
            fit: BoxFit.cover, // Cover the entire background
          ),
        ),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Disable swipe
          children: [
            _buildMediumDateTimePage(),
            _buildNamesPage(),
            _buildProofSubmitPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Visibility(
                  visible: _currentPage > 0,
                  replacement: const SizedBox.shrink(), // Hide "Back" button on first page
                  child: ElevatedButton(
                    onPressed: _previousPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2BE0F), // Yellow background
                      foregroundColor: Colors.white, // White text
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Back'),
                  ),
                ),
              ),
              if (_currentPage > 0) const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2BE0F), // Yellow background
                    foregroundColor: Colors.white, // White text for contrast
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(_currentPage == 2 ? 'Submit Report' : 'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediumDateTimePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Added a SizedBox to push content below the transparent AppBar
          SizedBox(height: AppBar().preferredSize.height + 20),
          Text(
            'Where did the bullying occur?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white), // White text for heading
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text('Offline'),
                  selected: medium == 'Offline',
                  onSelected: (selected) => setState(() => medium = 'Offline'),
                  selectedColor: const Color(0xFFF2BE0F), // Solid yellow when selected
                  labelStyle: TextStyle(
                      color: medium == 'Offline'
                          ? Colors.white // White text for selected
                          : Colors.black), // Black text for unselected
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: medium == 'Offline'
                              ? const Color(0xFFF2BE0F) // Yellow border
                              : Colors.grey)),
                  backgroundColor: Colors.white, // Pure white background
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ChoiceChip(
                  label: const Text('Online'),
                  selected: medium == 'Online',
                  onSelected: (selected) => setState(() => medium = 'Online'),
                  selectedColor: const Color(0xFFF2BE0F), // Solid yellow when selected
                  labelStyle: TextStyle(
                      color: medium == 'Online'
                          ? Colors.white // White text for selected
                          : Colors.black), // Black text for unselected
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: medium == 'Online'
                              ? const Color(0xFFF2BE0F) // Yellow border
                              : Colors.grey)),
                  backgroundColor: Colors.white, // Pure white background
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          if (medium == 'Offline')
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Specific Location (e.g., School playground, Park)',
                labelStyle: const TextStyle(color: Colors.black), // Black label text for pure white background
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                prefixIcon: const Icon(Icons.location_on, color: Color(0xFFEB7C10)), // Orange icon
                filled: true, // Fill the text field background
                fillColor: Colors.white, // Pure white fill
              ),
              onChanged: (value) => locationController.text = value,
              style: const TextStyle(color: Colors.black), // Black text input
            )
          else if (medium == 'Online')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select online platforms:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white), // White text
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'Instagram',
                    'Facebook',
                    'Snapchat',
                    'TikTok',
                    'WhatsApp',
                    'Twitter',
                    'Discord',
                    'Other'
                  ].map((platform) => FilterChip(
                        label: Text(platform),
                        selected: selectedPlatforms.contains(platform),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedPlatforms.add(platform);
                            } else {
                              selectedPlatforms.remove(platform);
                            }
                          });
                        },
                        selectedColor:
                            const Color(0xFFF2BE0F), // Solid yellow when selected
                        labelStyle: TextStyle(
                            color: selectedPlatforms.contains(platform)
                                ? Colors.white // White text for selected
                                : Colors.black), // Black text for unselected
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: selectedPlatforms.contains(platform)
                                    ? const Color(0xFFF2BE0F) // Yellow border
                                    : Colors.grey)),
                        checkmarkColor: const Color(0xFFEB7C10), // Orange checkmark
                        backgroundColor: Colors.white, // Pure white background
                      )).toList(),
                ),
              ],
            ),
          const SizedBox(height: 30),
          Text(
            'When did the bullying occur?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white), // White text for heading
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white, // Pure white card background
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Color(0xFFEB7C10)), // Orange icon
              title: Text(
                selectedDate == null
                    ? 'Select Date'
                    : 'Date: ${selectedDate!.toLocal()}'.split(' ')[0],
                style: TextStyle(
                    color: selectedDate == null ? Colors.grey[700] : Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                debugPrint('Select Date tapped'); // Debug print
                _selectDate();
              },
            ),
          ),
          const SizedBox(height: 15),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white, // Pure white card background
            child: ListTile(
              leading: const Icon(Icons.access_time, color: Color(0xFFEB7C10)), // Orange icon
              title: Text(
                selectedTime == null
                    ? 'Select Time'
                    : 'Time: ${selectedTime!.format(context)}',
                style: TextStyle(
                    color: selectedTime == null ? Colors.grey[700] : Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                debugPrint('Select Time tapped'); // Debug print
                _selectTime();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNamesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Added a SizedBox to push content below the transparent AppBar
          SizedBox(height: AppBar().preferredSize.height + 20),
          _buildNameSection('Victim Names', victimNames),
          const SizedBox(height: 30),
          _buildNameSection('Witness Names', witnessNames),
          const SizedBox(height: 30),
          _buildNameSection('Bully Names', bullyNames),
        ],
      ),
    );
  }

  Widget _buildNameSection(String label, List<String> namesList) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white, // Pure white card background
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black), // Black text for section title
            ),
            const SizedBox(height: 15),
            ...List.generate(namesList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: namesList[index],
                        decoration: InputDecoration(
                          hintText: 'Enter ${label.toLowerCase().replaceAll(' names', '')} ${index + 1}',
                          hintStyle: const TextStyle(color: Colors.grey), // Grey hint text
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          filled: true, // Fill the text field background
                          fillColor: Colors.white, // Pure white fill
                        ),
                        onChanged: (value) => namesList[index] = value,
                        style: const TextStyle(color: Colors.black), // Black text input
                      ),
                    ),
                    if (namesList.length > 1) // Allow removal if more than one field
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Colors.red[400]),
                        onPressed: () => _removeFromList(namesList, index),
                      ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () => _addToList(namesList),
                icon: const Icon(Icons.add, color: Colors.white), // White icon
                label: Text('Add ${label.replaceAll(' Names', '')}'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2BE0F), // Yellow background
                  foregroundColor: Colors.white, // White text
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProofSubmitPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Added a SizedBox to push content below the transparent AppBar
          SizedBox(height: AppBar().preferredSize.height + 20),
          Text(
            'Upload Proof',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white), // White text for heading
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Details text field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: TextFormField(
              controller: _detailsController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Provide details of the bullying incident',
                labelStyle: const TextStyle(color: Colors.black), // Black label text
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                filled: true,
                fillColor: Colors.white, // Pure white fill
              ),
              style: const TextStyle(color: Colors.black), // Black text input
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white, // Pure white background
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[300]!, style: BorderStyle.none, width: 2),
            ),
            child: Column(
              children: [
                const Icon(Icons.cloud_upload, size: 80, color: Color(0xFFEB7C10)), // Orange icon
                const SizedBox(height: 15),
                Text(
                  'Drag & Drop your files here or',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black), // Black text
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _pickFiles, // Call the new _pickFiles function
                  icon: const Icon(Icons.folder_open, color: Colors.white), // White icon
                  label: const Text('Choose File'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2BE0F), // Yellow background
                    foregroundColor: Colors.white, // White text
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '(Images, videos, documents - max 10MB)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black), // Black text
                  textAlign: TextAlign.center,
                ),
                if (pickedFiles.isNotEmpty) // Display picked files
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected Files:',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        ...pickedFiles.map((file) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            '• ${file.name} (${(file.size / 1024 / 1024).toStringAsFixed(2)} MB)',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                          ),
                        )).toList(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // The submit button is now in the bottom navigation bar
        ],
      ),
    );
  }
}
