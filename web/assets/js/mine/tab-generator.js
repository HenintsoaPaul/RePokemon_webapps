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
        case "infoModel" :
            generateRowsInfoModel(tbody, data);
            break;
        case "estimation" :
            generateRowsEstimation(tbody, data);
            break;
        case "infoPokemon" :
            generateRowsInfoPokemon(tbody, data);
            break;
        case "infoSerie" :
            generateRowsInfoSerie(tbody, data);
            break;
        case "listInfoModel" :
            generateRowsListInfoModel(tbody, data);
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
                <a href="infoPokemon?idPokemon=${item.idPokemon}">
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
                <a href="infoPokemon?idPokemon=${item.idPokemon}">
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
                <a href="infoModel?action=3&idModel=${item.idModelCarte}">
                    <span class="badge bg-secondary rounded-3 fw-semibold">Modifier</span>
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