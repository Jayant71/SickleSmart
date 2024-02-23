import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF8B0000), // Deep Red
  onPrimary: Color(0xFFFFFFFF), // White for text/icons on primary color
  primaryContainer: Color(0xFFDAA520), // Golden for primary container
  onPrimaryContainer:
      Color(0xFF000000), // Black for text/icons on primary container
  secondary: Color(0xFFF5DEB3), // Soft White or Wheat
  onSecondary: Color(0xFF000000), // Black for text/icons on secondary color
  secondaryContainer: Color(0xFFFFEFD5), // Papaya Whip for secondary container
  onSecondaryContainer:
      Color(0xFF000000), // Black for text/icons on secondary container
  error: Color(0xFFB00020), // Standard Material Error
  onError: Color(0xFFFFFFFF), // White for text/icons on error
  background: Color(0xFFFFFAFA), // Snow for background
  onBackground: Color(0xFF000000), // Black for text/icons on background
  surface: Color(0xFFFFFAFA), // Snow for surface
  onSurface: Color(0xFF000000), // Black for text/icons on surface
  // Additional colors like tertiary, errorContainer, etc. can be defined similarly
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFDAA520), // Golden for primary color
  onPrimary: Color(0xFF000000), // Black for text/icons on primary color
  primaryContainer: Color(0xFF8B0000), // Deep Red for primary container
  onPrimaryContainer:
      Color(0xFFFFFFFF), // White for text/icons on primary container
  secondary: Color(0xFFFFEFD5), // Papaya Whip for secondary color
  onSecondary: Color(0xFF000000), // Black for text/icons on secondary color
  secondaryContainer:
      Color(0xFFF5DEB3), // Soft White or Wheat for secondary container
  onSecondaryContainer:
      Color(0xFF000000), // Black for text/icons on secondary container
  error: Color(0xFFCF6679), // Standard Material Error for dark theme
  onError: Color(0xFF000000), // Black for text/icons on error
  background: Color(0xFF121212), // Dark background
  onBackground: Color(0xFFFFFFFF), // White for text/icons on background
  surface: Color(0xFF121212), // Dark surface
  onSurface: Color(0xFFFFFFFF), // White for text/icons on surface
  // Additional colors like tertiary, errorContainer, etc. can be defined similarly
);
