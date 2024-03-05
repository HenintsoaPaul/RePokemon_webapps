function generateTable(headers, data, dataType) {
    const table = document.createElement('table');
    table.className = "table text-nowrap mb-0 align-middle";
    table.setAttribute("role", "table");

    // Créer l'élément thead
    const thead = document.createElement('thead');
    thead.className = "text-dark fs-4";

    // Créer la ligne d'en-tête
    const headerRow = document.createElement('tr');

    // Ajouter les en-têtes
    headers.forEach(header => {
        const th = document.createElement('th');
        th.className = "border-bottom-0";
        const h6 = document.createElement('h6');
        h6.className = "fw-semibold mb-0";
        h6.textContent = header;
        th.appendChild(h6);
        headerRow.appendChild(th);
    });

    // Ajouter la ligne d'en-tête à thead
    thead.appendChild(headerRow);

    // Ajouter thead à la table
    table.appendChild(thead);

    // Créer l'élément tbody
    const tbody = document.createElement('tbody');

    // Ajouter les données
    switch (dataType) {
        case "estimation" :
            generateRowsEstimation(tbody, data);
            break;
        case "listInfoCarte" :
            rowsListCarte(tbody, data);
            break;
        case "listInfoVente" :
            rowsListVente(tbody, data);
            break;
        case "listSerie" :
            rowsListSerie(tbody, data);
            break;
        case "infoVente" :
            generateRowsInfoTransaction(tbody, data);
            break;
        case "listVente" :
            generateRowsListTransactions(tbody, data);
            break;
        case "searchMine" :
            generateRowsSearchMine(tbody, data);
            break;
        case "searchOthers" :
            generateRowsSearchOthers(tbody, data);
            break;
        case "infoModel" :
            generateRowsInfoModel(tbody, data);
            break;
        case "listInfoModel" :
            generateRowsListInfoModel(tbody, data);
            break;
        case "infoType" :
            generateRowsInfoType(tbody, data);
            break;
        case "listInfoType" :
            generateRowsListInfoType(tbody, data);
            break;
        case "generation" :
            generateRowsGeneration(tbody, data);
            break;
        case "listGeneration" :
            generateRowsListGeneration(tbody, data);
            break;
        case "infoPokemon" :
            generateRowsInfoPokemon(tbody, data);
            break;
        case "listInfoPokemon" :
            generateRowsListInfoPokemon(tbody, data);
            break;
        case "infoSerie" :
            generateRowsInfoSerie(tbody, data);
            break;
    }

    // Ajouter tbody à la table
    table.appendChild(tbody);

    return table;
}


