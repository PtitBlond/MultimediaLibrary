<%@include file="/WEB-INF/_inc/bootstrap.jsp" %>
<c:set var="_page_current" value="home" />
<%@include file="/WEB-INF/_inc/header.jsp" %>
    <div class="jumbotron">
        <h1>M�diath�que Polytech</h1>
        <p>
            Bienvenue sur le site web de gestion de la m�diath�que de Polytech Lyon.
        </p>
        <p class="pull-right" style="margin-bottom: 0;">
            <c:url value="/loanableWorks.jsp?action=list" var="_url" />
            <a class="btn btn-default" href="${fn:escapeXml(_url)}" role="button">
                <span class="glyphicon glyphicon-transfer"></span>
                Catalogue des pr�ts
            </a>
            <c:url value="/sellableWorks.jsp?action=list" var="_url" />
            <a class="btn btn-default" href="${fn:escapeXml(_url)}" role="button">
                <span class="glyphicon glyphicon-euro"></span>
                Catalogue des ventes
            </a>
        </p>
        <div class="clearfix"></div>
    </div>
    <ul>
        <li>
            A quoi correspondent les �tats <q>L</q> et <q>R</q> de la colonne
            <code>etat_oeuvrevente</code> dans la table <code>oeuvrevente</code> ?
        </li>
        <li>
            Il manque la table faisant la jointure entre une oeuvre pr�table
            et l'adh�rent d�sirant l'emprunter.
        </li>
        <li>
            <kbd>c:url</kbd> + TAB -&gt; <code> &lt;c:url value="..." var="_url" /&gt;</code><br/>
            <kbd>_url</kbd> + TAB -&gt; <code>&lt;c:out value="\${_url}" /&gt;</code>
        </li>
    </ul>
<%@include file="/WEB-INF/_inc/footer.jsp" %>