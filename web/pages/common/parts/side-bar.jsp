<section id="sideBar">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>

            <div class="brand-logo d-flex align-items-center justify-content-between">
                <a href="about.html" class="text-nowrap logo-img">
                    <img src="web/assets/images/logos/dark-logo.svg" width="180" alt=""/>
                </a>
                <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                </div>
            </div>

            <!-- Sidebar navigation-->

            <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                <ul id="sidebarnav">

                    <%
                        int idStatus = ( int ) request.getSession().getAttribute( "idStatus" );
                        if ( idStatus == 1 ) {
                    %>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">ENTITIES</span>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="cartes?action=1" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Display Cartes</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="models?action=1" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Display Models</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="series?action=1" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Display Series</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="ventes?action=1" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Display Ventes</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="infoPokemonAdd?action=1" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Add Pokemon</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="typesAdd" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Add Type</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="generationsAdd" aria-expanded="false">
                            <span><i class="ti ti-layout-dashboard"></i></span>
                            <span class="hide-menu">Add Generation</span>
                        </a>
                    </li>
                    <% } %>


                    <!-- COLLECTION -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">COLLECTION</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="mesCartes?action=1" aria-expanded="false">
                            <span><i class="ti ti-cards"></i></span>
                            <span class="hide-menu">Mes Cartes</span>
                        </a>
                    </li>

                    <!-- MARKET -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">MARKET</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="vente?action=1" aria-expanded="false">
                            <span><i class="ti ti-shopping-cart-plus"></i></span>
                            <span class="hide-menu">Acheter des Cartes</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="bilan"
                           aria-expanded="false">
                            <span><i class="ti ti-cards"></i></span>
                            <span class="hide-menu">Bilan Vente</span>
                        </a>
                    </li>

                    <!-- SEARCH -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">EXPLORATION</span>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="search" aria-expanded="false">
                            <span><i class="ti ti-backpack"></i></span>
                            <span class="hide-menu">Explorer, Rechercher, ...</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="cartes?action=2" aria-expanded="false">
                            <span><i class="ti ti-backpack"></i></span>
                            <span class="hide-menu">Recherche de Carte</span>
                        </a>
                    </li>

                    <!-- AUTH -->
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">AUTH</span>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="userAuthf" aria-expanded="false">
                            <span><i class="ti ti-login"></i></span>
                            <span class="hide-menu">Change Account</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="userRegister" aria-expanded="false">
                            <span><i class="ti ti-user-plus"></i></span>
                            <span class="hide-menu">Re-Register</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
</section>