

useShinyjs()#Utilizar javascript 

fluidPage(
  tags$head(
    useShinyjs(),useSweetAlert(),
    HTML('<meta charset="UTF-8">'),
    tags$link(rel = "stylesheet", type = "text/css", href = "estilo.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "fontewesome.css")
  ),
  dashboardPage(
    dashboardHeader(title = "MyIngest"),
    dashboardSidebar(
      
      sidebarMenu(
        menuItem("Data ingestion", tabName = "dataIngestion"
                 , icon = icon("database", class = NULL, lib = "font-awesome")),
        menuItem("Sobre o projeto", tabName = "sobreProjeto",
                 icon = icon("bookmark", class = NULL, lib = "font-awesome")),
        menuItem("Registro", tabName = "registro",
                 icon = icon("copyright", class = NULL, lib = "font-awesome"))
        
      )
    ),
    
    
    
    dashboardBody(class="containerIngestData",
                  tags$div(id="loader",class="loader"),
      tabItems(
        tabItem(class="","dataIngestion",
                tags$div(width=600,
                         tags$h1("Data ingestions"),
                     actionBttn("ingestButton","Ingest data", style = "jelly")
                ),
                box(id="boxTablePreview",class="containerTable",width = "100%",
                    collapsible = T,
                    tags$h4("preview"),
                    dataTableOutput('tablePreview')
                ),
                box(class="boxes",
                    tags$h4("Host configurations (output)"),
                    a(id = "dicaTipoEntrada", "Dica",class="dica", href = "#"),
                    
                    selectInput(inputId = "TipoEntrada",
                                "Target",
                                choices = c("Elasticsearch"),
                                width = 600),
                    textInputAddon("ipTarget","", addon = "IP",value = "localhost"),
                    textInputAddon("portTarget","", addon = "Port",value = 9200),
                    actionBttn("btTestConn","test connection", style = "jelly" )
                    
                ),
                box(class="boxes",
                    tags$h4("Data type input"),
                    a(id = "dicaTipoEntrada", "Dica",class="dica", href = "#"),
                    selectInput(inputId = "inputDataType",
                                "Input type",
                                choices = c("File", "Relational DB"),
                                width = 600)
                ),
                
                
                box(id="boxInputFile", class="boxes",
                    a(id = "dicaFileRpps", "Dica",class="dica", href = "#"),
                    fileInput("file", "Select de file to ingestion",
                              multiple = FALSE,
                              buttonLabel = "brownser",
                              placeholder = "File to ingestion",
                              accept = c("text/csv",
                                         "text/comma-separated-values,text/plain",
                                         ".csv",".xlsx"))
                ),
                box(id="boxRelationalInput",class="boxes",
                    tags$h4("Data base config (input)"),
                    a(id = "dicaTipoEntrad", "Dica",class="dica", href = "#"),
                    selectInput(inputId = "TipoEntrada",
                                "Protocol",
                                choices = c("http", "https"),
                                width = 600),
                    
                    selectInput(inputId = "TipoEntrada",
                                "database",
                                choices = c("PostgreSql", "MySql"),
                                width = 600),
                    textInputAddon("ip","", addon = "IP",value = "localhost"),
                    textInputAddon("portInput","", addon = "Port",value = "5432"),
                    textInputAddon("portInput","", addon = "Port",value = "5432"),
                    textInputAddon("userDb","", addon = "DB user"),
                    textInputAddon("passwordDb","", addon = "DB password"),
                    actionBttn("btTestConnInput","test connection", style = "jelly" )
                    
                )
                
                
                
        ),
        tabItem("sobreProjeto",
                tags$h1("Sobre o projeto"),
                tags$p(class="paragrafo", "O Sadeprev – Simulador Atuarial-demográfico de Regimes Próprios de Previdência Social é um software escrito no software R (R DEVELOPMENT CORE TEAM, 2013) desenvolvido na intenção de ajudar gestores de planos previdenciários de municípios brasileiros a reconhecer possíveis superávits ou déficits atuariais nos fundos de investimento em relação ao capital demandado pelo plano a cada ano utilizando informações relacionadas ao perfil populacional dos seus servidores. Ele utiliza microssimulação para prever os valores totais de benefícios e contribuições pagas por cada participantes do plano previdenciário em cada um dos próximos 75 anos. A partir dessa previsão é feita uma análise atuarial e financeira sobre a situação do RPPS."),
                tags$p(class="paragrafo","Seu desenvolvimento se iniciou para a elaboração da tese de doutorado em demografia de Cristiane Silva Corrêa, mas contou com a participação de alunos e professores dos cursos de graduação em Ciências Atuariais, Estatística e Tecnologia da Informação da UFRN e da UFMG, no âmbito do projeto “Desenvolvendo a gestão de RPPS: um programa para auxílio dos gestores de previdência de servidores públicos” financiado pelo Programa de Apoio à Extensão Universitária MEC/SESu 2016 sob coordenação da professora Cristiane Silva Corrêa. O Sadeprev está registrado no INPI sob os direitos da UFRN, podendo ser utilizado gratuitamente  por qualquer pessoa. É vedada qualquer modificação em sua estrutura que não seja realizada em parceria com a UFRN.
                       ")
                
                ),
        tabItem("registro",
                fluidPage(
                  tags$img( class="imgRegistro",src = "registro.jpg")
                )
        )
      )
      )
)


)

