class UserModel {
  String fullName;
  String userName;
  String email;
  String noHP;
  String alamat;
  String jenisKelamin;
  String tglLahir;
  String tglGabung;
  String fotoProfile;
  String role;

  UserModel({
    this.fullName = '',
    this.userName = '',
    this.email = '',
    this.noHP = '',
    this.alamat = '',
    this.jenisKelamin = '',
    this.tglLahir = '',
    this.tglGabung = '',
    this.fotoProfile = '',
    this.role = '',
  });

  @override
  String toString() {
    return '$fullName | $userName | $email | $noHP | $alamat | $jenisKelamin | $tglLahir | $tglGabung | $fotoProfile | $role';
  }
}
