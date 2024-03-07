<%@ page import="java.util.List" %>
<%@ page import="entities.Serie" %>
<%
    List<Serie> series = ( List<Serie> ) request.getAttribute( "series" );
%>
<br>
<br>
<br>
<section id="search-serie">
    <div class="card">
        <div class="card-body">
            <%-- Begining Search Form --%>
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="series">
                        <div class="row">
                            <h1 class="form-label">Look for a Serie</h1>
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div nbEpisode --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Nombre d'episodes entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minNbEpisode" class="form-label">
                                                        <input type="number" step="1" class="form-control"
                                                               id="minNbEpisode" name="minNbEpisode"
                                                            value="0" required>
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxNbEpisode" class="form-label">
                                                        <input type="number" step="1" class="form-control"
                                                               id="maxNbEpisode" name="maxNbEpisode"
                                                            value="99999" required>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div nbEpisode --%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <%-- Begining div Date Debut Serie --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Debut Serie entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minDateDebutSerie" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="minDateDebutSerie" name="minDateDebutSerie">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxDateDebutSerie" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="maxDateDebutSerie" name="maxDateDebutSerie">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div Date Debut Serie --%>

                                        <%-- Begining div Date Debut Serie --%>
                                        <div class="mb-3">
                                            <h6 class="form-label">Fin Serie entre</h6>
                                            <div class="row">
                                                <div class="col-lg-6 mb-12">
                                                    <label for="minDateFinSerie" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="minDateFinSerie" name="minDateFinSerie">
                                                    </label>
                                                </div>
                                                <div class="col-lg-6 mb-12">
                                                    <label for="maxDateFinSerie" class="form-label">
                                                        <input type="date" class="form-control"
                                                               id="maxDateFinSerie" name="maxDateFinSerie">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Ending div Date Debut Serie --%>
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
            <jsp:include page="f-serie.jsp"/>
            <%-- Ending Search Result --%>
        </div>
    </div>
</section>
