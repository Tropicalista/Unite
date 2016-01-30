<cfoutput>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_preIndexDisplay")#
			
		<!--- Are we filtering by category? --->
		<cfif len(rc.category)>
			<p class="infoBar">
				Category Filtering: '#rc.category#'
			</p>
			<p class="buttonBar">
				<a href="#cb.linkHome()#" class="btn btn-info" title="Remove filter and view all entries">Remove Filter</a>
			</p>
			<br/>
		</cfif>

		<!--- Are we searching --->
		<cfif len(rc.q)>
			<p class="buttonBar">
				<a class="btn btn-primary" href="#cb.linkHome()#" title="Clear search and view all entries">Clear Search</a>
			</p>
			<div class="infoBar">
				Searching by: '#rc.q#'
			</div>
			<br/>
		</cfif>

		#cb.quickEntries()#

	    <cfif prc.entriesCount>

	        <div class="page-turn">
	            <div class="row">
	                <div class="col-md-6 col-md-offset-3 text-center">
	                    #cb.widget( "pagination", {count=prc.entriesCount,link=prc.pagingLink} )#
	                </div>
	            </div>
	        </div>

	    </cfif>
    
		<!--- ContentBoxEvent --->
		#cb.event("cbui_postIndexDisplay")#

</cfoutput>