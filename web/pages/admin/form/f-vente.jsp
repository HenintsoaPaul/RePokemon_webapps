<%@ page import="java.util.List" %>
<%@ page import="entities.Vente" %>
<%@ page import="entities.Carte" %>
<%@ page import="entities.supp.User" %>
<%
    List<Carte> cartes = ( List<Carte> ) request.getAttribute( "cartes" );
    List<User> users = ( List<User> ) request.getAttribute( "users" );

    Vente vente = null;
    vente = ( Vente ) request.getAttribute( "vente" );
    String action = "ventesUp?action=1";
    if ( vente != null ) {
        action = "ventesUp?action=2&idVente=" + vente.getIdVente();
    }

    String notification = "", notificationClass = "";
    if ( request.getParameter( "notification" ) != null ) {
        notification = request.getParameter( "notification" );
        notificationClass = "alert alert-danger";
    }
    else if ( request.getParameter( "notificationCode" ) != null ) {
        int notificationCode = Integer.parseInt( request.getParameter( "notificationCode" ) );
        switch ( notificationCode ) {
            case 1:
                notification = "Success!";
                notificationClass = "alert alert-success";
                break;
            case 0:
                notification = "Oops! Something wrong happened.";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<br>
<br>
<br>
<br>
<br>
<div class="card">
    <div class="card-body">
        <section id="form-vente">
            <div class="col-lg-10">
                <div class="card-body">
                    <div class="card">
                        <div class="card-body">
                            <form method="POST" action="<%= action %>">
                                <div class="row">
                                    <h3 class="form-label">Informations about the Vente</h3>
                                    <div class="col-lg-7 col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <label for="montantVente" class="form-label">Montant Vente (en Ariary)</label>
                                                    <input type="number" step="any" class="form-control"
                                                           id="montantVente" name="montantVente" value="<%
                                                                if ( vente != null ) out.print( vente.getMontantVente() );
                                                            %>"
                                                           required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="dateVente" class="form-label">Date Vente</label>
                                                    <input type="date" class="form-control" id="dateVente"
                                                           name="dateVente" value="<%
                                                                if ( vente != null ) out.print( vente.getDateVente() );
                                                            %>"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-5 col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <label for="idCarte" class="form-label">Id Carte</label>
                                                    <select class="form-select" id="idCarte" name="idCarte"
                                                            required>
                                                        <option value="">Select a Carte</option>
                                                        <% for ( Carte carte : cartes ) { %>
                                                        <option value="<%= carte.getIdCarte() %>" <%
                                                            if ( vente != null ) {
                                                                if ( vente.getIdCarte() == carte.getIdCarte() )
                                                                    out.print( "selected" );
                                                            }
                                                        %> ><%= carte.getIdCarte() %>
                                                        </option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="idUser_acheteur" class="form-label">Acheteur</label>
                                                    <select class="form-select" id="idUser_acheteur" name="idUser_acheteur"
                                                            required>
                                                        <option value="">Select the Acheteur</option>
                                                        <% for ( User user : users ) { %>
                                                        <option value="<%= user.getIdUser() %>" <%
                                                            if ( vente != null ) {
                                                                if ( vente.getIdUser_acheteur() == user.getIdUser() )
                                                                    out.print( "selected" );
                                                            }
                                                        %> ><%= user.getNomUser() %>
                                                        </option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="idUser_vendeur" class="form-label">Vendeur</label>
                                                    <select class="form-select" id="idUser_vendeur" name="idUser_vendeur"
                                                            required>
                                                        <option value="">Select the Vendeur</option>
                                                        <% for ( User user : users ) { %>
                                                        <option value="<%= user.getIdUser() %>" <%
                                                            if ( vente != null ) {
                                                                if ( vente.getIdUser_vendeur() == user.getIdUser() )
                                                                    out.print( "selected" );
                                                            }
                                                        %> ><%= user.getNomUser() %>
                                                        </option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                                <br>
                                <div class="<%= notificationClass %>" role="alert">
                                    <%= notification %>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
    const selectCarte = document.getElementById("idCarte");
    const selectVendeur = document.getElementById("idUser_vendeur");

    function setIdUser_vendeur(idUser_vendeur) {
        for (let i = 0; i < selectVendeur.options.length; i++) {
            if (selectVendeur.options[i].value == idUser_vendeur) {
                selectVendeur.selectedIndex = i;
                break;
            }
        }
    }

    selectCarte.addEventListener('change', function() {
        const idCarte = +selectCarte.value;
        if (idCarte > 0) {
            fetch('/RePokemon/cartes?action=3&id=' + idCarte)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    const idUser_vendeur = data['idUser'];
                    setIdUser_vendeur(idUser_vendeur);
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            }
        })
</script>