// ROWS
function generateRowsEstimation(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
                </td>
            <td class="border-bottom-0">
                <a href="infoModel?action=2&idModelCarte=${item.idModelCarte}"><h6 class="fw-semibold mb-0">${item.nomModelCarte}</h6></a>
                </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.prixProprio}</mark></span><span class="mb-0 fw-normal">Ariary MG</span>
                </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.prixMarche}</mark></span><span class="mb-0 fw-normal">Ariary MG</span>
                </td>
            <td class="border-bottom-0">
                <p class="mb-0 fw-bolder">${item.dateFabrication}</p>
                </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function rowsListCarte(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.NomModelCarte}</p>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.PrixProprio}</mark></span>
                <span class="mb-0 fw-normal"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.PrixMarche}</mark></span>
                <span class="mb-0 fw-normal"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateFabrication}</p>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateSortieModel}</p>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomUser}</h6>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <a href="cartesUp?action=1&idCarte=${item.idCarte}">
                        <span class="badge bg-success rounded-3 fw-semibold">Modifier</span>
                    </a>
                    <a href="cartesUp?action=2&idCarte=${item.idCarte}">
                        <span class="badge bg-danger rounded-3 fw-semibold">Supprimer</span>
                    </a>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function rowsListSerie(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idSerie}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.NomSerie}</p>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.NbEpisode}</mark></span>
                <span class="mb-0 fw-normal"> episodes</span>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateDebutSerie}</p>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateFinSerie}</p>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <a href="seriesUp?action=1&idSerie=${item.idSerie}">
                        <span class="badge bg-success rounded-3 fw-semibold">Modifier</span>
                    </a>
                    <a href="seriesUp?action=2&idSerie=${item.idSerie}">
                        <span class="badge bg-danger rounded-3 fw-semibold">Supprimer</span>
                    </a>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function rowsListVente(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idVente}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateVente}</p>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.MontantVente}</mark></span>
                <span class="mb-0 fw-normal"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomAcheteur}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomVendeur}</h6>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <a href="cartesUp?action=1&idCarte=${item.idCarte}">
                        <span class="badge bg-success rounded-3 fw-semibold">Modifier</span>
                    </a>
                    <a href="cartesUp?action=2&idCarte=${item.idCarte}">
                        <span class="badge bg-danger rounded-3 fw-semibold">Supprimer</span>
                    </a>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsInfoTransaction(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idVente}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateVente}</p>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.MontantVente}</mark></span>
                <span class="mb-0 fw-normal"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomAcheteur}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomVendeur}</h6>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsListTransactions(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idVente}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-semibold mb-0">${item.DateVente}</p>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.MontantVente}</mark></span>
                <span class="mb-0 fw-normal"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomAcheteur}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomVendeur}</h6>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <a href="vente?action=3&idVente=${item.idVente}">
                        <span class="badge bg-success rounded-3 fw-semibold">Modifier</span>
                    </a>
                    <a href="vente?action=4&idVente=${item.idVente}">
                        <span class="badge bg-danger rounded-3 fw-semibold">Supprimer</span>
                    </a>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsSearchMine(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="infoModel?action=1&idModelCarte=${item.idModelCarte}">
                    <h6 class="fw-semibold mb-0">${item.NomModelCarte}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="mb-0 fs-4 fw-semibold">
                    <mark>${item.PrixProprio}</mark>
                </span>
                <span class="fw-normal mb-0"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <span class="mb-0 fs-4 fw-semibold">
                    <mark>${item.PrixMarche}</mark>
                </span>
                <span class="fw-normal mb-0"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateFabrication}</p>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateSortieModel}</p>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <a href="mesCartes?action=3&idCarte=${item.idCarte}">
                        <span class="badge bg-success rounded-3 fw-semibold">Estimer</span>
                    </a>
                    <a href="mesCartes?action=2&idCarte=${item.idCarte}">
                        <span class="badge bg-danger rounded-3 fw-semibold">Jetter</span>
                    </a>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsSearchOthers(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="infoModel?action=1&idModelCarte=${item.idModelCarte}">
                    <h6 class="fw-semibold mb-0">${item.NomModelCarte}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="mb-0 fs-4 fw-semibold">
                    <mark>${item.PrixProprio}</mark>
                </span>
                <span class="fw-normal mb-0"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <span class="mb-0 fs-4 fw-semibold">
                    <mark>${item.PrixMarche}</mark>
                </span>
                <span class="fw-normal mb-0"> Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateFabrication}</p>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateSortieModel}</p>
            </td>
            <td class="border-bottom-0">
                <div class="d-flex align-items-center gap-2">
                    <span class="fw-semibold">
                        <mark>${item.NomUser}</mark>
                    </span>
                </div>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsInfoModel(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idModelCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomModelCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="infoPokemonAdd?action=2&idPokemon=${item.idPokemon}">
                    <h6 class="fw-semibold mb-0">${item.NomPokemon}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="badge bg-danger rounded-3 fw-semibold">
                    <h6 class="fw-semibold mb-0">${item.NomRang}</h6>
                </span>
            </td>
            <td class="border-bottom-0">
                <a href="infoSerie?idSerie=${item.idSerie}">
                    <h6 class="fw-semibold mb-0">${item.NomSerie}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.prixMarche}</mark></span>
                <span class="mb-0 fw-normal">Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-bolder mb-0">${item.dateSortieModel}</h6>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsListInfoModel(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idModelCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomModelCarte}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="infoPokemonUp?idPokemon=${item.idPokemon}">
                    <h6 class="fw-semibold mb-0">${item.NomPokemon}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="badge bg-danger rounded-3 fw-semibold">
                    <h6 class="fw-semibold mb-0">${item.NomRang}</h6>
                </span>
            </td>
            <td class="border-bottom-0">
                <a href="infoSerie?idSerie=${item.idSerie}">
                    <h6 class="fw-semibold mb-0">${item.NomSerie}</h6>
                </a>
            </td>
            <td class="border-bottom-0">
                <span class="fw-semibold mb-0 fs-4"><mark>${item.prixMarche}</mark></span>
                <span class="mb-0 fw-normal">Ariary MG</span>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-bolder mb-0">${item.dateSortieModel}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="modelsUp?action=1&idModelCarte=${item.idModelCarte}">
                    <span class="badge bg-secondary rounded-3 fw-semibold">Modifier</span>
                </a>
                <a href="modelsUp?action=2&idModelCarte=${item.idModelCarte}">
                    <span class="badge bg-danger rounded-3 fw-semibold">Supprimer</span>
                </a>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsInfoPokemon(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idPokemon}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomPokemon}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0"><mark>${item.NomType}</mark></h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.NomGeneration}</p>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsListInfoPokemon(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idPokemon}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomPokemon}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0"><mark>${item.NomType}</mark></h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.NomGeneration}</p>
            </td>
            <td class="border-bottom-0">
                <a href="infoPokemonUp?idPokemon=${item.idPokemon}">
                    <span class="badge bg-primary rounded-3 fw-semibold">Modifier</span>
                </a>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsInfoSerie(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idSerie}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.NomSerie}</h6>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateDebut}</p>
            </td>
            <td class="border-bottom-0">
                <p class="fw-bolder mb-0">${item.DateFin}</p>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsInfoType(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idType}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-normal mb-0">${item.NomType}</h6>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsListInfoType(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idType}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-normal mb-0">${item.NomType}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="typesUp?idType=${item.idType}">
                    <span class="badge bg-primary rounded-3 fw-semibold">Modifier</span>
                </a>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsGeneration(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idGeneration}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-normal mb-0">${item.NomGeneration}</h6>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}

