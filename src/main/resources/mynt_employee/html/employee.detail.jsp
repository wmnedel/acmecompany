<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<h2>${currentNode.properties['firstName'].string} ${currentNode.properties['lastName'].string}</h2>
${currentNode.properties['jcr:title'].string}


<c:set var="birthDate" value="${currentNode.properties['birthDate']}"/>
<c:if test="${not empty birthDate}">
    <div>
        <fmt:formatDate value="${birthDate.time}" pattern="dd/MM/yyyy"/>
    </div>
</c:if>

<c:set var="jobTitle" value="${currentNode.properties['jobTitle']}"/>
<div>
    <jcr:nodePropertyRenderer node="${currentNode}" name="jobTitle" renderer="resourceBundle"/>
</div>

<c:set var="nationality" value="${currentNode.properties['nationality']}"/>
<div>
    <jcr:nodePropertyRenderer node="${currentNode}" name="nationality" renderer="flagcountry"/>
</div>

<div class="biography">
    ${currentNode.properties['biography'].string}
</div>

<c:set var="photo" value="${currentNode.properties['photo']}"/>
<c:if test="${not empty photo}">
    <c:url value="${photo.node.url}" var="photoUrl"></c:url>
    <img src="${photoUrl}" alt="${fn:escapeXml(currentNode.properties['jcr:title'].string)}" />
</c:if>