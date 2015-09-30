calculateAspectRatioFit : function(srcWidth, srcHeight) {

        var ratio = [300 / srcWidth, 300 / srcHeight ];
        ratio = Math.min(ratio[0], ratio[1]);

        return { width:srcWidth*ratio, height:srcHeight*ratio };
     },