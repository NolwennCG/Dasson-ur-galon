/* 
	=======================
	 CREATION DES CHECKBOX 
	=======================
*/

function initialise_checkboxes() {
	
	document.getElementById("select_tout").checked = false;

	tablAsso = prepare_tableau ();
	console.info(tablAsso);

	tablCategorie = ["vide"];
	tablAsso.forEach(function(y) {
		tablCategorie.push(y.categorie);
	}); 

	var AllCategorie = cleanArray(tablCategorie);
		// Création d'un tableau association pour réunir la catégorie et la valeur :
		var TablAllCategorie = [];
		for (var i=0 ; i<AllCategorie.length ; i=i+1) {
				var nouveau = {};
				nouveau['id'] = AllCategorie[i];
				nouveau['color'] = "white";
				TablAllCategorie.push(nouveau);
			}

	var affiche = document.getElementById("definition2");

	/* Création des checkbox */
	
	TablAllCategorie.forEach(function(cat) {
		var check = document.createElement('INPUT');
		check.type = "checkbox";
		check.id = cat.id ;
		check.value = cat.id ; 
		check.setAttribute('onclick','affiche_tout(this.id);'); 
		var text = document.createTextNode(cat.id.replace(/_/g, ' '));
		var div = document.createElement('div');
		div.style.backgroundColor = cat.color;
		div.setAttribute("n", "1");
		div.appendChild(check);
		div.appendChild(text);
		affiche.insertBefore(div,affiche.lastChild);
		tablAsso.forEach(function(norm) {
			if (norm.categorie == cat.id) {
				var check = document.createElement('INPUT');
				check.type = "checkbox";
				check.id = norm.categorie+'.'+norm.id ;
				check.value = norm.id ; 
				check.setAttribute('onclick','affiche_transformation(this.id);'); 
				var text = document.createTextNode(norm.id.replace(/_/g, ' '));
				var div = document.createElement('div');
				div.style.backgroundColor = norm.color;
				div.setAttribute("n", "2");
				div.appendChild(check);
				div.appendChild(text);
				affiche.insertBefore(div,affiche.lastChild);
			}	
		});
	});

	var vide = document.getElementById("vide").parentNode;
	vide.remove();


}

function prepare_tableau () { 

	/*  Tableau des attributs  */

	var tablAttrPlu = []; // premier tableau : il va contenir tous les attributs plusieurs fois (doublons)

	var objets = document.getElementsByTagName('span');
	for (objet of objets) {
		if (objet.getAttribute('class') == 'l') {
			var enfants = objet.childNodes;
			for (enfant of enfants) {
				if (enfant.nodeType == 1) {
					var attr = enfant.getAttribute("class");
					enfant.setAttribute('title', attr);
					if (attr != null) {
						tablAttrPlu.push(attr);
					}
				}
			}
        }
	}
	
	var tablAttrClear = cleanArray(tablAttrPlu);  // deuxieme tableau : il va contenir tous les attributs une seule fois
	tablAttrClear.sort();

	/* 	Séparation de la catégorie et de la valeur dans deux tableaux différents : */

	var tablCategorie = [];
	var tablValeur = [];
	tablAttrClear.forEach(function(y) {
		var tablDuo = y.split(".");
		tablCategorie.push(tablDuo[0]);
		tablValeur.push(tablDuo[1]);
	}); 

	/*  Tableau des couleurs  */
	
	var tablColor = [];
	for(i=0;i<tablAttrClear.length;i++){
		couleur = getRandomColor();
		tablColor.push(couleur);
	}

	var longeurAttr = tablAttrClear.length ; 
	if (tablColor.length > longeurAttr) {
		tablColor.length = longeurAttr;
	}
		
	/*  Tableau regroupant les deux  */
		
	var tablAsso = [];
	for (var i=0 ; i<tablAttrClear.length ; i=i+1) {
			var nouveau = {};
			nouveau['categorie'] = tablCategorie[i]
			nouveau['id'] = tablValeur[i];
			nouveau['color'] = tablColor[i];
			tablAsso.push(nouveau);
		}
	
	return tablAsso;

}

function cleanArray(array) {
// cleanArray supprime les éléments en double dans un tableau :
  var i, j, len = array.length, out = [], obj = {};
  for (i = 0; i < len; i++) {
    obj[array[i]] = 0;
  }
  for (j in obj) {
    out.push(j);
  }
  return out;
}

