<cfoutput>
	<li class="cat-item">
		<!--- Category --->
		<a href="#cb.linkCategory(category)#" title="Filter by #category.getCategory()#">#category.getCategory()# 
			<span>#category.getNumberOfEntries()#</span>
		</a>
	</li>
</cfoutput>