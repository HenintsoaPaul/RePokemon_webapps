function getDateTransaction( ventes ) {
    let dateTransaction = [];
    ventes.forEach( vente => {
        if ( !dateTransaction.includes( vente.dateVente ) ) {
            dateTransaction.push( vente.dateVente );
        }
    } );
    return dateTransaction;
}

function updateChart( idChartTransaction, idBenefice, idChartBenef, idUser, ventes ) {
    const mesAchats = [];
    const mesVentes = [];
    const dateTransaction = getDateTransaction( ventes );

    dateTransaction.forEach( date => {
        let tempVente = [], tempAchat = [];
        for ( let i = 0; i < ventes.length; i++ ) {
            if ( ventes[i].idUser_vendeur === idUser && ventes[i].dateVente === date ) {
                tempVente.push( ventes[i].montantVente );
            } else if ( ventes[i].idUser_acheteur === idUser && ventes[i].dateVente === date ) {
                tempAchat.push( ventes[i].montantVente );
            }
        }

        mesVentes.push( tempVente.reduce( ( a, b ) => a + b, 0 ) );
        mesAchats.push( tempAchat.reduce( ( a, b ) => a + b, 0 ) );
    } );

    renderChartMesTransactions(
        idChartTransaction,
        xaxisData = [
            { name: "Somme Vente", data: mesVentes },
            { name: "Somme Achat", data: mesAchats },
        ],
        yaxisData = dateTransaction
    );

    setBenefice( idBenefice, idChartBenef, mesAchats, mesVentes );
}


