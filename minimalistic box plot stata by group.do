	* Tufte styled box plot by cylinder (Multiple groups)
	
	import delimited "https://raw.githubusercontent.com/tidyverse/ggplot2/master/data-raw/mpg.csv", clear

	
	levelsof cyl, local(cylinders)
	local catcount: word count `cylinders'
	forvalues i = 1/`catcount' {
		
		colorpalette tableau, nograph n(`catcount')
		local boxopt "`boxopt' box(`i', color("`r(p`i')'")) "
		
	}
	
	display `"`boxopt'"'
	
	graph box cty, 	over(cyl) ///
					by(class, ///
						row(1) legend(pos(3)) imargin(l=1.5 r=1.5) style(compact) ///
						title("{bf}Box Plot", pos(11) size(2.75)) ///
						subtitle("City Mileage over number of cylinders" " ", pos(11) size(2)) ///
						note(, size(2)) ///
					) ///
					asyvars ///
					`boxopt' ///
					boxgap(50) ///
					medtype(marker) ///
					medmarker(mcolor() mlwidth(0) msize(1)) ///
					cwhiskers ///
					alsize(0) ///
					intensity(0) ///
					lintensity(1) ///
					lines(lpattern(solid) lwidth(medium)) ///
					ylabel(, nogrid) ///
					yscale(noline) ///
					ytitle("City Mileage", size(2.25)) ///
					subtitle(, size(2.5)) /// 									//size of group headers
					legend(size(2.25) rowgap(0.25) subtitle("Cylinders", size(2.25))) ///
					scheme(white_tableau)
          

graph export "~/Desktop/Box Plot Minimalistic.png", as(png) width(3840) replace
          
          
