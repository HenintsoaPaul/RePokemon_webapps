<%@ page import="java.util.List" %>
<%@ page import="entities.ModelCarte" %>
<%
    List<ModelCarte> models = ( List<ModelCarte> ) request.getAttribute( "models" );
%>

<div class="card">
    <div class="card-body">
        <section id="search-carte">
            <div class="card">
                <div class="card-body">

                    <form method="POST" action="cartes">
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">

                                        <%-- Begining div Model --%>
                                        <div class="mb-3">
                                            <h3 class="form-label">Models Cartes</h3>
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

                                        <%-- Begining div Prix Models --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Prix du Proprietaire (en Ariary MG)</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minPrixProprio" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="minPrixProprio" name="minPrixProprio"
                                                               placeholder="Minimum" value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxPrixProprio" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="maxPrixProprio" name="maxPrixProprio"
                                                               placeholder="Maximum" value="9999999999" required>
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
                            <div>
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </section>
    </div>
</div>
