class Produit {
  int codeproduit;
  String label;
  double pu;
  int qtestock;
  int qteseuil;

  Produit({
    required this.codeproduit,
    required this.pu,
    required this.label,
    required this.qtestock,
    required this.qteseuil,

  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      codeproduit: json['codeproduit'],
      pu: json['pu'],
      label: json['label'],
      qtestock: json['qtestock'],
      qteseuil: json['qteseuil'],
    );
  }

  Map<String, dynamic> toJson() => {
    'codeproduit': codeproduit,
    'pu': pu,
    'label': label,
    'qtestock': qtestock,
    'qteseuil': qteseuil,
  };
}
