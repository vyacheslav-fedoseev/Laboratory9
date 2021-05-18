<%@ tag pageEncoding="UTF-8" %>
<%-- Импортировать JSTL-библиотеки --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%-- Коллекция объявлений для показа --%>
<%@attribute name="adListing" required="true" rtexprvalue="true"
             type="java.util.AbstractCollection" %>
<%-- Режим редактирования (будут ли показываться кнопки edit, delete --%>
<%@attribute name="editMode" required="false" rtexprvalue="false"
             type="java.lang.Boolean" %>
<%-- Таблица с заголовками показывается только если в списке есть хотя бы
одно объявление --%>
<c:if test="${adListing!=null}">
    <table border="0" cellpadding="5" cellspacing="1">
        <tr bgcolor="#cccccc" align="center">
            <td>
                Тема объявления<br>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="subject"/>
    <c:param name="dir" value="asc"/>
</c:url>"><img src="<c:url value="/resources/asc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="subject"/>
    <c:param name="dir" value="desc"/>
</c:url>"><img src="<c:url value="/resources/desc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
            </td>
            <td>
                Автор<br>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="author"/>
    <c:param name="dir" value="asc"/>
</c:url>"><img src="<c:url value="/resources/asc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="author"/>
    <c:param name="dir" value="desc"/>
</c:url>"><img src="<c:url value="/resources/desc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
            </td>
            <td>
                Дата последнего изменения<br>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="date"/>
    <c:param name="dir" value="asc"/>
</c:url>"><img src="<c:url value="/resources/asc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
                <a href="<c:url
        value="${pageContext.request.requestURL}">
    <c:param name="sort" value="date"/>
    <c:param name="dir" value="desc"/>
</c:url>"><img src="<c:url value="/resources/desc.png"
/>" width="20" height="19" border="0" align="absmiddle"></a>
            </td>
        </tr>
            <%-- Организовать цикл по всем объявлениям из коллекции adListing
            --%>
        <c:forEach items="${adListing}" var="ad">
            <tr valign="top">
                <td>
                        <%-- Вывести тему объявления, являющуюся
                        гиперссылкой на страницу детального просмотра объявления --%>
                    <a href="<c:url value="/viewAd.jsp"><c:param
            name="id" value="${ad.id}" /></c:url>"><c:out value="${ad.subject}"/></a>
                        <%-- Кнопки редактирования / удаления объявлений
                        показываются только в случае включенного режима редактирования --%>
                    <c:if test="${editMode==true}">
                        <my:editButton ad="${ad}" />
                        <my:deleteButton ad="${ad}" />
                    </c:if>
                </td>
                    <%-- Вывести автора объявления --%>
                <td><c:out value="${ad.author.name}"/></td>
                    <%-- Вывести дату последней модификации объявления --%>
                <td><fmt:formatDate pattern="hh:mm:ss dd-MM-yyyy"
                                    value="${ad.lastModifiedDate}" /></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
