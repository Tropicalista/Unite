<cfoutput>
	<ol class="comment-list">

		<li id="comment-#comment.getCommentId()#" class="comment even thread-even depth-1 parent">

			<article id="div-comment-1435" class="comment-body">

				<footer class="comment-meta">
					<div class="comment-author vcard">

						#cb.quickAvatar(author=comment.getAuthorEmail(),size=60,class="avatar avatar-60 photo grav-hashed grav-hijack")#

						<b class="fn">#comment.getAuthor()#</b> <span class="says">says:</span>					
					</div><!-- .comment-author -->

					<div class="comment-metadata">
						<time datetime="#comment.getDisplayCreatedDate()#">
							#comment.getDisplayCreatedDate()#							
						</time>
					</div><!-- .comment-metadata -->

				</footer><!-- .comment-meta -->

				<div class="comment-content">
					<p>#comment.getContent()#</p>
				</div><!-- .comment-content -->

			</article>

		</li>

	</ol>
</cfoutput>