/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* 
*/
component{

	// Layout Variables
    this.name       	= "Unite";
	this.description 	= "Unite theme by https://colorlib.com";
	this.version		= "1.0.0";
	this.author 		= "Tropicalista";
	this.authorURL		= "http://www.tropicalseo.net";
	// Screenshot URL, can be absolute or locally in your layout package.
	this.screenShotURL	= "screenshot.png";

	// Layout Settings
	this.settings = [
		{ name="cbUniteTheme", 	defaultValue="blue", 	type="select", 			label="Choose theme:", required="false", options="Default,Blue,Azure,Purple,Green,LightGreen,Orange,Carrot,Red,Grey,DarkGrey" },
		{ name="facebook", 		defaultValue="", 		type="text", 			label="Facebook link:" },
		{ name="google", 		defaultValue="", 		type="text", 			label="Google+ link:" },
		{ name="twitter", 		defaultValue="", 		type="text", 			label="Twitter link:" },
		{ name="pinterest", 	defaultValue="", 		type="text", 			label="Pinterest link:" },
		{ name="instagram", 	defaultValue="", 		type="text", 			label="Instagram link:" },
		{ name="footerText", 	defaultValue="", 		type="textarea", 		label="Footer text:" },
		{ name="footerSocial", 	defaultValue="false", 	type="boolean", 		label="Display social icons on footer:" },
		{ name="footerWidget", 	defaultValue="false", 	type="boolean", 		label="Display widgets on footer:" },
		{ name="sidebarSocial", defaultValue="false", 	type="boolean", 		label="Display social icons on sidebar:" }
	];

	/**
	* Call Back when layout is activated
	*/
	function onActivation(){

	}

	/**
	* Call Back when layout is deactivated
	*/
	function onDeactivation(){

	}

	/**
	* Call Back when layout is deleted from the system
	*/
	function onDelete(){

	}
}
