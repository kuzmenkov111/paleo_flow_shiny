fluidPage(
  # Application title and theme
  theme = shinytheme("sandstone"),
  titlePanel("Reconstructed Streamflow Explorer"),
  
###########################################################################
## Sidebar panel
###########################################################################  
  sidebarLayout(
  # Sidebar with a slider and selection inputs  
    sidebarPanel(
    	### Input for time resolution
		selectizeInput('time_resolution', 'Resolution', 
			choices = c(`Monthly` = 'monthly'),
			multiple = FALSE), 

		### Input for site location
 		selectizeInput('site_name', 'Site Location', 
 			choices = list('Utah, USA' = c(`Logan River` = '10109001', `Bear River near Utah-Wyo` = '10011500'), Other = c(`...` = 'NA')),
    		multiple = FALSE,
        	options = list(
          		placeholder = 'Please select a site below',
          		onInitialize = I('function() { this.setValue(""); }')
        	) ),     
        
   		### Input for subset
 		selectizeInput('time_subset', 'Date Subset', 
 			choices = c(`Full` = '0', `January` = '1', `February` = '2', `March` = '3', `April` = '4', `May` = '5', `June` = '6', `July` = '7', `August` = '8', `September` = '9', `October` = '10', `November` = '11', `December` = '12' ),
 			multiple = FALSE),  
             
		### Input for units
		selectizeInput('flow_units', 'Flow Units', 
			choices = c(`Mean m3/s` = 'm3s', `Mean ft3/s` = 'cfs', `Total acre-ft` = 'ac-ft'),
			multiple = FALSE),  
        
        ### Text information          
		tags$div(class="header", checked=NA,
        	tags$p("Reconstructions based on Stagge et al. (2017)."),
            tags$p("Data is based on USGS gauges at the ", tags$a(href="https://waterdata.usgs.gov/usa/nwis/uv?site_no=10109000", "Logan River"), " and the ", tags$a(href="https://waterdata.usgs.gov/usa/nwis/uv?site_no=10011500", "Bear River"))
	  		), 
      	br(),
      	helpText("Click and drag to zoom in (double click to zoom back out).")
    ),

###########################################################################
## Main panel
###########################################################################
    # Display results
    mainPanel(
     tabsetPanel(
        tabPanel("Time Series", dygraphOutput("tsPlot")),
        tabPanel("Extremes",  verbatimTextOutput('site_out')), 
        tabPanel("Goodness of Fit", tags$p("Place Holder"))
      )
    )
  )
)
