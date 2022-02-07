#' Generating maintrails function
#'
#' @param topography Digital terrain model (DTM) of the inventoried plot (LiDAR
#'  or SRTM) (\code{\link{DTMParacou}}) (RasterLayer)
#'
#' @param advancedloggingparameters Other parameters of the logging simulator
#'   \code{\link{loggingparameters}} (list)
#'
#' @return The maintrails outside of the topography raster (sf LINESTRING object)
#'
#' @export
#'
#' @importFrom raster res extend focal rasterToPolygons
#' @importFrom sf st_as_sf st_cast
#'
#' @examples
#' \dontrun{
#' data(DTMParacou)
#' MainTrails <- maintrailextract(DTMParacou)
#'
#' plot(DTMParacou)
#' plot(MainTrails, add = T)
#'
#' }
#'
maintrailextract <- function(topography,
                             advancedloggingparameters = loggingparameters()){

  # Arguments check

  if(!inherits(topography,"RasterLayer"))
    stop("The 'topography' arguments of the 'maintrailextract' function must be RasterLayer")

  # Variables
  fact <- DTMExtExtended <- DTMExtended <- preMainTrails <- NULL
  MainTrails <- NULL

  #function

  fact <- floor(advancedloggingparameters$SlopeDistance/res(topography)[1])

    DTMExtExtended <- extend(topography, c(fact,fact)) # extend the extent

    fill.boundaries <- function(x) {
      center = 0.5 + (fact*fact/2)
      if( is.na(x)[center] ) {
        return( round(mean(x, na.rm=T),5) )
      } else {
        return( x[center] )
      }
    }

    DTMExtended <- focal(DTMExtExtended,
                         matrix(1,fact,fact),
                         fun=fill.boundaries,
                         na.rm=F, pad=T)

    preMainTrails <- DTMExtended > -Inf
    preMainTrails<- rasterToPolygons(preMainTrails, dissolve=T)
    MainTrails <- preMainTrails %>% st_as_sf() %>% st_cast(to = 'LINESTRING', warn= FALSE)

  return(MainTrails)

}