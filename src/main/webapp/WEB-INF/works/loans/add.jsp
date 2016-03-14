<%@include file="/WEB-INF/_inc/bootstrap.jsp" %>
<c:set var="_page_title" value="Ajout d'une oeuvre � pr�ter" />
<c:set var="_page_current" value="works_loans_add" />
<c:set var="_page_stylesheets">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.min.css" media="screen" />
</c:set>
<c:set var="_page_scripts">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/i18n/fr.js"></script>
    <script type="text/javascript">
        $(function() {
            // Select 2
            var $ownersList = $("#ownerId");
            var $options = $ownersList.find("option");
            var firstItemId = $options.length > 0 ? $options.eq(0).val() : -1;
            
            $ownersList.select2({
                language: "fr"
            });
            
            $("form").on("reset", function(e) {
                <c:choose>
                    <c:when test="${_last_owner_id != null}">
                        $ownersList.val(${_last_owner_id}).trigger("change");
                    </c:when>
                    <c:otherwise>
                        $ownersList.val(firstItemId).trigger("change");
                    </c:otherwise>
                </c:choose>
            });
        });
    </script>
</c:set>
<%@include file="/WEB-INF/_inc/header.jsp" %>
    <div class="page-header">
        <h1>
            Ajout d'une nouvelle oeuvre � pr�ter
        </h1>
    </div>
    <c:url value="/loanableWorks.jsp?action=add" var="_url" />
    <form class="form-horizontal" method="post" action="${fn:escapeXml(_url)}">
        <div class="form-group<c:if test="${not empty _error_name}"> has-error</c:if>">
            <label for="name" class="control-label col-sm-2">
                Nom de l'oeuvre*
            </label>
            <div class="col-sm-10">
                <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
                    <c:if test="${not empty _last_name}">
                        value="${fn:escapeXml(_last_name)}"
                    </c:if>
                />
                <c:if test="${not empty _error_name}">
                    <span class="help-block">
                        ${_error_name}
                    </span>
                </c:if>
            </div>
        </div>
        <div class="form-group<c:if test="${not empty _error_owner_id}"> has-error</c:if>">
            <label for="ownerId" class="control-label col-sm-2">
                Propri�taire*
            </label>
            <div class="col-sm-10">
                <select class="form-control" id="ownerId" name="ownerId">
                    <c:forEach items="${owners}" var="owner">
                        <option
                            value="${owner.id}"
                            <c:if test="${not empty _last_owner_id and _last_owner_id == owner.id}">
                                selected="selected"
                            </c:if>
                        >
                            <c:out value="${owner.firstName} ${owner.lastName}" />
                        </option>
                    </c:forEach>
                </select>
                <c:if test="${not empty _error_owner_id}">
                    <span class="help-block">
                        ${_error_owner_id}
                    </span>
                </c:if>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">
                    Ajouter
                </button>
                <button type="reset" class="btn btn-danger">
                    <c:choose>
                        <c:when test="${_method == _method_post}">
                            R�initialiser
                        </c:when>
                        <c:otherwise>
                            Tout effacer
                        </c:otherwise>
                    </c:choose>
                </button>
                <c:url value="/loanableWorks.jsp?action=list" var="_url" />
                <a href="${fn:escapeXml(_url)}" class="btn btn-default">
                    Retour � la liste
                </a>
            </div>
        </div>
    </form>
<%@include file="/WEB-INF/_inc/footer.jsp" %>