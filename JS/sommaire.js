function extraction_des_h3 () {
        
    var titres = document.getElementsByTagName('h3');
    
    var liste = document.createElement('ul');
    
    var num = 0;
    
    for (titre of titres) {
        
        num = num+1;
        titre.setAttribute('id','MM2_DUG_'+num); // ajout d'un identifiant à chaque h2
        
        var lien = document.createElement('a');
        var item = document.createElement('li');
        var text = document.createTextNode(titre.innerHTML);
        
        lien.appendChild(text);
        item.appendChild(lien);
        liste.appendChild(item);
        
        lien.setAttribute('href','#MM2_DUG_'+num);
    }
    
    var article = document.getElementById('sommaire');
    article.insertBefore(liste,article.firstChild);
    
    liste.style.backgroundColor='white';
}