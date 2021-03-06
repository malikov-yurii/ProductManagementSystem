<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%@ page session="false" %>

<html>
<head>
    <title>Products list</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${pageContext.request.contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Welcome, ${pageContext.request.userPrincipal.name}!</h2>
        <button class="btn" onclick="document.forms['logoutForm'].submit()">Logout</button>
    </c:if>
</div>

<h2>List of products</h2>
<c:if test="${!empty listProducts}">

    <display:table id="product" name="listProducts" requestURI="/products" pagesize="4" class="tg"
                   decorator="com.malikov.productmanager.TableWrapper">
        <display:column property="id" title="ID" sortable="false"/>
        <display:column property="linkName" title="Name" sortable="false"/>
        <display:column property="producer" title="Producer" sortable="false"/>
        <display:column property="price" title="Price" sortable="false"/>
        <display:column property="description" title="Description" sortable="false"/>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <display:column property="linkEdit" title="Edit"/>
            <display:column property="linkDelete" title="Delete"/>
        </sec:authorize>
    </display:table>
</c:if>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <h2>Add/Edit a product</h2>
    <c:url var="addAction" value="/products/add"/>
    <form:form action="${addAction}" commandName="product">
        <table>
            <c:if test="${!empty product.name}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="producer">
                        <spring:message text="Producer"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="producer"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="price">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="price"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<spring:message text="Submit"/>"/>
                </td>
            </tr>
        </table>
    </form:form>
</sec:authorize>

</body>
</html>
<br/>
</body>
</html>
