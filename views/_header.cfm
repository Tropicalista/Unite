<cfoutput>
<div class="container header-area">
	<header id="masthead" class="site-header col-sm-12" role="banner">

	<div class="site-branding col-md-6">
		
		<h1 class="site-title"><a href="#cb.linkHome()#" rel="home" title="#cb.siteTagLine()#">#cb.siteName()#</a></h1>
		<h4 class="site-description">#cb.siteTagLine()#</h4>

	</div>

	<div class="social-header col-md-6">
		<div id="social" class="social">
            <cfif Len(cb.themeSetting( 'twitter' ))>
				<a class="social-profile twitter" href="#cb.themeSetting( 'twitter' )#" target="_blank" title="twitter">
					<span class="social_icon fa fa-twitter"></span>
				</a>
            </cfif>
            <cfif Len(cb.themeSetting( 'facebook' ))>
				<a class="social-profile facebook" href="#cb.themeSetting( 'facebook' )#" target="_blank" title="facebook">
					<span class="social_icon fa fa-facebook"></span>
				</a>
            </cfif>
            <cfif Len(cb.themeSetting( 'google' ))>
				<a class="social-profile google-plus" href="#cb.themeSetting( 'google' )#" target="_blank" title="google">
					<span class="social_icon fa fa-google-plus"></span>
				</a>
            </cfif>
            <cfif Len(cb.themeSetting( 'pinterest' ))>
				<a class="social-profile pinterest" href="#cb.themeSetting( 'pinterest' )#" target="_blank" title="pinterest">
					<span class="social_icon fa fa-pinterest"></span>
				</a>
            </cfif>
            <cfif Len(cb.themeSetting( 'instagram' ))>
				<a class="social-profile instagram" href="#cb.themeSetting( 'instagram' )#" target="_blank" title="instagram">
					<span class="social_icon fa fa-instagram"></span>
				</a>
            </cfif>
		</div>			
	</div>

	</header><!--- masthead --->
</div>

<nav class="navbar navbar-default" role="navigation">
	<div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>

				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif structKeyExists( menuItem, "subPageMenu" )>
						<li class="dropdown">
							<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
							#buildSubMenu( menuItem.subPageMenu )#
						</li>
					<cfelse>
						<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
							<li class="active">
						<cfelse>
							<li>
						</cfif>
							<a href="#menuItem.link#">#menuItem.title#</a>
						</li>
					</cfif>
				</cfloop>

				<!--- Blog Link, verify active --->
				<cfif ( !prc.cbSettings.cb_site_disable_blog )>
					<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
						<a href="#cb.linkBlog()#">News</a>
					</li>
				</cfif>
			</ul>
		</div>		    

	</div>
</nav>

<cfscript>
any function buildSubMenu( required menuData ){
	var menu = '<ul class="dropdown-menu">';
	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>