<%@ page import="java.util.List" %>
<%@ page import="entities.supp.Generation" %>
<%
    List<Generation> generations = ( List<Generation> ) request.getAttribute( "generations" );

    String addMsg = "", addMsgClass = "";
    if ( request.getParameter( "addMsg" ) != null ) {
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
                addMsg = "Oops! Something wrong happened during Add Operation.";
                addMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="list-generations">
    <br>
    <br>
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">

            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div id="list-info-generations">
                        <script>
                            const header = ['Id', 'Nom Generation', 'Action'];
                            const data = [
                                <% for ( Generation generation : generations ) { %>
                                {
                                    idGeneration: <%= generation.getIdGeneration() %>,
                                    NomGeneration: '<%= generation.getNomGeneration() %>'
                                },
                                <% } %>
                            ];
                            const table = generateTableTopContainer("Liste des Generations", header, data, "listGeneration");
                            document.getElementById("list-info-generations").appendChild(table);
                        </script>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card-body">
                        <div class="card">
                            <div class="card-body">

                                <form method="POST" action="generationsAdd">
                                    <div class="row">
                                        <h3 class="form-label">Add new Generation</h3>

                                        <div class="col-lg-7 col-md-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mb-3">
                                                        <label for="nomGeneration" class="form-label">Nom
                                                            Generation</label>
                                                        <input type="text" class="form-control" id="nomGeneration"
                                                               name="nomGeneration"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button type="submit" class="btn btn-success">Add Generation</button>
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
        </div>
    </div>
</section>
