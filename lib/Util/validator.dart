class Valtidator {
  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email.isEmpty) {
      return "Please enter an email.";
    } else if (!regex.hasMatch(email)) {
      return "Invalid email address.";
    } else {
      return null;
    }
  }

  String validateUsername(String username) {
    if (username.isEmpty)
      return "Please enter a name";
    else if (username.length < 6)
      return "Username must be at least 6 characters";
    else
      return null;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return "Password must not be empty.";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters.";
    } else
      return null;
  }
}
