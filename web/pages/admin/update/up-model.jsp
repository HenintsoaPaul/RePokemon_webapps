<%@ page import="java.util.List" %>
<%@ page import="views.InfoModel" %>
<%@ page import="entities.Pokemon" %>
<%@ page import="entities.Rang" %>
<%@ page import="entities.Serie" %>
<%
    InfoModel model = ( InfoModel ) request.getAttribute( "model" );
    List<Pokemon> pokemons = ( List<Pokemon> ) request.getAttribute( "pokemons" );
    List<Rang> rangs = ( List<Rang> ) request.getAttribute( "rangs" );
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );

    String upMsg = "", upMsgClass = "";
    if ( request.getParameter( "upMsg" ) != null ) {
        upMsg = request.getParameter( "upMsg" );
        upMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter("upCode") != null ) {
        int upCode = Integer.parseInt( request.getParameter( "upCode" ) );
        switch ( upCode ) {
            case 1:
                upMsg = "Success!";
                upMsgClass = "alert alert-success";
                break;
            case 0:
                upMsg = "Oops! Something wrong happened during Update Operation.";
                upMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="up-model">
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">
            <div id="infoModel">
                <script>
                    const headers = ['Id', 'Model', 'Pokemon', 'Rang', 'Serie', 'Prix sur le Marche', 'Date Sortie du Model'];
                    const data = [
                        {
                            idModelCarte: <%= model.getIdModelCarte() %>,
                            NomModelCarte: '<%= model.getNomModel() %>',
                            idPokemon: <%= model.getIdPokemon() %>,
                            NomPokemon: '<%= model.getNomPokemon() %>',
                            NomRang: '<%= model.getNomRang() %>',
                            idSerie: <%= model.getIdSerie() %>,
                            NomSerie: '<%= model.getNomSerie() %>',
                            prixMarche: <%= model.getPrixMarche() %>,
                            dateSortieModel: '<%= model.getDateSortieModel() %>'
                        }
                    ];
                    const table = generateTableTopContainer("Informations Model", headers, data, "infoModel");
                    document.getElementById("infoModel").appendChild(table);
                </script>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="infoModel?action=2&idModel=<%= model.getIdModelCarte() %>">
                            <div class="row">
                                <h3 class="form-label">Update Model</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="nomModel" class="form-label">Nom Model</label>
                                                <input type="text" class="form-control" id="nomModel" name="nomModel"
                                                       value="<%= model.getNomModel() %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="prixMarche" class="form-label">Prix Marche</label>
                                                <input type="number" step="any" class="form-control" id="prixMarche"
                                                       name="prixMarche" value="<%= model.getPrixMarche() %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateSortieModel" class="form-label">Date de sortie
                                                    Model</label>
                                                <input type="date" class="form-control" id="dateSortieModel"
                                                       name="dateSortieModel" value="<%= model.getDateSortieModel() %>"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-12">
                                    <div class="card">
                                        <div class="card-body">

                                            <div class="mb-3">
                                                <label for="idPokemon" class="form-label">Pokemon</label>
                                                <select class="form-select" id="idPokemon" name="idPokemon" required>
                                                    <option value="">Select a Pokemon</option>
                                                    <% for ( Pokemon pokemon : pokemons ) {
                                                        int idPokemon = pokemon.getIdPokemon(); %>
                                                    <option value="<%= idPokemon %>" <%
                                                        if ( idPokemon == model.getIdPokemon() ) {
                                                            out.print( "selected" );
                                                        } %> ><%= pokemon.getNomPokemon() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="idRang" class="form-label">Rang</label>
                                                <select class="form-select" id="idRang" name="idRang" required>
                                                    <option value="">Select a Rang</option>
                                                    <% for ( Rang rang : rangs ) {
                                                        int idRang = rang.getIdRang(); %>
                                                    <option value="<%= idRang %>" <%
                                                        if ( idRang == model.getIdRang() ) {
                                                            out.print( "selected" );
                                                        } %> ><%= rang.getNomRang() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="idSerie" class="form-label">Serie</label>
                                                <select class="form-select" id="idSerie" name="idSerie" required>
                                                    <option value="">Select a Serie</option>
                                                    <% for ( Serie serie : series ) {
                                                        int idSerie = serie.getIdSerie(); %>
                                                    <option value="<%= idSerie %>" <%
                                                        if ( idSerie == model.getIdSerie() ) {
                                                            out.print( "selected" );
                                                        } %> ><%= serie.getNomSerie() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-success">Update</button>
                            </div>

                            <br>
                            <div class="<%= upMsgClass %>" role="alert">
                                <%= upMsg %>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>