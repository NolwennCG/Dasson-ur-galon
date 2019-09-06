	/* Ce script a pour but de normaliser les erreurs typographiques restantes */

function initialise_typo() {
	
	var objets = document.getElementsByTagName('span');
	for (objet of objets) {
		if (objet.getAttribute('class') == 'l') {
			var enfants = objet.childNodes;
			for (enfant of enfants) {
				// Pour les fils text de <l> (majorité des cas car la ponctuation est rarement balisée)
				if (enfant.nodeType == 3) {
					re = /[\s\r\n]*\./g;
					enfant.nodeValue = enfant.nodeValue.replace(re, '.');
					re = /[\s\r\n]*,/g;
					enfant.nodeValue = enfant.nodeValue.replace(re, ',');
					re = /[\.]{3}/g;
					enfant.nodeValue = enfant.nodeValue.replace(re, '…');
					re = /('|‘)/g;
					enfant.nodeValue = enfant.nodeValue.replace(re, '’');
				}
				// Pour le cas des apostrophes non conformes
				if ((enfant.nodeType==1) && (enfant.getAttribute('class') == "elision")) {
                    var choices = enfant.childNodes;
					for (choice of choices) {
						if (choice.nodeType == 3) {
							re = /('|‘)/g;
							choice.nodeValue = choice.nodeValue.replace(re, '’');
						}
					}
                }
			}
        }
	}
}