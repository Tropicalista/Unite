/**
* A cool basic commenting form for ContentBox
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	MyCommentForm function init(){
		// super init
		//super.init();

		// Widget Properties
		setName("MyCommentForm");
		setVersion("1.0");
		setDescription("A cool basic commenting form for ContentBox content objects.");
		setAuthor("Tropicalista");
		setAuthorURL("http://www.tropicalseo.net");
		setIcon( "comment-add.png" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The main commenting form widget
	* @content.hint The content object to build the comment form for: page or entry
	*/
	any function renderIt(any content){
		var event 		= getRequestContext();
		var cbSettings 	= event.getValue(name="cbSettings",private=true);
		var captcha		= "";
		var commentForm = "";
		
		// captcha?
		if( cbSettings.cb_comments_captcha ){
			saveContent variable="captcha"{
				writeOutput("
					<br>
					<div class='row'>
						<div class='col-md-6'>
							<img src='#event.buildLink( event.getValue( 'cbEntryPoint', '', true) & '__captcha')#'>
						</div>
						<div class='col-md-6'>
							#html.textField(name='captchacode',placeholder='Enter the security code shown above:',class='form-control',groupWrapper='div class=form-group',required='required',size='50')#
						</div>
					</div>
				");
			}
		}

		// generate comment form
		saveContent variable="commentForm"{
			writeOutput('
			#html.startForm(name="commentForm",action=cb.linkCommentPost(arguments.content),novalidate="novalidate")#

				#cb.event("cbui_preCommentForm")#

				#getModel( "messagebox@cbMessagebox" ).renderIt()#

				#html.hiddenField(name="contentID",value=arguments.content.getContentID())#
				#html.hiddenField(name="contentType",value=arguments.content.getContentType())#

				<div class="row">
					<div class="col-md-12">
						#html.textField(name="author",class="form-control",groupWrapper="div class=form-group",placeholder="Name",required="required",value=event.getValue("author",""))#
					</div>
					<div class="col-md-12">
						#html.inputField(name="authorEmail",class="form-control",groupWrapper="div class=form-group",placeholder="Email",type="email",required="required",value=event.getValue("authorEmail",""))#
					</div>
					<div class="col-md-12">
						#html.inputField(name="authorURL",class="form-control",groupWrapper="div class=form-group",placeholder="Url",type="url",required="required",value=event.getValue("authorURL",""))#
					</div>
					<div class="col-md-12">
						#html.textArea(name="content", id="myContent",class="form-control",required="required",rows="5",placeholder="Type here message",value=event.getValue("content",""))#
					</div>
				</div>

				#captcha#

				<div class="row">
					<br>
					<div class="col-md-6">
						<button type="submit" class="submit btn btn-primary">Post Comment</button>
					</div>
				</div>

				#cb.event("cbui_postCommentForm")#

				

			#html.endForm()#
			');
		}

		return commentForm;
	}

}
