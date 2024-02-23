function generateTable(headers, data) {
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
    data.forEach(item => {
        const row = document.createElement('tr');

        // Ajouter les données de chaque colonne
        row.innerHTML = `
            <td class="border-bottom-0"><h6 class="fw-semibold mb-0">${item.idCarte}</h6></td>
            <td class="border-bottom-0"><a href="infoModel?action=1&idModelCarte=${item.idModelCarte}"><h6 class="fw-semibold mb-0">${item.nomModelCarte}</h6></a></td>
            <td class="border-bottom-0"><span class="fw-semibold mb-0 fs-4"><mark>${item.prixProprio}</mark></span><span class="mb-0 fw-normal">Ariary MG</span></td>
            <td class="border-bottom-0"><span class="fw-semibold mb-0 fs-4"><mark>${item.prixMarche}</mark></span><span class="mb-0 fw-normal">Ariary MG</span></td>
            <td class="border-bottom-0"><p class="mb-0 fw-bolder">${item.dateFabrication}</p></td>
        `;

        // Ajouter la ligne à tbody
        tbody.appendChild(row);
    });

    // Ajouter tbody à la table
    table.appendChild(tbody);

    return table;
}

function generateTableMidContainer(headers, data) {
    const midContainer = document.createElement("div");
    midContainer.setAttribute("id", "midContainer");

    const h5 = document.createElement("h5");
    h5.className = "card-title fw-semibold mb-4";
    const txt = document.createTextNode("Ma Carte");
    h5.appendChild(txt);

    const tabContainer = document.createElement("div");
    tabContainer.className = "table-responsive";
    tabContainer.setAttribute("id", "tab-container");

    const tab = generateTable(headers, data);
    tabContainer.appendChild(tab);

    midContainer.appendChild(h5);
    midContainer.appendChild(tabContainer);
    return midContainer;
}

function generateTableTopContainer(headers, data) {
    const mainDiv = document.createElement("div");
    mainDiv.className = "row";

    const secDiv = document.createElement("div");
    secDiv.className = "col-lg-10 d-flex align-items-stretch";

    const card = document.createElement("div");
    card.className = "card w-100";

    const cardBody = document.createElement("div");
    cardBody.className = "card-body p-4";

    const midContainer = generateTableMidContainer(headers, data);
    cardBody.appendChild(midContainer);

    card.appendChild(cardBody);
    secDiv.appendChild(card);
    mainDiv.appendChild(secDiv);
    return mainDiv;
}