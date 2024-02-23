<%@ page import="views.InfoPokemon" %>
<%
    InfoPokemon infoPokemon = ( InfoPokemon ) request.getAttribute( "infoPokemon" );
%>
<section id="info-pokemon-user">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title fw-semibold mb-4">Info Pokemon</h5>
                    <div class="row">

                        <div class="col-lg-7 col-md-8 d-flex align-items-stretch">
                            <div class="card w-100">
                                <div class="card-body p-4">

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
                                            const table = generateTableMidContainer("Pokedex", header, data, "infoPokemon");
                                            document.getElementById("infoPokemon").appendChild(table);
                                        </script>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Pokedex</h5>
                                    <p class="card-text"><%= infoPokemon.getPokedex() %>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>