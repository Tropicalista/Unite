/**
* Simple widget to generate a search form

All widgets inherit the following properties available to you:

property name="categoryService"			inject="id:categoryService@cb";
property name="entryService"			inject="id:entryService@cb";
property name="pageService"				inject="id:pageService@cb";
property name="contentService"			inject="id:contentService@cb";
property name="contentVersionService"	inject="id:contentVersionService@cb";
property name="authorService"			inject="id:authorService@cb";
property name="commentService"			inject="id:commentService@cb";
property name="customHTMLService"		inject="id:customHTMLService@cb";
property name="cb"						inject="id:CBHelper@cb";
property name="securityService" 		inject="id:securityService@cb";
property name="html"					inject="coldbox:plugin:HTMLHelper";
*/
component extends="contentbox.models.ui.BaseWidget" singleton{
	
	Pagination function init(controller){
		// Init parent
		super.init( arguments.controller );
		
		// Widget Properties
		setName("Pagination");
		setVersion("1.0");
		setDescription("Simple widget to paginate");
		setAuthor("Tropicalista");
		setAuthorURL("http://www.tropicalseo.net");
		setForgeBoxSlug("");
		
		return this;
	}

    function createPagination( numeric entries, numeric size, string link, numeric page ){
    	var currentPage = arguments.page;
		var totalPages = Ceiling( arguments.entries / arguments.size );
		var pagination = {};
		pagination.nextLink = arguments.page < totalPages ? arguments.page+1 : "";
		pagination.prevLink = arguments.page > 1 ? arguments.page-1 : "";

		pagination.displayLink = arrayNew(1);
		pagination.numberOfPages = totalPages;
		var pageIndex = 1;
		var thisPage = createPage( arguments.link, pageIndex, arguments.page );

		ArrayAppend(pagination.displayLink,thisPage);


		for(i=1;i LTE totalPages-1;i++){
		      pageIndex = pageIndex+1;
		      thisPage = createPage(arguments.link,pageIndex, arguments.page);
		      ArrayAppend(pagination.displayLink,thisPage);
		}
		return pagination;

    }

	function createPage( string link, numeric pageIndex, numeric currentPage ){
		var thisPage = {};
		thisPage.link = replace( arguments.link,"@page@", arguments.pageIndex );
		thisPage.isCurrentPage = arguments.currentPage EQ arguments.pageIndex ? true : false; 
		thisPage.pageNumber = pageIndex;
		return thisPage;
	}

	/**
	* This is the main renderit method you will need to implement in concrete widgets
	*/
	any function renderIt(count,link){
		var event 		= getRequestContext();
		var cbSettings 	= event.getValue(name="cbSettings",private=true);
		var pageNumber = LSParseNumber(event.getValue( "page",1));

		var pagination = createpagination(arguments.count,cbSettings.cb_paging_maxentries,arguments.link,pageNumber);

		// generate recent comments
		saveContent variable="rString"{
			writeOutput('<ul class="pagination pagination-sm">');
			writeOutput('<li>');
			if(Len(pagination.prevLink)){
				writeOutput('<a href="#replace( arguments.link,"@page@", pagination.prevLink )#">Prev</a>');
			}
			writeOutput('</li>');
			for(e in pagination.displayLink){
				writeOutput('<li class="#e.isCurrentPage?"active":""#"><a href="#e.isCurrentPage?"##":e.link#">#e.pageNumber#</a></li>');
			}
			writeOutput('<li>');
			if(Len(pagination.nextLink)){
				writeOutput('<a href="#replace( arguments.link,"@page@", pagination.nextLink )#">Next</a>');
			}
			writeOutput('</li>');
			writeOutput('</ul>');
		}

		return rString;
	}
	
}