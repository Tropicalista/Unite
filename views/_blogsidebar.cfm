<cfoutput>
<!--- ContentBoxEvent --->
#cb.event("cbui_BeforeSideBar")#

    <aside class="widget">
        <h3 class="widget-title">Popular Posts</h3>

        <!-- popular posts -->
        <div class="popular-posts-wrapper tab-content">

            #cb.widget('MyRecentEntries')#

        </div> <!-- end posts wrapper -->

    </aside>

    <aside class="widget">
        <h3 class="widget-title">Categories</h3>
        <!-- social icons -->
        <div class="cats-widget tab-content">
            <ul>
                #cb.quickCategories()#
            </ul>
        </div><!-- end social icons -->
    </aside>

    <aside id="search-2" class="widget widget_search">
        <form role="search" method="get" class="form-search" action="#cb.linkSearch()#">
          <div class="input-group">
            <label class="screen-reader-text" for="q">Search for:</label>
            <input type="text" class="form-control search-query" placeholder="Search" value="" name="q" title="Search for:">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-primary" name="submit" id="searchsubmit" value="Search" style=""><span class="glyphicon glyphicon-search"></span></button>
            </span>
          </div>
        </form>
    </aside>

    <!-- end of sidebar -->


<!--- ContentBoxEvent --->
#cb.event("cbui_afterSideBar")#
</cfoutput>