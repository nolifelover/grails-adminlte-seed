<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="adminlte" />
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
<div class="box">
	<div class="box-header with-border">
    <h3 class="box-title"><g:message code="default.index.label" args="[entityName]" /></h3>
    <div class="box-tools pull-right">
      <!-- Buttons, labels, and many other things can be placed here! -->
      <!-- Here is a label for example -->
      <g:link action="create" class="label label-primary"><g:message code="default.button.create.label" default="Create"/></g:link>
    </div><!-- /.box-tools -->
  </div><!-- /.box-header -->
  <div class="box-body">
    <table class="table table-bordered margin-top-medium">
			<thead>
				<tr>
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.eachWithIndex { p, i ->
						if (i < 6) {
							if (p.isAssociation()) { %>
					<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
				<%	  } else { %>
					<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
				<%  }   }   } %>
				</tr>
			</thead>
			<tbody>
			<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
				<tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
				<%  props.eachWithIndex { p, i ->
						if (i == 0) { %>
					<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
				<%	  } else if (i < 6) {
							if (p.type == Boolean || p.type == boolean) { %>
					<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
				<%		  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
					<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
				<%		  } else { %>
					<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
				<%  }   }   } %>
				</tr>
			</g:each>
			</tbody>
		</table>
  </div><!-- /.box-body -->
	<div class="box-footer">
    <bs:paginate total="\${${propertyName}Count}" />
  </div><!-- box-footer -->
</div>
</body>

</html>
