<%@ page import="java.util.List" %>
<%@ page import="entities.ModelCarte" %>
<%
    List<ModelCarte> models = ( List<ModelCarte> ) request.getAttribute( "models" );
    int idUser = (int) request.getSession().getAttribute("idUser");

    String addMsg = "", addMsgClass = "";
    if ( request.getParameter( "addMsg" ) != null || request.getParameter( "addMsg" ) != null ) {
        addMsg = request.getParameter( "addMsg" );
        addMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter( "addCode" ) != null ) {
        int addCode = Integer.parseInt( request.getParameter( "addCode" ) );
        switch ( addCode ) {
            case 1:
                addMsg = "Success!";
                addMsgClass = "alert alert-success";
                break;
            case 0:
                addMsg = "Oops! Something wrong happened.";
                addMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="factory">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <div class="card">
        <div class="col-lg-10">
            <div class="card-body">
                <div class="card">
                    <div class="card-body">

                        <form method="POST" action="cartes">
                            <input type="hidden" value="<%= idUser %>" name="idUser">

                            <div class="row">
                                <h3 class="form-label">Add New Carte</h3>

                                <div class="col-lg-7 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="prixProprio" class="form-label">Prix</label>
                                                <input type="number" step="any" class="form-control" id="prixProprio"
                                                       name="prixProprio" value="0.0" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateFabrication" class="form-label">Date de
                                                    Fabrication</label>
                                                <input type="date" class="form-control" id="dateFabrication"
                                                       name="dateFabrication" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="idModel" class="form-label">Model</label>
                                                <select class="form-select" id="idModel" name="idModel" required>
                                                    <option value="">Select a Model</option>
                                                    <% for ( ModelCarte model : models ) { %>
                                                    <option value="<%= model.getIdModelCarte() %>"><%= model.getNomModel() %>
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Add Carte</button>
                            </div>

                            <br>
                            <div class="<%= addMsgClass %>" role="alert">
                                <%= addMsg %>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>