<%@ page import="java.util.List" %>
<%@ page import="entities.ModelCarte" %>
<%@ page import="entities.Pokemon" %>
<%@ page import="entities.Rang" %>
<%@ page import="entities.Serie" %>
<%
    List<Pokemon> pokemons = ( List<Pokemon> ) request.getAttribute( "pokemons" );
    List<Rang> rangs = ( List<Rang> ) request.getAttribute( "rangs" );
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );

    ModelCarte model = null;
    model = ( ModelCarte ) request.getAttribute( "model" );
    String action = "modelsUp?action=1";
    if ( model != null ) {
        action = "modelsUp?action=2&idModel=" + model.getIdModelCarte();
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
                notification = "Oops! Something wrong happened..";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="form-model">
    <div class="col-lg-10">
        <div class="card-body">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="<%= action %>">
                        <div class="row">
                            <h3 class="form-label">Informations about the Model</h3>

                            <div class="col-lg-7 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="nomModel" class="form-label">Nom Model</label>
                                            <input type="text" class="form-control" id="nomModel" name="nomModel"
                                                   value="<%
                                                   if ( model != null ) out.print( model.getNomModel() );
                                                   %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="prixMarche" class="form-label">Prix Marche</label>
                                            <input type="number" step="any" class="form-control" id="prixMarche"
                                                   name="prixMarche" value="<%
                                                   if ( model != null ) out.print( model.getPrixMarche() );
                                                   %>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="dateSortieModel" class="form-label">Date de sortie Model</label>
                                            <input type="date" class="form-control" id="dateSortieModel"
                                                   name="dateSortieModel" value="<%
                                                   if ( model != null ) out.print( model.getDateSortieModel() );
                                                   %>" required>
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
                                                <option value="<%= pokemon.getIdPokemon() %>" <%
                                                    if ( model != null ) {
                                                        if ( model.getIdPokemon() == pokemon.getIdPokemon() )
                                                            out.print( "selected" );
                                                    }
                                                %> ><%= pokemon.getNomPokemon() %>
                                                </option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="idRang" class="form-label">Rang</label>
                                            <select class="form-select" id="idRang" name="idRang" required>
                                                <option value="">Select a Rang</option>
                                                <% for ( Rang rang : rangs ) { %>
                                                <option value="<%= rang.getIdRang() %>" <%
                                                    if ( model != null ) {
                                                        if ( model.getIdRang() == rang.getIdRang() )
                                                            out.print( "selected" );
                                                    }
                                                %> ><%= rang.getNomRang() %>
                                                </option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="idSerie" class="form-label">Serie</label>
                                            <select class="form-select" id="idSerie" name="idSerie" required>
                                                <option value="">Select a Serie</option>
                                                <% for ( Serie serie : series ) { %>
                                                <option value="<%= serie.getIdSerie() %>" <%
                                                    if ( model != null ) {
                                                        if ( model.getIdSerie() == serie.getIdSerie() )
                                                            out.print( "selected" );
                                                    }
                                                %> ><%= serie.getNomSerie() %>
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