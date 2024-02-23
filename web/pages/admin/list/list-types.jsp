<%@ page import="java.util.List" %>
<%@ page import="entities.Type" %>
<%
    List<Type> types = ( List<Type> ) request.getAttribute( "types" );

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
<section id="list-types">
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">

            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div id="list-info-types">

                        <script>
                            const header = ['Id', 'Nom Type', 'Action'];
                            const data = [
                                <% for ( Type type : types ) { %>
                                {
                                    idType: <%= type.getIdType() %>,
                                    NomType: '<%= type.getNomType() %>'
                                },
                                <% } %>
                            ];
                            const table = generateTableTopContainer("Liste des Types", header, data, "listInfoType");
                            document.getElementById("list-info-types").appendChild(table);
                        </script>

                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card-body">
                        <div class="card">
                            <div class="card-body">

                                <form method="POST" action="types?action=1">
                                    <div class="row">
                                        <h3 class="form-label">Add new Type</h3>

                                        <div class="col-lg-7 col-md-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mb-3">
                                                        <label for="nomType" class="form-label">Nom Type</label>
                                                        <input type="text" class="form-control" id="nomType"
                                                               name="nomType"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button type="submit" class="btn btn-success">Add Type</button>
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
