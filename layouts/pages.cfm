<cfparam name="args.sidebar" default="true">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<!--- Page Includes --->
	#cb.quickView( "_pageIncludes" )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeHeadEnd" )#
</head>
<body>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_afterBodyStart" )#

	<!--- Page --->
	<div id="page">

		<!--- Header --->
		#cb.quickView( view='_header' )#

		<!--- ContentBoxEvent --->
		#cb.event( "cbui_beforeContent" )#

		<!--- Main View --->
		#cb.mainView( args=args )#

		<!--- ContentBoxEvent --->
		#cb.event( "cbui_afterContent" )#

	</div>

	<!--- Footer --->
	#cb.quickView( view='_footer' )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeBodyEnd" )#	
</body>
</html>
</cfoutput>