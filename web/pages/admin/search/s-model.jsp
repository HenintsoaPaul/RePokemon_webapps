<%@ page import="java.util.List" %>
<%@ page import="entities.Serie" %>
<%@ page import="entities.supp.Pokemon" %>
<%@ page import="entities.supp.Rang" %>
<%
    List<Pokemon> pokemons = ( List<Pokemon> ) request.getAttribute( "pokemons" );
    List<Rang> rangs = ( List<Rang> ) request.getAttribute( "rangs" );
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );
%>
<br>
<br>
<br>
<section id="search-model">
    <div class="card">
        <div class="card-body">
            <%-- Begining Search Form --%>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="models">
                        <div class="row">
                            <h1 class="form-label">Look for a Model</h1>
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div prixMarche --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Prix sur le Marche (en Ariary MG)</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minPrixMarche" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="minPrixMarche" name="minPrixMarche"
                                                               value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxPrixMarche" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="maxPrixMarche" name="maxPrixMarche"
                                                               value="9999999999" required>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div prixMarche --%>

                                        <%-- Begining div dateSortieModel --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Date de Sortie Model entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minDateSortieModel" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="minDateSortieModel"
                                                               name="minDateSortieModel">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxDateSortieModel" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="maxDateSortieModel"
                                                               name="maxDateSortieModel">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div dateSortieModel --%>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div Pokemon --%>
                                        <div class="mb-3">
                                            <h4 class="form-label">Pokemons</h4>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( Pokemon pokemon : pokemons ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idPokemon"
                                                               value="<%= pokemon.getIdPokemon() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= pokemon.getNomPokemon() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                        <%-- Ending div Pokemon --%>
                                        <%-- Begining div Rang --%>
                                        <div class="mb-3">
                                            <h4 class="form-label">Rangs</h4>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( Rang rang : rangs ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idRang"
                                                               value="<%= rang.getIdRang() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= rang.getNomRang() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                        <%-- Ending div Rang --%>
                                        <%-- Begining div Rang --%>
                                        <div class="mb-3">
                                            <h4 class="form-label">Series</h4>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( Serie serie : series ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idSerie"
                                                               value="<%= serie.getIdSerie() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= serie.getNomSerie() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                        <%-- Ending div Rang --%>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%-- Ending Search Form --%>

            <%-- Begining Search Result --%>
            <jsp:include page="f-model.jsp"/>
            <%-- Ending Search Result --%>
        </div>
    </div>
</section>
