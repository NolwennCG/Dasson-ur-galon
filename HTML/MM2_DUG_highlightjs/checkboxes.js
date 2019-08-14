/* 
	=======================
	 CREATION DES CHECKBOX 
	=======================
*/

function initialise_checkboxes() {
	
	document.getElementById("affiche_tout").checked = false;

	tablAsso = prepare_tableau ();
	console.log(tablAsso);

	var affiche = document.getElementById("definition2");

	/* Création des checkbox */
	
	tablAsso.forEach(function(tabl) {
    var check = document.createElement('INPUT');
    check.type = "checkbox";
    check.id = tabl.id ;
    check.value = tabl.id ;
    check.setAttribute('onclick','affiche_transformation(this.id);'); 
    var text = document.createTextNode(tabl.id.replace('_', ' '));
    var div = document.createElement('div');
	div.style.backgroundColor = tabl.color;
    div.appendChild(check);
    div.appendChild(text);
    affiche.insertBefore(div,affiche.lastChild);
  });
	
}

function prepare_tableau () { 

	/*  Tableau des attributs  */

	var tablAttrPlu = [];

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
	
	var tablAttr = cleanArray(tablAttrPlu);
	tablAttr.sort();
	
	/*  Tableau des couleurs  */
	
	var tablColor = [];
	for(i=0;i<tablAttr.length;i++){
		couleur = getRandomColor();
		tablColor.push(couleur);
	}

	var longeurAttr = tablAttr.length ; 
	if (tablColor.length > longeurAttr) {
		tablColor.length = longeurAttr;
	}
		
	/*  Tableau regroupant les deux  */
		
	var tablAsso = [];
	for (var i=0 ; i<tablAttr.length ; i=i+1) {
			var nouveau = {};
			nouveau['id'] = tablAttr[i];
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

function affiche_transformation(id) {
	
  // Les if suivants permettent d'assigner une couleur à un id : ils définissent valeur de la variable id ; valeur de color sera reprise par la varaible couleur
  tablAsso.forEach(function(norm) {
    if (id == norm.id) color = norm.color;
  });

  if (document.getElementById(id).checked == true) { 
    modifie_spans(id,color,'100%'); 
  } else { 
    modifie_spans(id,'inherit','0%'); 
	document.getElementById("affiche_tout").checked = false;
  }
  
}

function modifie_spans (classe, couleur, taille) {
  var spans = document.getElementsByTagName('span');
      for (span of spans) {
          if (span.getAttribute('class') == classe) {
              span.style.backgroundColor = couleur;
              var enfants = span.childNodes;
              for (e of enfants) {
                  if ((e.nodeType==1) && (e.getAttribute('class') == "reg")) {
					  console.log(e);
                      e.style.fontSize = taille;
                  }
              }
          }
   }
}

function affiche_tout_tout() {

// affiche_tout permet de cocher toutes les checkboxes d'une catégorie d'un coup : 
	if (document.getElementById("affiche_tout").checked == true) {
		tablAsso.forEach(function(norm) {
			modifie_spans(norm.id, norm.color, '100%');
			document.getElementById(norm.id).checked = true;
		});
		
	} else {
		tablAsso.forEach(function(norm) { 
			modifie_spans(norm.id, "initial", '0%');
			document.getElementById(norm.id).checked = false;
		});
	}

}