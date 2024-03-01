<%@ page import="java.util.List" %>
<%@ page import="entities.Carte" %>
<%@ page import="entities.ModelCarte" %>
<%@ page import="entities.supp.User" %>
<%
    List<ModelCarte> models = ( List<ModelCarte> ) request.getAttribute( "models" );
    List<User> users = ( List<User> ) request.getAttribute( "users" );

    Carte carte = null;
    carte = ( Carte ) request.getAttribute( "carte" );

    String action = "cartesUp?action=1";
    if ( carte != null ) {
        action = "cartesUp?action=2&idCarte=" + carte.getIdCarte();
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
                notification = "Oops! Something wrong happened.";
                notificationClass = "alert alert-danger";
                break;
        }
    }
%>
<br>
<br>
<br>
<br>
<br>
<div class="card">
    <div class="card-body">
        <section id="form-carte">
            <div class="col-lg-10">
                <div class="card-body">
                    <div class="card">
                        <div class="card-body">

                            <form method="POST" action="<%= action %>">
                                <div class="row">
                                    <h3 class="form-label">Informations about the Carte</h3>

                                    <div class="col-lg-7 col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="mb-3">
                                                    <label for="prixProprio" class="form-label">Prix du
                                                        Proprietaire</label>
                                                    <input type="number" step="any" class="form-control"
                                                           id="prixProprio"
                                                           name="prixProprio" value="<%
                                                                if ( carte != null ) out.print( carte.getPrixProprio() );
                                                            %>"
                                                           required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="dateFabrication" class="form-label">Date de
                                                        Fabrication</label>
                                                    <input type="date" class="form-control" id="dateFabrication"
                                                           name="dateFabrication" value="<%
                                                                if ( carte != null ) out.print( carte.getDateFabrication() );
                                                            %>"
                                                           required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-5 col-md-12">
                                        <div class="card">
                                            <div class="card-body">

                                                <div class="mb-3">
                                                    <label for="idModelCarte" class="form-label">Model</label>
                                                    <select class="form-select" id="idModelCarte" name="idModelCarte"
                                                            required>
                                                        <option value="">Select a ModelCarte</option>
                                                        <% for ( ModelCarte model : models ) { %>
                                                        <option value="<%= model.getIdModelCarte() %>" <%
                                                            if ( carte != null ) {
                                                                if ( carte.getIdModelCarte() == model.getIdModelCarte() )
                                                                    out.print( "selected" );
                                                            }
                                                        %> ><%= model.getNomModel() %>
                                                        </option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="idUser" class="form-label">Proprietaire</label>
                                                    <select class="form-select" id="idUser" name="idUser"
                                                            required>
                                                        <option value="">Select a User</option>
                                                        <% for ( User user : users ) { %>
                                                        <option value="<%= user.getIdUser() %>" <%
                                                            if ( carte != null ) {
                                                                if ( carte.getIdUser() == user.getIdUser() )
                                                                    out.print( "selected" );
                                                            }
                                                        %> ><%= user.getNomUser() %>
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
    </div>
</div>