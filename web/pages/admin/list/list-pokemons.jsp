<%@ page import="java.util.List" %>
<%@ page import="views.InfoPokemon" %>
<%
    List<InfoPokemon> pokemons = ( List<InfoPokemon> ) request.getAttribute( "pokemons" );
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
        <%-- Form --%>
        <jsp:include page="../form/f-pokemon.jsp" />
        <%-- Form --%>
    </div>
</section>