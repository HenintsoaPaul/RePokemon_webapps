<%@ page import="java.util.List" %>
<%@ page import="views.InfoModel" %>
<%@ page import="entities.Pokemon" %>
<%@ page import="entities.Rang" %>
<%@ page import="entities.Serie" %>
<%
    List<InfoModel> models = ( List<InfoModel> ) request.getAttribute( "models" );
    List<Pokemon> pokemons = ( List<Pokemon> ) request.getAttribute( "pokemons" );
    List<Rang> rangs = ( List<Rang> ) request.getAttribute( "rangs" );
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );

    String addMsg = "", addMsgClass = "";
    if ( request.getParameter( "addMsg" ) != null ) {
        addMsg = request.getParameter( "addMsg" );
        addMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter( "addCode" ) != null ) {
        int addCode = Integer.parseInt( request.getParameter( "addCode" ) );
        switch ( addCode ) {
            case 1:
                addMsg = "Success!";
                addMsgClass = "alert alert-success";
                break;
            case 0:
                addMsg = "Oops! Something wrong happened during Add Operation.";
                addMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="list-models">
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">
            <div id="list-info-models">
                <script>
                    const headers = ['Id', 'Model', 'Pokemon', 'Rang', 'Serie', 'Prix sur le Marche', 'Date Sortie du Model', 'Action'];
                    const data = [
                        <% for ( InfoModel model : models ) { %>
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
                        },
                        <% } %>
                    ];
                    const table = generateTableTopContainer("Liste des Models", headers, data, "listInfoModel");
                    document.getElementById("list-info-models").appendChild(table);
                </script>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="infoModelAdd">
                            <div class="row">
                                <h3 class="form-label">Add new Model</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="nomModel" class="form-label">Nom Model</label>
                                                <input type="text" class="form-control" id="nomModel" name="nomModel"
                                                       required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="prixMarche" class="form-label">Prix Marche</label>
                                                <input type="number" step="any" class="form-control" id="prixMarche"
                                                       name="prixMarche" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateSortieModel" class="form-label">Date de sortie Model</label>
                                                <input type="date" class="form-control" id="dateSortieModel"
                                                       name="dateSortieModel" required>
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
                                                    <% for ( Pokemon pokemon : pokemons ) { %>
                                                    <option value="<%= pokemon.getIdPokemon() %>"><%= pokemon.getNomPokemon() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="idRang" class="form-label">Rang</label>
                                                <select class="form-select" id="idRang" name="idRang" required>
                                                    <option value="">Select a Rang</option>
                                                    <% for ( Rang rang : rangs ) { %>
                                                    <option value="<%= rang.getIdRang() %>"><%= rang.getNomRang() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="idSerie" class="form-label">Serie</label>
                                                <select class="form-select" id="idSerie" name="idSerie" required>
                                                    <option value="">Select a Serie</option>
                                                    <% for ( Serie serie : series ) { %>
                                                    <option value="<%= serie.getIdSerie() %>"><%= serie.getNomSerie() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-success">Add Model</button>
                            </div>

                            <br>
                            <div class="<%= addMsgClass %>" role="alert">
                                <%= addMsg %>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>