<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">
<cfset maincol = args.sidebar ? "col-md-8" : "col-md-12">

	<!--- Main Body --->
    <div id="content" class="site-content container">

        <!-- blog-contents -->
    	<div id="primary" class="content-area col-sm-12 col-md-8 pull-left">

            <main id="main" class="site-main">

			    <article class="hentry">

	                <header class="entry-header page-header">
	                    <h1 class="entry-title">
	                        #prc.page.getTitle()#
	                    </h1>
	                	<small><a href="/">Home</a> #cb.breadCrumbs( separator="<i class='fa fa-angle-right'></i> " )#</small>
	                    <div class="entry-meta">
	                        <span class="posted-on"><i class="fa fa-calendar"></i> 
	                            <time class="entry-date published" datetime="#prc.page.getDisplayPublishedDate()#">#prc.page.getDisplayPublishedDate()#</time>
	                        </span>
	                        <span class="">
	                            <i class="fa fa-user"></i>
	                            <span class="author vcard">
	                                #prc.page.getAuthor().getName()#
	                            </span>
	                        </span>
	                        <span class="cat-links"><i class="fa fa-folder-open-o"></i>
	                            #cb.quickCategoryLinks(prc.page)#            
	                        </span>                        
	                    </div>
	                </header>
	                <div class="entry-content">
	                    <p>#prc.page.renderContent()#</p>
	                </div>

			    </article> <!-- /.blog-item -->

				<!--- Comments Bar --->
				<cfif cb.isCommentsEnabled( prc.page )>

				    <div class="comments-area">
				        <h2 class="comments-title">
				            #len(prc.entry.getComments())# thoughts on #prc.entry.getTitle()#
				        </h2>
				        #cb.quickComments()#
				    </div>

				    <div id="respond" class="comment-respond">
				        <h3 id="reply-title" class="comment-reply-title">Leave a Reply</h3>
				        #cb.widget( "MyCommentForm",{content=#prc.entry#} )#
				    </div>

				</cfif>


			</main>

		</div>

			<cfif args.sidebar>
				<div id="secondary" class="widget-area col-sm-12 col-md-4">
					#cb.quickView(view='_blogsidebar')#
				</div>
			</cfif>

			<!--- ContentBoxEvent --->
			#cb.event("cbui_postPageDisplay")#

    </div>
	
    
</cfoutput>