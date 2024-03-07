<%@ page import="java.util.List" %>
<%@ page import="views.InfoPokemon" %>
<%@ page import="entities.Type" %>
<%@ page import="entities.Generation" %>
<%
    InfoPokemon infoPokemon = ( InfoPokemon ) request.getAttribute( "infoPokemon" );
    List<Type> types = ( List<Type> ) request.getAttribute( "types" );
    List<Generation> generations = ( List<Generation> ) request.getAttribute( "generations" );

    String upMsg = "", upMsgClass = "";
    if ( request.getParameter( "upMsg" ) != null ) {
        upMsg = request.getParameter( "upMsg" );
        upMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter( "upCode" ) != null ) {
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
<section id="up-pokemon">
    <br>
    <br>
    <br>

    <div class="card">

        <div class="card-body">
            <div id="infoPokemon">
                <script>
                    const header = ['Id', 'Nom Pokemon', 'Type', 'Generation'];
                    const data = [
                        {
                            idPokemon: <%= infoPokemon.getIdPokemon() %>,
                            NomPokemon: '<%= infoPokemon.getNomPokemon() %>',
                            NomType: '<%= infoPokemon.getNomType() %>',
                            NomGeneration: '<%= infoPokemon.getNomGeneration() %>',
                        }
                    ];
                    const table = generateTableTopContainer("Pokedex", header, data, "infoPokemon");
                    document.getElementById("infoPokemon").appendChild(table);
                </script>
            </div>
        </div>

        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="infoPokemonUp?idPokemon=<%= infoPokemon.getIdPokemon() %>">
                            <div class="row">
                                <h3 class="form-label">Update Pokemon</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="nomPokemon" class="form-label">Nom Pokemon</label>
                                                <input type="text" class="form-control" id="nomPokemon"
                                                       name="nomPokemon"
                                                       required value="<%= infoPokemon.getNomPokemon() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="pokedex" class="form-label">Description</label>
                                                <input type="text" class="form-control" id="pokedex" name="pokedex"
                                                       required value="<%= infoPokemon.getPokedex() %>">
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
                                                    <option value="<%= type.getIdType() %>" <%
                                                        if ( type.getIdType() == infoPokemon.getIdType() ) {
                                                            out.print( "selected" );
                                                        }
                                                    %> ><%= type.getNomType() %>
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
                                                    <option value="<%= generation.getIdGeneration() %>" <%
                                                        if ( generation.getIdGeneration() == infoPokemon.getIdGeneration() ) {
                                                            out.print( "selected" );
                                                        }
                                                    %> ><%= generation.getNomGeneration() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-success">Update Pokemon</button>
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