// Utility functions
function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

// Object to hold all the data arrays
let dataTables = {
    films: [],
    acteurs: [],
    maisons_edition: [],
    commentaires: [],
    films_acteurs: []
};

// Function to fetch data
function genererTables(callback) {
    var listeNomsTables = ["films", "acteurs", "maisons_edition", "commentaires", "films_acteurs"];
    let fetchCount = 0;

    listeNomsTables.forEach(function(table) {
        var url = "http://localhost:8080/ords/films/" + table;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(`Data from ${table}:`, data);
                dataTables[table] = data.items || [];
                fetchCount++;

                // When all tables are fetched, execute the callback
                if (fetchCount === listeNomsTables.length) {
                    if (callback) callback();
                }
            })
            .catch(error => {
                console.error(`Error fetching data from ${table}:`, error);
            });
    });
}
