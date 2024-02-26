<%@ page import="java.util.List" %>
<%@ page import="views.InfoPokemon" %>
<%@ page import="entities.Type" %>
<%@ page import="entities.Generation" %>
<%
    List<InfoPokemon> pokemons = ( List<InfoPokemon> ) request.getAttribute( "pokemons" );
    List<Type> types = ( List<Type> ) request.getAttribute( "types" );
    List<Generation> generations = ( List<Generation> ) request.getAttribute( "generations" );

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
<section id="list-pokemons">
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">
            <div id="list-info-pokemons">
                <script>
                    const header = ['Id', 'Nom Pokemon', 'Type', 'Generation', 'Action'];
                    const data = [
                        <% for ( InfoPokemon pokemon : pokemons ) { %>
                        {
                            idPokemon: <%= pokemon.getIdPokemon() %>,
                            NomPokemon: '<%= pokemon.getNomPokemon() %>',
                            NomType: '<%= pokemon.getNomType() %>',
                            NomGeneration: '<%= pokemon.getNomGeneration() %>',
                        },
                        <% } %>
                    ];
                    const table = generateTableTopContainer("Grand Pokedex", header, data, "listInfoPokemon");
                    document.getElementById("list-info-pokemons").appendChild(table);
                </script>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="infoPokemon?action=1">
                            <div class="row">
                                <h3 class="form-label">Add new Pokemon</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="nomModel" class="form-label">Nom Pokemon</label>
                                                <input type="text" class="form-control" id="nomModel" name="nomModel"
                                                       required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="pokedex" class="form-label">Description</label>
                                                <input type="text" class="form-control" id="pokedex" name="nomModel"
                                                       required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-12">
                                    <div class="card">
                                        <div class="card-body">

                                            <div class="mb-3">
                                                <label for="idType" class="form-label">Type</label>
                                                <select class="form-select" id="idType" name="idType" required>
                                                    <option value="">Select a Type</option>
                                                    <% for ( Type type : types ) { %>
                                                    <option value="<%= type.getIdType() %>"><%= type.getNomType() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="idGeneration" class="form-label">Generation</label>
                                                <select class="form-select" id="idGeneration" name="idGeneration"
                                                        required>
                                                    <option value="">Select a Generation</option>
                                                    <% for ( Generation generation : generations ) { %>
                                                    <option value="<%= generation.getIdGeneration() %>"><%= generation.getNomGeneration() %>
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