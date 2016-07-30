(function($){

    // *** The plugin namespace for $('.selector').shareplus(options); also the id for storing the object state
    var PLUGIN_NS = 'shareplus';

    var Plugin = function ( target, options )
    {
        this.$T = $(target);

        var opts = $.extend(
             true,               // deep extend
             {
                 height: '130px',

                 speedIn: 400, // fadeIn speed
                 speedOut: 600, // fadeOut speed

                 displayTitle: true, // true or flase
                 title: "Share &amp; Bookmark", // shareplus box title

                 sharetitle: "", // sharing page's title
                 shareurl: "", // URL to share

                 icons: "facebook,twitter,google,digg,delicious,stumble,tumblr,linkedin,live,myspace,bebo,email",
                 targetBlank: true, // open link in new tab? true or false

                 fbLikebox: true, // display facebook like box? true or false
                 fbAction: "like", // like or recommend?
                 fbcolorscheme: "light", // light or dark

                 tweets: true, // diaplay tweet button? true or false
                 tweetText: "Check out this URL",
                 tweetVia: "", // via twitter account
                 twitterRelated: "sanalogi", // related twitter account
                 tweetButton: "Tweet",

                 pin: true,
                 pinMedia: "",

                 gplus: true, // display Google Plus one button? true or false

                 ga:  false, // use Google Analytics to track social sharing?
                 // Note: You must already have GA scripts on your page for this to work

                 open: function(){}, // function to activate when open is started
                 opened: function(){}, // function to activate when it is opened

                 exit: function(){}, // function to activate when exit is starting
                 exited: function(){}, // function to activate when it has exited

                 sticker: true, // display share sticker?
                 stickerAlign: 'left' // left or right?

             },
             options
         );
        $(this).data(opts);

        // *** Create Share+ with slected icons and options
        this._create( target, opts );

        // *** Open Share+ when target class is clicked
        $(target).click(function() {
        	Plugin.prototype.open(opts);
        })

        // *** Close Share+ when clicked on the close button or the page
        $('#shareplus_close, #shareplus_overlay').click(function(){
            	Plugin.prototype.close(opts);
        });

        return this;
    }


    /** #### Create Share+ (Private Method) #### */
    Plugin.prototype._create = function (target, opts)
    {

        // * Sharing services URL format list
         	var iformat = {
         	   email : "mailto:?subject={TITLE}&body={DESCRIPTION}%20{URL}",
         	   digg : "http://digg.com/submit?phase=2&url={URL}&title={TITLE}",
         	   linkedin	:	"http://www.linkedin.com/shareArticle?mini=true&url={URL}&title={TITLE}&summary={DESCRIPTION}&source=",
         	   technorati	:	"http://www.technorati.com/faves?add={URL}",
         	   delicious	:	"http://del.icio.us/post?url={URL}&title={TITLE}",
         	   yahoo	:	"http://myweb2.search.yahoo.com/myresults/bookmarklet?u={URL}&t={TITLE}",
         	   google	:	"http://www.google.com/bookmarks/mark?op=edit&bkmk={URL}&title={TITLE}",
         	   newsvine	:	"http://www.newsvine.com/_wine/save?u={URL}&h={TITLE}",
         	   reddit	:	"http://reddit.com/submit?url={URL}&title={TITLE}",
         	   live	:	"https://favorites.live.com/quickadd.aspx?marklet=1&mkt=en-us&url={URL}&title={TITLE}&top=1",
         	   facebook	:	"http://www.facebook.com/share.php?u={URL}",
         	   twitter	:	"http://twitter.com/?status={TITLE}%20-%20{URL}",
         	   stumble	:	"http://www.stumbleupon.com/submit?url={URL}&title={TITLE}",
         	   orkut	:	"http://promote.orkut.com/preview?nt=orkut.com&tt={TITLE}&du={URL}&cn={DESCRIPTION}",
         	   bebo	:	"http://www.bebo.com/c/share?Url={URL}&title={TITLE}",
         	   evernote	:	"http://s.evernote.com/grclip?url={URL}&title={TITLE}",
         	   mixx	:	"http://www.mixx.com/submit?page_url={URL}&title={TITLE}",
         	   myspace	:	"http://www.myspace.com/Modules/PostTo/Pages/?u={URL}&title={TITLE}",
         	   netvibes	:	"http://www.netvibes.com/share?title={TITLE}&url={URL}",
         	   tumblr	:	"http://www.tumblr.com/share?v=3&u={URL}&t={TITLE}&s=",
         	   friendfeed	:	"http://friendfeed.com/share/bookmarklet/frame#title={TITLE}&url={URL}",
         	   design_moo	:	"http://www.designmoo.com/node/add/drigg/?url={URL}&title={TITLE}",
         	   designfloat	:	"http://www.designfloat.com/submit.php?url={URL}&title={TITLE}",
         	   design_bump	:	"http://www.designbump.com/node/add/drigg/?url={URL}&title={TITLE}",
         	   squidoo	:	"http://www.squidoo.com/lensmaster/bookmark?{URL}",
         	   yahoo_buzz	:	"http://buzz.yahoo.com/buzz?targetUrl={URL}&headline={TITLE}&summary={DESCRIPTION}",
         	   pinterest	:	"http://pinterest.com/pin/create/button/?url={URL}&description={DESCRIPTION}",
         	   print	:	'javascript:void(0);" onClick="window.print();" target="_self',
         	   favorites	:	'javascript:void(0);" onClick="alert(\'Press ctrl + D to bookmark\');" target="_self'
         	};

         	// If no specific page to share, get the current page's details
         	var sharing_title = opts.sharetitle ? opts.sharetitle : document.title;
         	var sharing_url = opts.shareurl ? opts.shareurl : document.location.href;
         	var meta_description = $("meta[name=description]").attr("content");

        	var shareplus = $('<div id="shareplus"></div>'); // The main Share+ wrapper

        	// if display shareplus title, set title
        	if (opts.displayTitle) {
        	  var title = $('<div id="shareplus_title"><span>'+ opts.title +'</span><span id="shareplus_close"><a href="javascript:void(0);" class="shareplus_close">x</a></span></div>');
        	}

        	// add the share icons
        	var icons = $('<div id="shareplus_icons" style="height:'+ opts.height +';"></div>');

        	// if displaying Facebook like button, set the scene
        	if(opts.fbLikebox) {
        	  var fbLikebox = '<iframe src="http://www.facebook.com/plugins/like.php?href='+ encodeURIComponent(sharing_url) +'&amp;layout=button_count&amp;width=100&amp;action='+ opts.fbAction +'&amp;colorscheme='+ opts.fbcolorscheme +'&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:95px; height:21px; float:left;" allowTransparency="true"></iframe>';
        	} else {
          	var fbLikebox = '';
        	}

        	// if displaying tweet button
        	if(opts.tweets) {
        		var tweet_via = '&amp;via='+opts.tweetVia;
        	  var tweets = '<iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://platform.twitter.com/widgets/tweet_button.html?url='+ encodeURIComponent(sharing_url) +'&amp;text='+ encodeURIComponent(opts.tweetText) + '&amp;related='+ encodeURIComponent(opts.twitterRelated) + tweet_via +'" style="width:100px; height:21px; float:left;"></iframe>';
        	} else {
          	var tweets = '';
        	}

        	// if displaying google +1 button
        	if(opts.gplus) {
        	  var gplus = '<iframe allowtransparency="true" frameborder="0" scrolling="no" src="https://plusone.google.com/u/0/_/+1/fastbutton?url='+ encodeURIComponent(sharing_url) +'&amp;size=medium" style="width:85px; height:21px; float:left;"></iframe>';
        	} else {
          	 var gplus ='';
        	}

        	// if displaying pinterest 'pin' button
        	if(opts.pin) {
        		if(opts.pinMedia){
          		var pin = '<div style="width:80px; height:21px; padding: 5px; float:left;"><a data-pin-config="beside" href="http://pinterest.com/pin/create/button/?url='+ encodeURIComponent(sharing_url) +'&media='+ encodeURIComponent(opts.pinMedia) +'&description='+ encodeURIComponent(meta_description) +'" target="_blank" data-pin-do="buttonPin"><img src="http://assets.pinterest.com/images/pidgets/pin_it_button.png" /></a></div>';
        		} else {
          		var pin = '<div style="width:80px; height:21px; padding: 5px; float:left;"><a class="pin_shareplus" href="http://pinterest.com/pin/create/button/?url='+ encodeURIComponent(sharing_url) +'"><img src="http://assets.pinterest.com/images/pidgets/pin_it_button.png" /></a></div>';
        		}
        	} else {
          	var pin = '';
        	}


        	// * if have any extras (fb likebox or tweet button or +1 button or pin button)
        	if (opts.fbLikebox || opts.tweets || opts.gplus || opts.pin) {
        	  var extras = $('<div id="shareplus_extras" style="height:30px;clear:both;">' + fbLikebox + tweets + gplus + pin + '</div>');
        	}


        	shareplus.html(title); // add the title to share+
        	shareplus.append(icons, extras); // add the icons and extras to share +

        	$('body').append(shareplus); // Add share+ to body


        	// load pinterest image picker
        	$(".pin_shareplus").click(function(event){
            event.preventDefault();
            $("#pinmarklet").remove();
            var pin = document.createElement('script');
            pin.setAttribute('type','text/javascript');
            pin.setAttribute('charset','UTF-8');
            pin.setAttribute('id','pinmarklet');
            pin.setAttribute('src','http://assets.pinterest.com/js/pinmarklet.js?r='+Math.random()*99999999);
            document.body.appendChild(pin);
          });


        	// * Overlay - The dark background that appears on the background of share+
        	var overlay = $('<div id="shareplus_overlay"></div>');
        	$('body').append(overlay);


        	// ** If sticky button, add it to the page
        	if (opts.sticker) {
        		var sticker = $('<a href="javascript:void(0);" onClick="jQuery(\'.shareplus\').shareplus(\'open\');" class="shareplus"><div id="shareplus_sticker" class="'+ opts.stickerAlign +'"></div></a>');
        		$('body').append(sticker);
        	}

        	// * Get the sharing button options and add them to share+
        	var share = opts.icons.split(","); // Get buttons
        			for ( var key in share ) {
        				var services = share[key];
        				var name = services.replace(/_/gi, " ");
        				var url = iformat[services];
        				var target = opts.targetBlank ? "_blank" : "_slef"; // open on the same or new tab

        				if(url){
        					url = url.replace("{TITLE}", encodeURIComponent(sharing_title));
        					url = url.replace("{URL}", encodeURIComponent(sharing_url));
        					url = url.replace("{DESCRIPTION}", encodeURIComponent(meta_description));

        					//_gaq.push([\'_trackSocial\', \'' + name + '\', \'share\', \'' + sharing_url + '\']); alert(\'hi ' + name + sharing_url + '\');

        					var sharelink = '<a href="' + url + '" target="' + target + '" class="shareplus_icon ' + name + '"><span>' + name + '</span></a>';

        					$(sharelink).appendTo(icons); // Add share buttons
        				}
        			}


        	// Google Analytics track social sharing
        	$(".shareplus_icon").click(function(){
            if(opts.ga){
              var _gaq = _gaq || [];
              var name = $(this).text();
              _gaq.push(['_trackSocial', name, 'share', sharing_url]);
            }
          });


    } // end Plugin.prototype._create();

    // still displays share+ when there is no .shareplus class in the page
    var dummy = $('<a href="javascript:void(0);" class="shareplus" style="display:none;visibility:hidden;">Share+</a>');
    $('body').append(dummy); // fixes no .shareplus bug

    /** #### Open Share+ (PUBLIC API) #### */
    // You can call this like this manually like this: $('.shareplus').shareplus('open');
    Plugin.prototype.open = function (opts)
    {
    		if(opts == '') var opts = $(this).data();
    		var shareplus = $('#shareplus');

    		opts.open.call(this); // run open custom function
	    	$(shareplus).stop(); // stop all shareplus activity

	    	// fade in acording to set speed
	    	$("#shareplus_overlay").fadeIn(opts.speedIn);
	    	$(shareplus).fadeIn(opts.speedIn);

	    	opts.opened.call(this); // run opened custom function

	    	// ** close share+ with "esc" keypress
	    	$(document).keyup(function(e) {
          if ($(shareplus).is(":visible") && e.keyCode == 27) {
            $(".shareplus").shareplus('close');
          }   // close on esc keypress
        });

	    		// ** Make sure Share+ is in centre of screen even if window is resized
		    	var $win = $(window);
		    		//Get the window height and width
		    	var winH = $win.height();
		    	var winW = $win.width();

		    	//Set the popup window to center
		    	shareplus.css('top',  winH/2-shareplus.height()/2);
		    	shareplus.css('left', winW/2-shareplus.width()/2);

		    	// centre share when window is resized
		    	$win.resize(function() {
		    	  //Get the window height and width
		    	  var winH = $win.height();
		    	  var winW = $win.width();

		    	  //Set the popup window to center
		    	  shareplus.css('top',  winH/2-shareplus.height()/2);
		    	  shareplus.css('left', winW/2-shareplus.width()/2);
		    	});

        return this.$T;        // support jQuery chaining
    }

    /** #### Close Share+ (PUBLIC API) #### */
    // You can call this like this manually like this: $('.shareplus').shareplus('close');
    Plugin.prototype.close = function (opts)
    {

    		if(opts == '') var opts = $(this).data();
    		var shareplus = $('#shareplus');

        opts.exit.call(this); // run custom function when its closing

        // fade out acording to set speed
        $("#shareplus_overlay").fadeOut(opts.speedOut);
        shareplus.fadeOut(opts.speedOut);

        opts.exited.call(this); // run custom function when closed

        return this.$T;        // support jQuery chaining
    }




/*###################################################################################
 * JQUERY HOOK
 ###################################################################################*/

    /**
     * Generic jQuery plugin instantiation method call logic
     */
    $.fn[ PLUGIN_NS ] = function( methodOrOptions )
    {

        if (!$(this).length) {
            return $(this);
        }
        var instance = $(this).data(PLUGIN_NS);

        // CASE: action method (public method on PLUGIN class)
        if ( instance
                && methodOrOptions.indexOf('_') != 0
                && instance[ methodOrOptions ]
                && typeof( instance[ methodOrOptions ] ) == 'function' ) {

            return instance[ methodOrOptions ]( Array.prototype.slice.call( arguments, 1 ) );


        // CASE: argument is options object or empty = initialise
        } else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {

            instance = new Plugin( $(this), methodOrOptions );    // ok to overwrite if this is a re-init
            $(this).data( PLUGIN_NS, instance );
            return $(this);


        // CASE: method called before init
        } else if ( !instance ) {
            $.error( 'Share+ must be initialised before using method: ' + methodOrOptions );

        // CASE: invalid method
        } else if ( methodOrOptions.indexOf('_') == 0 ) {
            $.error( 'Method ' +  methodOrOptions + ' is private!' );
        } else {
            $.error( 'Method ' +  methodOrOptions + ' does not exist.' );
        }


    };


})(jQuery);