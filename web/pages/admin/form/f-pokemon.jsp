<%@ page import="java.util.List" %>
<%@ page import="entities.supp.Type" %>
<%@ page import="entities.supp.Generation" %>
<%
    List<Type> types = ( List<Type> ) request.getAttribute( "types" );
    List<Generation> generations = ( List<Generation> ) request.getAttribute( "generations" );

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
                notification = "Oops! Something wrong happened during Add Operation.";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="form-pokemon">
    <div class="col-lg-10">
        <div class="card-body">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="pokemons">
                        <div class="row">
                            <h3 class="form-label">Add new Pokemon</h3>
                            <div class="col-lg-7 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="nomPokemon" class="form-label">Nom Pokemon</label>
                                            <input type="text" class="form-control" id="nomPokemon" name="nomPokemon"
                                                   required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="pokedex" class="form-label">Description</label>
                                            <input type="text" class="form-control" id="pokedex" name="pokedex"
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