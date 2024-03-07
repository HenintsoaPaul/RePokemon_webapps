<%@ page import="java.util.List" %>
<%@ page import="entities.ModelCarte" %>
<%
    List<ModelCarte> models = ( List<ModelCarte> ) request.getAttribute( "models" );
%>
<br>
<br>
<br>
<section id="search-carte">
    <div class="card">
        <div class="card-body">
                <%-- Begining Search Form --%>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="cartes">
                        <div class="row">
                            <h1 class="form-label">Recherche de Carte</h1>
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div Prix Models --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Prix du Proprietaire (en Ariary MG)</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minPrixProprio" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="minPrixProprio" name="minPrixProprio"
                                                               value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxPrixProprio" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="maxPrixProprio" name="maxPrixProprio"
                                                               value="9999999999" required>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div Prix Models --%>

                                        <%-- Begining div Date Fabrication --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Date de Fabrication entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minDateFabrication" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="minDateFabrication"
                                                               name="minDateFabrication">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxDateFabrication" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="maxDateFabrication"
                                                               name="maxDateFabrication">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div Date Fabrication --%>

                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div Model --%>
                                        <div class="mb-3">
                                            <h4 class="form-label">Models Cartes</h4>
                                            <div class="form-selectgroup form-selectgroup-pills">
                                                <% for ( ModelCarte model : models ) { %>
                                                <div>
                                                    <label class="form-selectgroup-item">
                                                        <input type="checkbox" name="idModelCarte"
                                                               value="<%= model.getIdModelCarte() %>"
                                                               class="form-selectgroup-input">
                                                        <span class="form-selectgroup-label"><%= model.getNomModel() %></span>
                                                    </label>
                                                </div>
                                                <% } %>
                                            </div>
                                        </div>
                                        <%-- Ending div Model --%>
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
            <jsp:include page="f-carte.jsp"/>
                <%-- Ending Search Result --%>
        </div>
    </div>
</section>
