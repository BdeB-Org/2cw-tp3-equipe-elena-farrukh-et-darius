function remplirListeFilms(nomListeARemplir) {
    let tableauDonnes = dataTables["films"];
    let liste = document.getElementById(nomListeARemplir);
    liste.innerHTML = '';

    tableauDonnes.forEach(element => {
        let li = createNode("li");
        let a = createNode("a");
        a.href = "detail.html?id=" + element.film_id;
        a.className = "titreFilm";
        a.innerText = element.titre;
        append(li, a);
        append(liste, li);
    });
}
