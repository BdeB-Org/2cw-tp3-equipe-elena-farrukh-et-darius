function remplirDetailActeur(acteur_id) {
    remplirDetails(acteur_id);
    remplirListeFilms(acteur_id);
}

function remplirDetails(id) {
    console.log(dataTables);
    dataTables.acteurs.forEach(element => {
        console.log(element.nom);
        if (element.acteur_id == id) {
            document.getElementById("nom").innerText = element.nom;
            document.getElementById("prenom").innerText = `Prénom: ${element.prenom}`;
            document.getElementById("age").innerText = `Âge: ${element.age}`;
        }
    });
}

function remplirListeFilms(id){
    let listeFilms = document.getElementById("listeFilms");

    dataTables.films_acteurs.forEach(element =>{

        if(element.acteur_id == id){
            dataTables.films.forEach(film =>{
                if(element.film_id == film.film_id){
                    let li = createNode('li');
                    let a = createNode('a');
                    a.href = `detail.html?id=${film.film_id}`;
                    a.className = 'titreFilm';
                    a.innerText = `${film.titre}`;
                    append(li, a);
                    append(listeFilms, li);
                }
            });
        }

    });

}
