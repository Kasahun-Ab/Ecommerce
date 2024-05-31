List<Function> validator = <Function>[
  (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    // Split the full name into parts (assuming first name and last name)
    List<String> parts = value.trim().split(' ');

    // Ensure there are at least two parts (first name and last name)
    if (parts.length < 2) {
      return 'Please enter both your first name and last name';
    }

    // Check if each part contains only alphabetic characters
    for (String part in parts) {
      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(part)) {
        return 'Please enter a valid full name';
      }
    }

    return null;
  },
  (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    // Phone number must only contain digits
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number can only contain digits';
    }

    // Check for valid starting digits (09 or 07)
    if (!value.startsWith('09') && !value.startsWith('07')) {
      return 'Phone number must start with 09 or 07';
    }

    // Ensure total length is 10
    if (value.length != 10) {
      return 'Phone number must be 10 digits long';
    }

    return null;
  },
  (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Password must be at least 8 characters long
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Password must contain at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Password must contain at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Password must contain at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Password must contain at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }
];
