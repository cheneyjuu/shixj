jQuery.noConflict();

var menuState = 1;
jQuery(document).ready(function(){

    // Metro Slider Starts
    var metroSlider = 0;
    jQuery('.metro-slider .col').each(function(){
        metroSlider = metroSlider + 670;
    });
    jQuery('.metro-slider').css('width',metroSlider+'px');

    jQuery('.metro-wrapper').tinyscrollbar({
        axis: 'x',
        size: 'auto'
    });
    // Metro Slider Ends


    // Side Menu Opener Starts
    jQuery('#opener').click(function(){

        var subLevel = jQuery('#subLevel');
        var activeMenu = jQuery('.active-menu-item');

        if(subLevel.hasClass('active-sub-level')){

            if(activeMenu.length > 0){

                activeMenu.removeClass('active-menu-item background-color');
                subLevel.children('ul').fadeOut('fast');

            }

            subLevel.removeClass('active-sub-level');
            jQuery(this).children('div').removeClass('opener-minus').addClass('opener-plus');

        }else{

            subLevel.addClass('active-sub-level');
            jQuery(this).children('div').removeClass('opener-plus').addClass('opener-minus');

        }

    });
    // Side Menu Opener Ends

	// Hover Tabs Metro starts
	jQuery('.random-blog-item').hover(
		function () {
			jQuery(this).addClass('background-color');
		},
		function () {
			jQuery(this).removeClass('background-color');
		}
	);
	//Hover Tabs Metro ends
	
    // Responsive Menu Starts
    jQuery('ul#menu > li > .menu-specs > a').on('click touchend',function(e){


        var link        = jQuery(this).attr('href');
        var li          = jQuery(this).parent('div').parent('li');
        var regExp      = /\#/g;
        var bodyWidth   = parseInt( jQuery('body').css('width').replace('px') );

        if(regExp.test(link)){

            if(bodyWidth > 800){

                if(!li.hasClass('active-menu-item')){

                    jQuery('.active-menu-item').removeClass('active-menu-item background-color');
                    li.addClass('active-menu-item background-color');

                    if(jQuery('.active-sub-level').length < 1){

                        jQuery('#opener').click();

                    }

                    jQuery('.active-sub-level ul').hide();
                    jQuery(link).fadeIn()

                }

            }else{

                if(li.children('ul').css('display') == 'block'){
                    li.children('ul').slideUp();
                }else{
                    jQuery('ul#menu > li > ul').slideUp();
                    li.children('ul').slideDown();
                }

            }

            e.preventDefault();

        }

    });
    // Responsive Menu Ends

    // Accordion Menu Starts
    jQuery('.accordion-head').click(function(){

        var theToggler  = jQuery(this).children('.accordion-toggler');
        var theText     = jQuery(this).next('.accordion-text');
        var activeItem  = jQuery('.active-item');

        if(theToggler.hasClass('active-item')){

            theToggler.removeClass('active-item');
            theText.slideUp();

        }else{

            activeItem.parent('.accordion-head').next('.accordion-text').slideUp();
            activeItem.removeClass('active-item');

            theToggler.addClass('active-item');
            theText.slideDown();
        }

    });
    // Accordion Menu Ends

    // Sideway Tabbed Content Starts
    jQuery('.sideway-controls li').click(function(){

        var theToggler  = jQuery(this).attr('data-sideway-index');
        var activeOne   = jQuery('.active-sideway-item');

        if(!jQuery(this).hasClass('active-sideway-item')){

            activeOne.removeClass('active-sideway-item');
            jQuery('.active-sideway-content').removeClass('active-sideway-content');

            jQuery(this).addClass('active-sideway-item');
            jQuery('.sideway-description-content:nth-child('+theToggler+')').addClass('active-sideway-content');

        }

    });
    // Sideway Tabbed Content Ends

    // Tabbed Content Starts
    jQuery('.tab-links').children('a').addClass('not-active');
    jQuery('.tab-links').children('a:first-child').removeClass('not-active').addClass('active');

    jQuery('.tab-links a').click(function(e){
        switchTabs(jQuery(this));
        e.preventDefault();
    });
    // Tabbed Content Ends

    // Left Side Search Box Starts
    var bodyHeight = parseInt( jQuery('.rightSide').css('height').replace('px','') );

    if(bodyHeight < 645){

        jQuery('.search-and-misc').css('position','relative').css('margin-top','20px');

    }
    // Left Side Search Box Ends

	//classes - komento in article details view
	if( jQuery('#section-kmt a') ){
		jQuery('#section-kmt a').addClass('color');
		jQuery('a[href="http://stackideas.com"]').addClass('color');
	}
	//classes - komento in blog view
	if( jQuery('.kmt-readon a') ){
		jQuery('.kmt-readon a').addClass('color');
		jQuery('a[href="http://stackideas.com"]').addClass('color');
	}
	//classes - komento comments module
	if( jQuery('.modKomentoComments a') ){
		jQuery('.modKomentoComments a').addClass('color');
	}
	//classes - search component
	if( jQuery('#searchForm button[name="Search"]') ){
		jQuery('#searchForm button[name="Search"]').addClass('background-color gray-box-submit comment-sender');
	}
	if( jQuery('#searchForm #search-searchword') ){
		jQuery('#searchForm #search-searchword').addClass('gray-box-input comment-text contact-long');
	}
	if( jQuery('#searchForm label[for="search-searchword"]') ){
		jQuery('#searchForm label[for="search-searchword"]').css({'display':'none'});
	}
	if( jQuery('.search-results') ){
		jQuery('.search-results a').addClass('color');
	}
	if( jQuery('.search-results') ){
		jQuery('.pagination ul').addClass('blog-paging');
		jQuery('.pagination ul li a').addClass('background-color');
		jQuery('.pagination ul li span').addClass('background-color-gray');
		jQuery('.items-more ol li a, .cat-children ul li a').addClass('color');
	}
});

