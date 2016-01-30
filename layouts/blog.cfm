<cfoutput>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 

<html class="no-js"> <!--<![endif]-->
    <head>

        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!--- Site Title --->
		<title>
		<cfif cb.isEntryView()>
			#cb.getCurrentEntry().getTitle()#
		<cfelse>
			#cb.siteName()# - #cb.siteTagLine()#
		</cfif>
		</title>     

		<!--- ********************************************************************************* --->
		<!--- 					META TAGS														--->
		<!--- ********************************************************************************* --->
		<meta name="generator" 	 	content="ContentBox powered by ColdBox" />
		<meta name="robots" 	 	content="index,follow" />
		<meta name="viewport" 		content="width=device-width, initial-scale=1">
		<meta charset="utf-8" /> 

		<!--- ********************************************************************************* --->
		<!--- 					META TAGS														--->
		<!--- ********************************************************************************* --->
		<meta name="generator" 	 	content="ContentBox powered by ColdBox" />
		<meta name="robots" 	 	content="index,follow" />
		<meta name="viewport" 		content="width=device-width, initial-scale=1">
		<meta charset="utf-8" /> 

		<!--- Meta per page or index --->
		<cfif cb.isEntryView() AND len( cb.getCurrentEntry().getHTMLDescription() )>
			<meta name="description" content="#cb.getCurrentEntry().getHTMLDescription()#" />
		<cfelse>
			<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
		</cfif>
		<cfif cb.isEntryView() AND len(cb.getCurrentEntry().getHTMLKeywords())>
			<meta name="keywords" 	 content="#cb.getCurrentEntry().getHTMLKeywords()#" />
		<cfelse>
			<meta name="keywords" 	 content="#cb.siteKeywords()#" />
		</cfif>

		<!--- Base HREF for SES enabled URLs --->
		<base href="#cb.siteBaseURL()#" />

		<!--- ********************************************************************************* --->
		<!--- 					RSS DISCOVERY													--->
		<!--- ********************************************************************************* --->
		<cfif cb.themeSetting( "rssDiscovery", true )>
			<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
			<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
			<cfif cb.isEntryView()>
				<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS( comments=true, entry=cb.getCurrentEntry() )#" />
			</cfif>
		</cfif>		 

		<!--- ********************************************************************************* --->
		<!--- 					CSS 															--->
		<!--- ********************************************************************************* --->

		<!--// Font Family //-->
		<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>

		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

		<!-- injector:css -->
		<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/d9ac3a8f.theme.min.css">
		<!-- endinjector -->

		<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/themes/#lcase( cb.themeSetting( 'cbUniteTheme', 'blue' ))#.css?v=1" />

		<!--- ********************************************************************************* --->
		<!--- 					JAVASCRIPT														--->
		<!--- ********************************************************************************* --->
		<!-- injector:js -->
		<script src="#cb.themeRoot()#/includes/js/6763865d.theme.min.js"></script>
		<!-- endinjector -->

		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#

    </head>
<body>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterBodyStart")#

	<!--- Page --->
	<div id="page">

		<!--- Header --->
		#cb.quickView(view='_header')#

		<!--- Main Body --->
	    <div id="content" class="site-content container">

	        <div id="primary" class="content-area col-sm-12 col-md-8 pull-left">

	            <main id="main" class="site-main">

						<!--- ContentBoxEvent --->
						#cb.event("cbui_beforeContent")#

						<!--- Content --->
						#renderview()#

						<!--- ContentBoxEvent --->
						#cb.event("cbui_afterContent")#

	            </main>

	        </div> <!-- end of /.container -->

			<div id="secondary" class="widget-area col-sm-12 col-md-4">
				#cb.quickView(view='_blogsidebar')#
			</div>
	    
	    </div>

	</div>	


	#cb.quickView(view='_footer')#
        
</body>
</html>
</cfoutput>