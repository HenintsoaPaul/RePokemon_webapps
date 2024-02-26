<%@ page import="entities.Generation" %>
<%
    Generation generation = ( Generation ) request.getAttribute( "generation" );

    String upMsg = "", upMsgClass = "";
    if ( request.getParameter( "upMsg" ) != null ) {
        upMsg = request.getParameter( "upMsg" );
        upMsgClass = "alert alert-danger";
    }
    else if ( request.getParameter( "upCode" ) != null ) {
        int upCode = Integer.parseInt( request.getParameter( "upCode" ) );
        switch ( upCode ) {
            case 1:
                upMsg = "Success!";
                upMsgClass = "alert alert-success";
                break;
            case 0:
                upMsg = "Oops! Something wrong happened during Update Operation.";
                upMsgClass = "alert alert-danger";
                break;
        }
    }
%>
<section id="up-generation">
    <br>
    <br>
    <br>
    <br>
    <br>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-4">
                    <div id="info-generation">
                        <script>
                            const header = ['Id', 'Nom Generation'];
                            const data = [
                                {
                                    idGeneration: <%= generation.getIdGeneration() %>,
                                    NomGeneration: '<%= generation.getNomGeneration() %>'
                                }
                            ];
                            const table = generateTableTopContainer("Informations Generation", header, data, "generation");
                            document.getElementById("info-generation").appendChild(table);
                        </script>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card-body">
                        <div class="card">
                            <div class="card-body">

                                <form method="POST" action="generations?action=2&idGeneration=<%= generation.getIdGeneration() %>">
                                    <div class="row">
                                        <h3 class="form-label">Update Generation</h3>

                                        <div class="col-lg-7 col-md-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="mb-3">
                                                        <label for="nomGeneration" class="form-label">Nom Generation</label>
                                                        <input type="text" class="form-control" id="nomGeneration"
                                                               name="nomGeneration"
                                                               value="<%= generation.getNomGeneration() %>" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>

                                    <br>
                                    <div class="<%= upMsgClass %>" role="alert">
                                        <%= upMsg %>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>