// Tab Switcher Starts
function switchTabs(tab){

    var parent = tab.parent('.tab-links').parent('.tabs');

    parent.children('.tab-links').children('a.active').removeClass('active').addClass('not-active');
    tab.removeClass('not-active').addClass('active');

    parent.children('.contents').children('article').css('display','none');
    parent.children('.contents').children('article'+tab.attr('href')).css('display','block');

}
// Tab Switcher Ends

jQuery(window).load(function(){

    jQuery('body').css('visibility','visible');

    // OUR PARTNERS Carousel Starts
    if(jQuery(".partners-carousel-images").length > 0){

        jQuery(".partners-carousel-images").carouFredSel({
            items: {visible : 6, width: 151, height : 100},
            direction: 'left',
            responsive: false,
            scroll: {
                items: 1,
                easing: 'elastic',
                duration: 1000,
                pauseOnHover: true
            },
            prev	: {
                button	: "#carousel-directioner-prev",  // The button which will trigger direction to left
                key		: "left"
            },
            next	: {
                button	: "#carousel-directioner-next",  // The button which will trigger direction to right
                key		: "right"
            }
        });

    }
    // OUR PARTNERS Carousel Ends

    widthCalc();

    // Isotope Options & Controls
    var $container = jQuery('.gallery');

    $container.isotope({
        // options
        itemSelector : '.columns',
        layoutMode : 'fitRows'
    });


    // filter items when filter link is clicked
    jQuery('#filters li a').click(function(){
        jQuery('.active-isotope').removeClass('background-color border-color-darker active-isotope');
        jQuery(this).addClass('background-color border-color-darker active-isotope');
        var selector = jQuery(this).attr('data-filter');
        $container.isotope({ filter: selector });
        return false;
    });

});

jQuery(window).resize(function(){

    widthCalc();

    // Metro Slider Responsiveness Fix Starts
    jQuery('.metro-wrapper').tinyscrollbar({
        axis: 'x',
        size: 'auto'
    });
    // Metro Slider Responsiveness Fix Ends

});

function widthCalc(){

    if(jQuery('body').width() < 801){
        jQuery('.rightSide').css('width','100%').css('width',(jQuery('body').width()-10)+'px');
    }else{
        jQuery('.rightSide').css('width','100%').css('width',(jQuery('body').width()-255)+'px');
    }

    jQuery('#menu > li > ul > li').css('width', (jQuery('#menu > li').width()-20) +'px');
    jQuery('#subLevel').css('height', '100%').css('height','-=5px');
    jQuery('.lines').css('width', '100%').css('width','-=275px');
    jQuery('.gray-box').css('width', '100%').css('width','-=40px');
    jQuery('.gray-box-input').css('width', '100%').css('width','-=227px');
    jQuery('.caroufredsel_wrapper').css('width', '77%').css('width','-=51px');
    jQuery('.footer').css('width', '100%').css('width','+=10px');
    jQuery('.accordion-title').css('width', '100%').css('width','-=40px');
    /*jQuery('.sideway-description').css('width', '100%').css('width','-=260px');*/
    /*jQuery('.random-blog-item').css('width', '100%').css('width','-=20px');*/
    jQuery('.random-blog-title').css('width', '100%').css('width','-=60px');
    jQuery('.random-blog-descr').css('width', '100%').css('width','-=60px');
    jQuery('.comments').css('width', '100%').css('width','-=20px');
    jQuery('.name-and-message').css('width', '100%').css('width','-=50px');
    jQuery('.sub-comment').css('width', '100%').css('width','-=20px');
    jQuery('.sub-comment .name-and-message').css('width', '100%').css('width','-=65px');
    jQuery('.tabs .contents .article').css('width', '100%').css('width','-=30px');
    jQuery('.message-box').css('width', '100%').css('width','-=5px');
    jQuery('.message-text').css('width', '100%').css('width','-=80px');
    jQuery('.portfolio-title').css('width', '90%');
    jQuery('.portfolio-subtitle').css('width', '90%');
    jQuery('.metro-misc').css('width', '100%').css('width','-=71px');

}

function closeThis(menu){
    menu.slideUp();
}

// Back to top Starts
jQuery(function() {
    jQuery(window).scroll(function() {
        if(jQuery(this).scrollTop() != 0) {
            jQuery('#toTop').fadeIn('slow');
        } else {
            jQuery('#toTop').fadeOut('slow');
        }
    });

    jQuery('#toTop').click(function() {
        jQuery('body,html').animate({scrollTop:0},800);
    });
});
// Back to top Ends

function vgChangeTab( tabid, containerid ){

    /*jQuery('.' + containerid + ' .vg-this-is-a-tab').css({'display':'none'});
	jQuery('.' + containerid + ' .' + tabid ).css({'display':'block'});*/
	
	jQuery('.' + containerid + ' .vg-this-is-a-tab').css({'display':'none'});
	jQuery('.' + containerid + ' .' + tabid ).stop(true, true).fadeIn({ duration: '1000', queue: false }).slideDown('1000');
	jQuery('.' + containerid + ' .' + tabid ).css({'display':'inline-table'});
	
	jQuery('.' + containerid + ' .comment-title').removeClass('deactive');
	jQuery('#' + tabid).addClass('deactive');
	
	//alert( tabid );

}

/*function setHeightScrollBar1(){
	jQuery('#scrollbar1 .viewport').height();
}
alert(setHeightScrollBar1());*/
//#scrollbar1 .viewport