function getRandomColor() {
	var color = "hsl(" + 360 * Math.random() + ',' +
                 (20 + 100 * Math.random()) + '%,' + 
                 (80 + 0 * Math.random()) + '%)';
	return color;
}

/* 
	========================
	 AFFICHAGE DES COULEURS 
	========================
*/

function affiche_transformation(id) { // Lien entre les checkboxes et les modifications à apporter au texte
	// affiche_transformation permet de regarder si la checkboxe est (action) cochée ou décochée, et d'agir en conséquence en appelant montre_note avec des valeurs différentes : 
	// Les if suivants permettent d'assigner une couleur à un id : ils définissent valeur de la variable id ; valeur de color sera reprise par la variable couleur

	tablAsso.forEach(function(norm) {
		if (id == norm.categorie+'.'+norm.id) {
			color = norm.color;
		}
	});

	if(document.getElementById(id).checked == true) { // Si la case vient d'être cochée... 
		modifie_spans(id, color,'100%'); // appel de la fonction montre_note() pour la tablAsso voulue = afficher
	} else { // Si, au contraire, la case vient d'être décochée... 
		modifie_spans(id, 'initial', '0%'); // appel de la fonction montre_note() pour la tablAsso voulue = cacher
		document.getElementById("select_tout").checked = false;
	}

	/* Effet cascade select all/n°2 */

	// Vérifie si au moins une checkboxe n°2 est cochée
	var atLeastOneChecked = false;
	tablAsso.forEach(function(norm) {
		if (document.getElementById(norm.categorie+'.'+norm.id).checked) {
		atLeastOneChecked = true;
		} 
	});

	// Activer l'effet cascade
	var niveau1 = id.split(".");
	if (atLeastOneChecked == true) {
		document.getElementById(niveau1[0]).checked = true; //coche le premier niveau de hierarchie dès qu'une case est cochée
	} else {
		document.getElementById(niveau1[0]).checked = false;
	}

	/* Effet cascade n°1/n°2 */

	// Vérifie si au moins une checkboxe n°2 est cochée
	var atLeastBisChecked = false;
	tablAsso.forEach(function(norm) {
		if (niveau1[0] == norm.categorie) {
			if (document.getElementById(norm.categorie+'.'+norm.id).checked) {
				atLeastBisChecked = true;
			} 
		if (atLeastBisChecked == true) {
			document.getElementById(niveau1[0]).checked = true; //coche le premier niveau de hierarchie dès qu'une case est cochée
		} else {
			document.getElementById(niveau1[0]).checked = false;
		}
	}
	});
  
}

function modifie_spans (classe, couleur, taille) { // Modification du texte
  var spans = document.getElementsByTagName('span');
      for (span of spans) {
          if (span.getAttribute('class') == classe) {
              span.style.backgroundColor = couleur;
              var enfants = span.childNodes;
              for (e of enfants) {
                  if ((e.nodeType==1) && (e.getAttribute('class') == "reg")) {
                      e.style.fontSize = taille;
				  }
				  if ((e.nodeType==1) && (e.getAttribute('class') == "corr")) {
					e.style.fontSize = taille;
				}
              }
          }
   }
}

function affiche_tout(id) { // Effet cascade par catégorie 

	if (document.getElementById(id).checked == true) {
		tablAsso.forEach(function(norm) {
			if (norm.categorie == id) {
				modifie_spans(norm.categorie+'.'+norm.id, norm.color, '100%');
				document.getElementById(norm.categorie+'.'+norm.id).checked = true;
			}
		});

	} else {
		tablAsso.forEach(function(norm) { 
			if (norm.categorie == id) {
				modifie_spans(norm.categorie+'.'+norm.id, "initial", '0%');
				document.getElementById(norm.categorie+'.'+norm.id).checked = false;
				document.getElementById("select_tout").checked = false;
			}	
		});
	}

}

function select_tout() { // Effet cascade pour "select all"

// select_tout permet de cocher toutes les checkboxes: 
	if (document.getElementById("select_tout").checked == true) {
		tablAsso.forEach(function(norm) {
			modifie_spans(norm.categorie+'.'+norm.id, norm.color, '100%');
			document.getElementById(norm.categorie+'.'+norm.id).checked = true;
			document.getElementById(norm.categorie).checked = true;
		});
		
	} else {
		tablAsso.forEach(function(norm) { 
			modifie_spans(norm.categorie+'.'+norm.id, "initial", '0%');
			document.getElementById(norm.categorie+'.'+norm.id).checked = false;
			document.getElementById(norm.categorie).checked = false;
		});
	}
	
}