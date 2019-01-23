# Define server logic required to draw a histogram
server <- function(input, output, session) {
  shinyjs::hide(id = "loader")
  shinyjs::onclick("dicaTipoEntrada",showModal(modalDicas("dica da mizura")))
  shinyjs::hide(id = "boxTablePreview", anim = TRUE)

  observe({

    if(input$inputDataType == "File"){
      shinyjs::show(id = "boxInputFile", anim = TRUE)
      shinyjs::hide(id = "boxRelationalInput", anim = TRUE)
    }else{
      shinyjs::hide(id = "boxInputFile", anim = TRUE)
      shinyjs::show(id = "boxRelationalInput", anim = TRUE)
    }
  })
  
  
  
  
  #verify input file
  observeEvent(input$file, {
    if(!is.null(input$file)){
     # print(read.csv(file=input$file$datapath, header=TRUE, sep=","))
      table = read.csv(file=input$file$datapath, header=TRUE, sep=",")
      output$tablePreview <- renderDataTable(table, options = list(pageLength = 10))
      shinyjs::show(id = "boxTablePreview", anim = TRUE)
      
    }
  })
  
  
  
  
  observeEvent(input$ingestButton, {
    
    #shinyjs::hide(id = "loader", anim = TRUE)
    shinyjs::show(id = "loader")
    
  })
  
  #test connection
  
  observeEvent(input$btTestConn, {
    tryCatch({
      shinyjs::show(id = "loader")
      GET(paste("http://",input$ipTarget,":",input$portTarget,sep = ""))
      
      sendSweetAlert(
        session = session,text = "",
        title ="Connected with server!",
        type = "success"
      )
      shinyjs::hide(id = "loader")
    },error = function(e){
      sendSweetAlert(
        session = session,text = "",
        title ="it was not possibly to connect with server",
        type = "error"
      )
      shinyjs::hide(id = "loader")
    })
    
    
    
    
  })
  
  
}