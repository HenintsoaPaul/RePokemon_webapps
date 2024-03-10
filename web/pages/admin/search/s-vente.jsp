<%@ page import="java.util.List" %>
<%@ page import="entities.supp.User" %>
<%
    List<User> users = ( List<User> ) request.getAttribute( "users" );
%>
<br>
<br>
<br>
<section id="search-vente">
    <div class="card">
        <div class="card-body">
            <%-- Begining Search Form --%>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="ventes">
                        <div class="row">
                            <h1 class="form-label">Look for a Vente</h1>
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div montantVente --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Prix de Vente (en Ariary MG)</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minMontantVente" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="minMontantVente" name="minMontantVente"
                                                               value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxMontantVente" class="form-label">
                                                        <input type="number" step="any" class="form-control"
                                                               id="maxMontantVente" name="maxMontantVente"
                                                               value="9999999999" required>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div montantVente --%>
                                        <%-- Begining div dateVente --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Date de Vente entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minDateVente" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="minDateVente" name="minDateVente">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxDateVente" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="maxDateVente" name="maxDateVente">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div dateVente --%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <%-- Begining div Acheteur --%>
                                                <div class="mb-3">
                                                    <h4 class="form-label">Acheteur</h4>
                                                    <div class="form-selectgroup form-selectgroup-pills">
                                                        <% for ( User user : users ) { %>
                                                        <div>
                                                            <label class="form-selectgroup-item">
                                                                <input type="checkbox" name="idUser_acheteur"
                                                                       value="<%= user.getIdUser() %>"
                                                                       class="form-selectgroup-input">
                                                                <span class="form-selectgroup-label"><%= user.getNomUser() %></span>
                                                            </label>
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                </div>
                                                <%-- Ending div Acheteur --%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <%-- Begining div Vendeur --%>
                                                <div class="mb-3">
                                                    <h4 class="form-label">Vendeur</h4>
                                                    <div class="form-selectgroup form-selectgroup-pills">
                                                        <% for ( User user : users ) { %>
                                                        <div>
                                                            <label class="form-selectgroup-item">
                                                                <input type="checkbox" name="idUser_vendeur"
                                                                       value="<%= user.getIdUser() %>"
                                                                       class="form-selectgroup-input">
                                                                <span class="form-selectgroup-label"><%= user.getNomUser() %></span>
                                                            </label>
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                </div>
                                                <%-- Ending div Vendeur --%>
                                            </div>
                                        </div>
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
            <jsp:include page="f-vente.jsp"/>
            <%-- Ending Search Result --%>
        </div>
    </div>
</section>
