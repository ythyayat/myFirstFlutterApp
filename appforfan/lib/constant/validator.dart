class Validation {
  bool name(String name) {
    bool nameValid =
        RegExp(r"^(?=.{3,50}$)[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
            .hasMatch(name);
    return nameValid;
  }

  bool password(String password) {
    bool cek1 = RegExp(r"^.{8,}$").hasMatch(password);
    if (!cek1) return false;
    bool cek3 = RegExp(r"(?=.*[A-Z])").hasMatch(password);
    if (!cek3) return false;
    bool cek2 = RegExp(r"(?=.*\d)").hasMatch(password);
    if (!cek2) return false;
    return true;
  }
}
