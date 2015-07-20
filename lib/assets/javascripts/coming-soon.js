var HomepageJs = function () {
    return {
        //main function to initiate the module
        init: function () {

            $.backstretch([
                    "http://dl.dropboxusercontent.com/u/99083331/2.jpg"
    		        ], {
    		          fade: 1000,
    		          duration: 2500
    		    });	
        }
    };

}();