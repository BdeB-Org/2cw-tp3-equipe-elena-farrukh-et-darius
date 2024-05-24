// Function to fill film details
function remplirDetailFilm(filmId) {
    remplirDetails(filmId);

    remplirActeurs(filmId);

    remplirCommentaires(filmId);

    moyenneCommentaires(filmId);
}

function moyenneCommentaires(id){
    var somme = 0;
    var nbCommentaires = 0;
    dataTables.commentaires.forEach(element => {
        if(element.film_id == id){
            nbCommentaires++;
            somme += element.score;
        }
    });
    let score = document.getElementById("score");
    if(nbCommentaires == 0){
        score.innerHTML = "Aucune évaluation";
    }else{
        let innerHTML = "Score: ";
        for(let i = 0; i < somme/nbCommentaires; i++){
            innerHTML += "⭐"
        }
        score.innerHTML = innerHTML;
    }
}

function remplirCommentaires(id){
    let listeCommentaires = document.getElementById("listeCommentaires");
    listeCommentaires.innerHTML = ``; //Efface tous les commentaires
    dataTables.commentaires.forEach(element => {
        if(element.film_id == id){
            let li = createNode("li");
            li.innerHTML = `(${element.score}⭐) ${element.description}`;
            append(listeCommentaires, li);
        }
    });
}

function remplirActeurs(id){
    //Liste à remplir
    let listeActeurs = document.getElementById("listeActeurs");
    //Vide la liste
    listeActeurs.innerHTML = '';    
    dataTables.films_acteurs.forEach(element => {
        if(element.film_id == id){
            dataTables.acteurs.forEach(acteur => {
                if(element.acteur_id == acteur.acteur_id){
                    let li = createNode('li');
                    let a = createNode('a');
                    a.href = `detailActeur.html?id=${acteur.acteur_id}`;
                    a.className = 'titreFilm';
                    a.innerText = `${acteur.prenom} ${acteur.nom}`;
                    append(li, a);
                    append(listeActeurs, li);
                }
            });
        }
    });
}

function remplirDetails(id){
    dataTables.films.forEach(element =>{
        if(element.film_id == id){
            document.getElementById('titre').innerText = element.titre;
            document.getElementById('genre').innerText = `Genre: ${element.genres}`;
            dataTables.maisons_edition.forEach(maison =>{
                if(element.maison_edition_id == maison.maison_edition_id){
                    document.getElementById('maison_edition').innerText = `Maison d'édition: ${maison.nom}`;
                }
            });
            
        }

    });
}

function ajouterCommentaire(filmId) {
    // Valeurs du form
    const commentText = document.getElementById('commentText').value;
    const commentScore = document.getElementById('commentScore').value;

    // je crée un nouveau objet commentaire
    const newComment = {
        film_id: filmId,
        description: commentText,
        score: parseInt(commentScore)
    };

    // je rajoute ce commentaire à notre base de données
    dataTables.commentaires.push(newComment);

    // Je reset le form
    document.getElementById('commentForm').reset();

    // je réaffecte les commentaires et la moyenne
    remplirCommentaires(filmId);
    moyenneCommentaires(filmId);
}