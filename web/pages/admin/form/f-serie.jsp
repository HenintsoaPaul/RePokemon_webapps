<%@ page import="entities.Serie" %>
<%
    Serie serie = null;
    serie = ( ModelCarte ) request.getAttribute( "serie" );
    String action = "seriesUp?action=1";
    if ( serie != null ) {
        action = "seriesUp?action=2&idSerie=" + serie.getIdModelCarte();
    }

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
                notification = "Oops! Something wrong happened..";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<br>
<br>
<br>
<section id="form-serie">
    <div class="card">
        <div class="card-body">
            <div class="col-lg-10">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="<%= action %>">
                            <div class="row">
                                <h3 class="form-label">Informations about the Serie</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="nomSerie" class="form-label">Nom Serie</label>
                                                <input type="text" class="form-control" id="nomSerie" name="nomSerie"
                                                       value="<%
                                                   if ( serie != null ) out.print( serie.getNomSerie() );
                                                   %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="nbEpisode" class="form-label">Nombre d'episodes</label>
                                                <input type="number" step="any" class="form-control" id="nbEpisode"
                                                       name="nbEpisode" value="<%
                                                   if ( serie != null ) out.print( serie.getNbEpisode() );
                                                   %>" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="dateDebutSerie" class="form-label">Date debut Serie</label>
                                                <input type="date" class="form-control" id="dateDebutSerie"
                                                       name="dateDebutSerie" value="<%
                                                   if ( serie != null ) out.print( serie.getDateDebutSerie() );
                                                   %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateFinSerie" class="form-label">Date fin Serie</label>
                                                <input type="date" class="form-control" id="dateFinSerie"
                                                       name="dateFinSerie" value="<%
                                                   if ( serie != null ) out.print( serie.getDateFinSerie() );
                                                   %>" required>
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
    </div>
</section>