#' ParamCrownDiameterAllometry
#'
#' Crown diameter allometry parameters table to compute the crown diameter of each tree,
#' depend to its DBH (Diameter at Breast Height) and its species, genus or family (ref).
#' @format A tibble with 371 rows and 7 variables:
#' \describe{
#'
#'   \item{alpha}{Coefficient of the equation: ln(D) = alpha + beta ln(H*CD) + error,
#'   with error~N(0,sigma^2). D: the tree diameter, H: the tree height, CD: the tree crown diameter. Mean sigma^2 = 0.0295966977 (ref) (double)}
#'
#'   \item{beta}{Coefficient of the equation: ln(D) = alpha + beta ln(H*CD) + error,
#'   with error~N(0,sigma^2).D: the tree diameter, H: the tree height, CD: the tree crown diameter. Mean sigma^2 = 0.0295966977 (ref) (double)}
#'
#'    \item{Taxo}{Taxonomic level of the parameters for the species (character)}
#'
#'   \item{ScientificName}{Scientific name of the tree (character)}
#'
#'   \item{Genus}{Genus name (character)}
#'
#'   \item{Species}{Species name (character)}
#'
#'   \item{Family}{Family name (character)}
#'   ...
#' }
#'
"ParamCrownDiameterAllometry"