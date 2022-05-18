String? validarEmail(String? value) {
  if (value!.isEmpty ||
      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value.trim())) {
    return 'Ingresa un correo valido';
  } else {
    return null;
  }
}

String? validarNombre(String? value) {
  if (value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
    return 'Ingresa un nombre valido';
  } else {
    return null;
  }
}

String? validarTelefono(String? value) {
  if (value!.isEmpty ||
      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
          .hasMatch(value.trim())) {
    return 'Ingresa un telefono valido';
  } else {
    return null;
  }
}