function generateRowsListGeneration(tbody, data) {
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0">
                <h6 class="fw-semibold mb-0">${item.idGeneration}</h6>
            </td>
            <td class="border-bottom-0">
                <h6 class="fw-normal mb-0">${item.NomGeneration}</h6>
            </td>
            <td class="border-bottom-0">
                <a href="generationsUp?idGeneration=${item.idGeneration}">
                    <span class="badge bg-primary rounded-3 fw-semibold">Modifier</span>
                </a>
            </td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });
}


// TAB CONTAINERS
function generateTableMidContainer(title, headers, data, dataType) {
    const midContainer = document.createElement("div");
    midContainer.setAttribute("id", "midContainer");

    const h5 = document.createElement("h5");
    h5.className = "card-title fw-semibold mb-4";
    h5.appendChild(document.createTextNode(title));

    const tabContainer = document.createElement("div");
    tabContainer.className = "table-responsive";
    tabContainer.setAttribute("id", "tab-container");

    const tab = generateTable(headers, data, dataType);
    tabContainer.appendChild(tab);

    midContainer.appendChild(h5);
    midContainer.appendChild(tabContainer);
    return midContainer;
}

function generateTableTopContainer(title, headers, data, dataType) {
    const mainDiv = document.createElement("div");
    mainDiv.className = "row";

    const secDiv = document.createElement("div");
    secDiv.className = "col-lg-12 d-flex align-items-stretch";

    const card = document.createElement("div");
    card.className = "card w-100";

    const cardBody = document.createElement("div");
    cardBody.className = "card-body p-4";

    const midContainer = generateTableMidContainer(title, headers, data, dataType);
    cardBody.appendChild(midContainer);

    card.appendChild(cardBody);
    secDiv.appendChild(card);
    mainDiv.appendChild(secDiv);
    return mainDiv;
}