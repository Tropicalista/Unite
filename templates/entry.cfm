<cfoutput>

    <article class="hentry">

        <header class="entry-header page-header">
            <h1 class="entry-title">
                <a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a>
            </h1>
            <div class="entry-meta">
                <span class="posted-on"><i class="fa fa-calendar"></i> 
                    <time class="entry-date published" datetime="#entry.getDisplayPublishedDate()#">#entry.getDisplayPublishedDate()#</time>
                </span>
                <span class="">
                    <i class="fa fa-user"></i>
                    <span class="author vcard">
                        #entry.getAuthor().getName()#
                    </span>
                </span>
                <span class="cat-links"><i class="fa fa-folder-open-o"></i>
                    #cb.quickCategoryLinks(entry)#            
                </span>                        
            </div>
        </header>

        <div class="entry-content">

            <p>#entry.renderExcerpt()#</p>
            <p>
                <a class="btn btn-primary read-more" href="#cb.linkEntry(entry)#" title="#entry.getTitle()#">Read More 
                    <i class="fa fa-chevron-right"></i>
                </a>
            </p>
        </div>

    </article> <!-- /.blog-item -->

</cfoutput>