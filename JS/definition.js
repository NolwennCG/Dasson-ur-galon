function visualise_mots_clefs() {

    extraction_des_h();

    var spans = document.getElementsByClassName('motclef'); 
    for (span of spans) {
        var attr = span.getAttribute("class");
        var tablDuo = attr.split(" ");
		var attr = tablDuo[1];
        span.setAttribute('onMouseUp','montre_definition(\''+attr+'\');');
        //span.setAttribute('onmouseout','efface_definition();'); 
    }
}

function montre_definition (mot) {

    definitions.forEach(function(tabl) {
        if (mot == tabl.id) {
            var description = '<b> '+tabl.TextNode+' : </b>';
            description = description+tabl.def;
            document.getElementById('definition').innerHTML = description;
        }
    });

}

var definitions = [
    {"id": 'tonique', "TextNode": 'tonique', "def": 'est tonique l’accent qui met systématiquement en relief une syllabe dans un mot en augmentant la hauteur, la force ou la durée du son, souvent une combinaison de ces trois facteurs.'}, 
    {"id": 'amuït', "TextNode": 'amuïssement', "def": 'atténuation ou, le plus souvent, la disparition complète d\'un phonème ou d\'une syllabe dans un mot.'}, 
    {"id": 'compilatoire', "TextNode": 'version compilatoire', "def": 'version de l’édition qui présente dans le même texte la version d’origine et la version normalisée.'}, 
    {"id": 'brève', "TextNode": 'voyelle brève', "def": 'relatif à la quantité vocalique de la voyelle.'}, 
    {"id": 'diacritique', "TextNode": 'diacritique (signe)', "def": 'signe ou lettre que l’on ajoute à un caractère de l’alphabet usuel pour lui conférer une valeur nouvelle (comme le ù ou le ñ).'}, 
    {"id": 'digramme', "TextNode": 'digramme', "def": 'ensemble de deux caractères employé pour transcrire un son unique.'}, 
    {"id": 'diphtong', "TextNode": 'diphtongue', "def": 'groupe de deux voyelles constituant un seul élément syllabique.'}, 
    {"id": 'épenth', "TextNode": 'épenthèse', "def": 'apparition d’une voyelle ou d’une consonne non étymologique dans un mot.'}, 
    {"id": 'ferm', "TextNode": 'voyelle fermée', "def": 'est fermée une voyelle qui est caractérisée par une position de la langue aussi proche que possible du palais sans entraîner l\'émission d\'une consonne.'}, 
    {"id": 'final', "TextNode": 'finale', "def": 'est finale une lettre ou un son en fin d’un mot.'}, 
    {"id": 'fricativ', "TextNode": 'fricative', "def": 'est frivative une consonne qui permet le passage de l’air pendant qu’on l’a prononce.'}, 
    {"id": 'graphème', "TextNode": 'graphème', "def": 'lettre ou groupe de lettres transcrivant un phonème.'}, 
    {"id": 'hiatus', "TextNode": 'hiatus', "def": 'rencontre de deux voyelles prononcées, à l\'intérieur d\'un mot ou entre deux mots énoncés sans pause.'}, 
    {"id": 'initial', "TextNode": 'initiale', "def": 'est initiale une lettre ou un son au commencement d’un mot.'}, 
    {"id": 'intervocalique', "TextNode": 'consonne intervocalique', "def": 'est intervocalique une consonne placé entre deux voyelles.'}, 
    {"id": 'KTL', "TextNode": 'KTL', "def": 'abréviation de Kerne-Leon-Treger, correspond à une norme orthographique pour les dialectes relativement proches de ces trois évêchés de Basse-Bretagne. Antérieur au peurunvan incluant le vannetais.'}, 
    {"id": 'longue', "TextNode": 'voyelle longue', "def": 'relatif à la quantité vocalique de la voyelle.'}, 
    {"id": 'métathèse', "TextNode": 'métathèse', "def": 'déplacement de voyelles, de consonnes ou de syllabes à l’intérieur d’un mot.'}, 
    {"id": 'monophtongaison', "TextNode": 'monophtongue', "def": 'voyelle constituée d\'un seul élément vocalique.'}, 
    {"id": 'mutation', "TextNode": 'mutation consonantique', "def": 'modification phonétique qui voit la consonne d\'un mot changer selon son environnement morphologique ou syntaxique.'}, 
    {"id": 'nasal', "TextNode": 'nasale', "def": 'est nasale une voyelle dont l’air expiré passe par la bouche et le nez pendant qu’on l’a prononce.'}, 
    {"id": 'normalis', "TextNode": 'normalisation', "def": 'processus de standardisation et de développement d’une norme pour une langue.'}, 
    {"id": 'occlusive', "TextNode": 'occlusive', "def": 'est occlusive une consonne dont l’articulation comporte une occlusion du canal buccal en un point.'}, 
    {"id": 'ouvert', "TextNode": 'voyelle ouverte', "def": 'est ouverte une voyelle qui caractérisée par une position de la langue aussi éloignée que possible du palais et une bouche plus ou moins largement ouverte.'}, 
    {"id": 'palatal', "TextNode": 'palatale', "def": 'est palatale une voyelle ou consonne dont l’articulation se fait dans la région du palais dur.'}, 
    {"id": 'peurunvan', "TextNode": 'peurunvan (normalisé)', "def": 'orthographe unifiée du breton, à noter que l’unification n’est que graphique et ne touche pas la prononciation.'}, 
    {"id": 'skoueriekadur', "TextNode": 'skoueriekadur (normalisation)', "def": 'processus de standardisation et de développement d’une norme pour une langue.'}, 
    {"id": 'spira', "TextNode": 'spirante', "def": 'est spirante une consonne que l’on prononce en laissant échapper l’air par un canal buccal étroit et avec frottement : f, s, z.'}, 
    {"id": 'tilde', "TextNode": 'tilde', "def": 'signe diacritique en forme de s inversé et couché, on le retrouve que le ñ en breton.'}, 
    {"id": 'trigramme', "TextNode": 'trigramme', "def": 'ensemble de trois caractères employé pour transcrire un son unique.'}, 
    {"id": 'vannetais', "TextNode": 'vannetais', "def": 'dialecte breton du Pays de Vannes'}, 
    {"id": 'vélaire', "TextNode": 'vélaire', "def": 'est vélaire une consonne articulée entre la partie postérieure de la langue et le palais mou.'}, 
    {"id": 'vois', "TextNode": 'voisé', "def": 'est voisée une consonne qui fait vibrer les cordes vocales.'}, 
];

function extraction_des_h () {
        
    var titres = document.getElementsByTagName('h4');
    var liste = document.createElement('ul');
    
    var num = 0;
    
    for (titre of titres) {
        
        num = num+1;
        titre.setAttribute('id','MM2_DUG_'+num);
        
        var lien = document.createElement('a');
        var item = document.createElement('li');
        var text = document.createTextNode(titre.innerHTML);
        
        lien.appendChild(text);
        item.appendChild(lien);
        liste.appendChild(item);
        
        lien.setAttribute('href','#MM2_DUG_'+num);

    }
    
    var article = document.getElementById('sommaire');
    article.insertBefore(liste,article.lastChild);
}